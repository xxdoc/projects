Attribute VB_Name = "JMacroCore"
Option Explicit

'//cprin 5June2007:
Dim IsWindowsVista As Boolean

Public LastDelayValue As Long

'element 0 = macropath
'element 1 = playlog
'element 2 = there is a paused macro or not

Public PlayBackPauseForValerie_Dion(3) As Variant

'element 0 = macropath
'element 1 = EventLog
'element 2 = there is a paused recording or not

Public RecordPauseForValerie_Dion(3) As Variant

'How to record Macro:
'1.call startrecord
'2.call stopmacro

'How to playback Macro:
'1.openmacro
'2.call startplay
'3.call watchforcanvel

'Hook Constants
Private Const WH_KEYBOARD = 2
Private Const WH_JOURNALRECORD = 0
Private Const WH_JOURNALPLAYBACK = 1

'Hook Call Constants
Private Const HC_SKIP = 2
Private Const HC_ACTION = 0
Private Const HC_GETNEXT = 1
Private Const VK_MENU = &H12
Private Const PM_REMOVE = &H1
Private Const VK_CONTROL = &H11
Private Const HC_SYSMODALON = 4
Private Const HC_SYSMODALOFF = 5
Private Const GWL_HINSTANCE = (-6)
Private Const KEYEVENTF_KEYUP = &H2
Private Const WM_CANCELJOURNAL = &H4B

'window pos
Const HWND_TOP = 0
Const SWP_NOSIZE = &H1
Const SWP_NOMOVE = &H2
Const HWND_TOPMOST = -1
Const HWND_NOTOPMOST = -2
Const SWP_NOACTIVATE = &H10
Const SWP_SHOWWINDOW = &H40

Private Const VK_LWIN = &H5B


Public Type POINTAPI
        X As Long
        Y As Long
End Type

Private Type Msg
    hWnd As Long
    message As Long
    wParam As Long
    lParam As Long
    time As Long
    pt As POINTAPI
End Type

Public Type EVENTMSG
        message As Long
        paramL As Long
        paramH As Long
        time As Long
        hWnd As Long
End Type

Private Declare Function WaitMessage Lib "user32" () As Long
Private Declare Function GetTickCount Lib "kernel32" () As Long
Public Declare Function GetAsyncKeyState Lib "user32" (ByVal vKey As Long) As Integer
Public Declare Function PathFileExists Lib "shlwapi.dll" Alias "PathFileExistsA" (ByVal pszPath As String) As Long
Private Declare Function SetForegroundWindow Lib "user32" (ByVal hWnd As Long) As Long
Private Declare Function UnhookWindowsHookEx Lib "user32" (ByVal hHook As Long) As Long
Private Declare Function EnumWindows Lib "user32" (ByVal lpEnumFunc As Long, ByVal lParam As Long) As Boolean
Private Declare Function SetWindowsHookEx Lib "user32" Alias "SetWindowsHookExA" (ByVal idHook As Long, ByVal lpfn As Long, ByVal hmod As Long, ByVal dwThreadId As Long) As Long
Private Declare Sub keybd_event Lib "user32" (ByVal bVk As Byte, ByVal bScan As Byte, ByVal dwFlags As Long, ByVal dwExtraInfo As Long)
Declare Function GetWindowTextLength Lib "user32" Alias "GetWindowTextLengthA" (ByVal hWnd As Long) As Long
Private Declare Function CallNextHookEx Lib "user32" (ByVal hHook As Long, ByVal nCode As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Private Declare Function PeekMessage Lib "user32" Alias "PeekMessageA" (lpMsg As Msg, ByVal hWnd As Long, ByVal wMsgFilterMin As Long, ByVal wMsgFilterMax As Long, ByVal wRemoveMsg As Long) As Long
Private Declare Sub CopyMemoryT2H Lib "kernel32" Alias "RtlMoveMemory" (ByVal Dest As Long, Source As EVENTMSG, ByVal Length As Long)
Private Declare Sub CopyMemoryH2T Lib "kernel32" Alias "RtlMoveMemory" (Dest As EVENTMSG, ByVal Source As Long, ByVal Length As Long)
Private Declare Function GetWindowText Lib "user32" Alias "GetWindowTextA" (ByVal hWnd As Long, ByVal lpString As String, ByVal cch As Long) As Long
Private Declare Sub SetWindowPos Lib "user32" (ByVal hWnd As Long, ByVal hWndInsertAfter As Long, ByVal X As Long, ByVal Y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long)
Private Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long
Private Declare Function SetRect Lib "user32" (lpRect As RECT, ByVal X1 As Long, ByVal Y1 As Long, ByVal X2 As Long, ByVal Y2 As Long) As Long
Private Declare Function MoveWindow Lib "user32" (ByVal hWnd As Long, ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal bRepaint As Long) As Long
Private Declare Function AllowSetForegroundWindow Lib "user32.dll" (ByVal dwProcessId As Long) As Long
Private Declare Function GetWindowThreadProcessId Lib "user32" (ByVal hWnd As Long, lpdwProcessId As Long) As Long


Private MacroName
Private MacroPath
Private recOK As Long
Private hHook As Long
Private hPlay As Long
Private sEXT As String
Private Pos As POINTAPI
Private PlayLog As Long
Private EventLog As Long
Private bDelay As Boolean
Private canPlay As Boolean
Private lStartTime As Long
Private ParenthWnd As Long
Private lbstarttime As Long
Public bPlaying As Boolean
Private bKeyStop As Boolean
Private sFileName As String
Private iFileNumber As String
Private bRecording As Boolean
Private EventArr() As EVENTMSG

'//cprin 7Aug2006: added next line to declare a var. that will store
'//the macro events for editing using OpenMacro for editing function
Private EventArrForEditing() As EVENTMSG

Private InfoArray() As WinInfo ''
Private UniqueTitles() As String ''

Dim InfoElement As WinInfo ''

Public MacrosName As String ''

Public Function IsPlayingMode() As Boolean
       
       IsPlayingMode = bPlaying

End Function

Public Function IsRecordingMode() As Boolean
       
       IsRecordingMode = bRecording

End Function

Public Sub OpenMacro(FileName As String, Optional MacroNam As String)
On Error GoTo fin

Dim bHotKey
Dim sfilter As String
Dim message As String
Dim FileLength As Long

sEXT = ".pmf"

sfilter = "Macro Files (*" & sEXT & ")" & vbNullChar & "*" & sEXT & vbNullChar & "All Files (*.*)" & vbNullChar & "*.*"

iFileNumber = FreeFile()

If bHotKey = False Then
    sFileName = FileName
End If

If sFileName <> vbNullChar Then
    
     ReDim EventArr(0)
      
     MacrosName = MacroNam
     
     PlayBackPauseForValerie_Dion(0) = sFileName
        
      '//cprin 7Aug2006: Uncomment the next line to enable Smart Playback
      '//Search for the word Smart Playback to get the remaining Lines.
'     Fill2Arrays MacrosName
     
     Open sFileName For Random Access Read As iFileNumber Len = Len(EventArr(0))
        
        FileLength = 1
        
        Do
            
            ReDim Preserve EventArr(FileLength - 1)
            
            Get #iFileNumber, FileLength, EventArr(FileLength - 1)
            
            Debug.Print EventArr(FileLength - 1).message, EventArr(FileLength - 1).time
            
            FileLength = FileLength + 1
        
        Loop Until EOF(iFileNumber)
        
        EventLog = FileLength - 2
    
    Close iFileNumber


 
Else
   
  

End If

Exit Sub

fin:
Select Case Err.Number
    Case Else
        MsgBox Err.Number & " OpenMacro " & Err.Description 'koko1
End Select

End Sub
'//cprin 7Aug2006: added next function to open a macro for editing "called from frmEdit"
'//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
Public Sub OpenMacroForEditing(FileName As String, Optional MacroNam As String)
'//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
'============================================================

' Routine Name: OpenMacroForEditing
' Description: OpenMacroForEditing Description
' Author: Ahmed Saad
' Date: 07/08/06 11:51:29 �
' Copyright � 2006  Perfection Tools Software
' Notes:

' Modification History:

'============================================================

    On Error GoTo OpenMacroForEditingErr
    
    Dim bHotKey

    Dim message As String
    Dim FileLength As Long
    
    iFileNumber = FreeFile()
    
    If bHotKey = False Then
        sFileName = FileName
    End If
    
    LastDelayValue = 0
    
    If FileName <> vbNullChar Then
        
         ReDim EventArrForEditing(0)
          
        Open FileName For Random Access Read As iFileNumber Len = Len(EventArrForEditing(0))
            
            FileLength = 1
            Do
                
                ReDim Preserve EventArrForEditing(FileLength - 1)
                
                Get #iFileNumber, FileLength, EventArrForEditing(FileLength - 1)
                
                Dim CurItem As ListItem
                '//cprin 28Aug2006: added next Select Case to load CommandsListView with the file data
                Select Case EventArrForEditing(FileLength - 1).message
                    'Mouse Event [Six Mouse Events]''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
                    Case WM_MOUSEMOVE
                    
                        If FileLength = 1 Then '//if this is the first event then pass Event time as 0
                            
                            AddMouseEvent "Move", EventArrForEditing(FileLength - 1), FileLength - 1 '//Insert a mouse event into the listview.
                        
                        Else '//else then pass the prev event time as PrevTime parameter
                            
                            If EventArrForEditing(FileLength - 1).time - EventArrForEditing(FileLength - 2).time > 0 Then
                          
                               AddDelayEvent "Delay", EventArrForEditing(FileLength - 1), FileLength - 1, EventArrForEditing(FileLength - 2).time    '//Insert a mouse event into the listview.
                              
                               FileLength = FileLength + 1
                          
                               ReDim Preserve EventArrForEditing(FileLength - 1)
                               
                               Get #iFileNumber, FileLength, EventArrForEditing(FileLength - 1)
                            
                            End If
                                 
                            AddMouseEvent "Move", EventArrForEditing(FileLength - 1), FileLength - 1, EventArrForEditing(FileLength - 2).time     '//Insert a mouse event into the listview.

                         End If
                    
                    Case WM_LBUTTONDOWN
                        If FileLength = 1 Then '//if this is the first event then pass Event time as 0
                           AddMouseEvent "Left Button Down", EventArrForEditing(FileLength - 1), FileLength - 1 '//Insert a mouse event into the listview.
                        Else
                           
                           If EventArrForEditing(FileLength - 1).time - EventArrForEditing(FileLength - 2).time > 0 Then
                          
                               AddDelayEvent "Delay", EventArrForEditing(FileLength - 1), FileLength - 1, EventArrForEditing(FileLength - 2).time   '//Insert a mouse event into the listview.
                          
                               FileLength = FileLength + 1
                          
                               ReDim Preserve EventArrForEditing(FileLength - 1)
                               
                               Get #iFileNumber, FileLength, EventArrForEditing(FileLength - 1)
                            
                           End If
                               
                          AddMouseEvent "Left Button Down", EventArrForEditing(FileLength - 1), FileLength - 1, EventArrForEditing(FileLength - 2).time '//Insert a mouse event into the listview.
                           
                        End If
                    Case WM_LBUTTONUP
                       If FileLength = 1 Then '//if this is the first event then pass Event time as 0
                           AddMouseEvent "Left Button Up", EventArrForEditing(FileLength - 1), FileLength - 1, 0 '//Insert a mouse event into the listview.
                       Else
                           
                           If EventArrForEditing(FileLength - 1).time - EventArrForEditing(FileLength - 2).time > 0 Then
                          
                               AddDelayEvent "Delay", EventArrForEditing(FileLength - 1), FileLength - 1, EventArrForEditing(FileLength - 2).time   '//Insert a mouse event into the listview.
                          
                               FileLength = FileLength + 1
                          
                               ReDim Preserve EventArrForEditing(FileLength - 1)
                               
                               Get #iFileNumber, FileLength, EventArrForEditing(FileLength - 1)
                            
                           End If
                           
                           AddMouseEvent "Left Button Up", EventArrForEditing(FileLength - 1), FileLength - 1, EventArrForEditing(FileLength - 2).time '//Insert a mouse event into the listview.
                       End If
                    Case WM_MOUSEWHEEL
                       If FileLength = 1 Then '//if this is the first event then pass Event time as 0
                           AddMouseEvent "Wheel", EventArrForEditing(FileLength - 1), FileLength - 1, 0 '//Insert a mouse event into the listview.
                       Else
                           If EventArrForEditing(FileLength - 1).time - EventArrForEditing(FileLength - 2).time > 0 Then
                          
                               AddDelayEvent "Delay", EventArrForEditing(FileLength - 1), FileLength - 1, EventArrForEditing(FileLength - 2).time   '//Insert a mouse event into the listview.
                          
                               FileLength = FileLength + 1
                          
                               ReDim Preserve EventArrForEditing(FileLength - 1)
                               
                               Get #iFileNumber, FileLength, EventArrForEditing(FileLength - 1)
                            
                           End If
                           
                           AddMouseEvent "Wheel", EventArrForEditing(FileLength - 1), FileLength - 1, EventArrForEditing(FileLength - 2).time '//Insert a mouse event into the listview.
                       End If
                    Case WM_RBUTTONDOWN
                       If FileLength = 1 Then '//if this is the first event then pass Event time as 0
                          AddMouseEvent "Right Button Down", EventArrForEditing(FileLength - 1), FileLength - 1, 0 '//Insert a mouse event into the listview.
                       Else
                           
                           If EventArrForEditing(FileLength - 1).time - EventArrForEditing(FileLength - 2).time > 0 Then
                          
                               AddDelayEvent "Delay", EventArrForEditing(FileLength - 1), FileLength - 1, EventArrForEditing(FileLength - 2).time   '//Insert a mouse event into the listview.
                          
                               FileLength = FileLength + 1
                          
                               ReDim Preserve EventArrForEditing(FileLength - 1)
                               
                               Get #iFileNumber, FileLength, EventArrForEditing(FileLength - 1)
                            
                           End If
                           
                           AddMouseEvent "Right Button Down", EventArrForEditing(FileLength - 1), FileLength - 1, EventArrForEditing(FileLength - 2).time '//Insert a mouse event into the listview.
                       End If
                    Case WM_RBUTTONUP
                       If FileLength = 1 Then '//if this is the first event then pass Event time as 0
                          AddMouseEvent "Right Button Up", EventArrForEditing(FileLength - 1), FileLength - 1, 0 '//Insert a mouse event into the listview.
                       Else
                          
                           If EventArrForEditing(FileLength - 1).time - EventArrForEditing(FileLength - 2).time > 0 Then
                          
                               AddDelayEvent "Delay", EventArrForEditing(FileLength - 1), FileLength - 1, EventArrForEditing(FileLength - 2).time   '//Insert a mouse event into the listview.
                          
                               FileLength = FileLength + 1
                          
                               ReDim Preserve EventArrForEditing(FileLength - 1)
                               
                               Get #iFileNumber, FileLength, EventArrForEditing(FileLength - 1)
                            
                           End If
                          
                          AddMouseEvent "Right Button Up", EventArrForEditing(FileLength - 1), FileLength - 1, EventArrForEditing(FileLength - 2).time '//Insert a mouse event into the listview.
                       End If
                    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
                    'Keyboard Events [4 Keyboard Events]'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
                    Case WM_KEYUP
                       If FileLength = 1 Then '//if this is the first event then pass Event time as 0
                          AddKeyboardEvent "Key Up", EventArrForEditing(FileLength - 1), FileLength - 1 '//Insert a keyboard event into the listview.
                       Else
                          
                           If EventArrForEditing(FileLength - 1).time - EventArrForEditing(FileLength - 2).time > 0 Then
                          
                               AddDelayEvent "Delay", EventArrForEditing(FileLength - 1), FileLength - 1, EventArrForEditing(FileLength - 2).time   '//Insert a mouse event into the listview.
                          
                               FileLength = FileLength + 1
                          
                               ReDim Preserve EventArrForEditing(FileLength - 1)
                               
                               Get #iFileNumber, FileLength, EventArrForEditing(FileLength - 1)
                            
                           End If
                          
                          AddKeyboardEvent "Key Up", EventArrForEditing(FileLength - 1), FileLength - 1, EventArrForEditing(FileLength - 2).time       '//Insert a keyboard event into the listview.
                       End If
                    Case WM_KEYDOWN
                       If FileLength = 1 Then '//if this is the first event then pass Event time as 0
                          AddKeyboardEvent "Key Down", EventArrForEditing(FileLength - 1), FileLength - 1 '//Insert a keyboard event into the listview.
                       Else
                          
                           If EventArrForEditing(FileLength - 1).time - EventArrForEditing(FileLength - 2).time > 0 Then
                          
                               AddDelayEvent "Delay", EventArrForEditing(FileLength - 1), FileLength - 1, EventArrForEditing(FileLength - 2).time   '//Insert a mouse event into the listview.
                          
                               FileLength = FileLength + 1
                          
                               ReDim Preserve EventArrForEditing(FileLength - 1)
                               
                               Get #iFileNumber, FileLength, EventArrForEditing(FileLength - 1)
                            
                           End If
                          
                          AddKeyboardEvent "Key Down", EventArrForEditing(FileLength - 1), FileLength - 1, EventArrForEditing(FileLength - 2).time '//Insert a keyboard event into the listview.
                       End If
                    Case WM_SYSKEYDOWN
                       If FileLength = 1 Then '//if this is the first event then pass Event time as 0
                          AddKeyboardEvent "System Key Down", EventArrForEditing(FileLength - 1), FileLength - 1 '//Insert a keyboard event into the listview.
                       Else
                          
                           If EventArrForEditing(FileLength - 1).time - EventArrForEditing(FileLength - 2).time > 0 Then
                          
                               AddDelayEvent "Delay", EventArrForEditing(FileLength - 1), FileLength - 1, EventArrForEditing(FileLength - 2).time   '//Insert a mouse event into the listview.
                          
                               FileLength = FileLength + 1
                          
                               ReDim Preserve EventArrForEditing(FileLength - 1)
                               
                               Get #iFileNumber, FileLength, EventArrForEditing(FileLength - 1)
                            
                           End If
                          
                          AddKeyboardEvent "System Key Down", EventArrForEditing(FileLength - 1), FileLength - 1, EventArrForEditing(FileLength - 2).time '//Insert a keyboard event into the listview.
                       End If
                    Case WM_SYSKEYUP
                       If FileLength = 1 Then '//if this is the first event then pass Event time as 0
                          AddKeyboardEvent "System Key Up", EventArrForEditing(FileLength - 1), FileLength - 1 '//Insert a keyboard event into the listview.
                       Else
                          
                           If EventArrForEditing(FileLength - 1).time - EventArrForEditing(FileLength - 2).time > 0 Then
                          
                               AddDelayEvent "Delay", EventArrForEditing(FileLength - 1), FileLength - 1, EventArrForEditing(FileLength - 2).time   '//Insert a mouse event into the listview.
                          
                               FileLength = FileLength + 1
                          
                               ReDim Preserve EventArrForEditing(FileLength - 1)
                               
                               Get #iFileNumber, FileLength, EventArrForEditing(FileLength - 1)
                            
                           End If
                          
                          AddKeyboardEvent "System Key Up", EventArrForEditing(FileLength - 1), FileLength - 1, EventArrForEditing(FileLength - 2).time '//Insert a keyboard event into the listview.
                       End If
                    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
                End Select
                
                FileLength = FileLength + 1
                
            Loop Until EOF(iFileNumber)
            
            EventLog = FileLength - 2
        
        Close iFileNumber
    
    Else
       
    End If

OpenMacroForEditingExit:
    On Error Resume Next

    Exit Sub
    
OpenMacroForEditingErr:

    '//0x0ffee12 is a unique number for OpenMacroForEditing because i don't want to write
    '//the function name in the error message display to the User for 2 reasons
    '//1.It is my internal structure
    '//2.May be Function name will be useful in Reverse engineering "may be"
    SysError Err, "0x0ffee12"

GoTo OpenMacroForEditingExit

End Sub

Private Sub SaveMacro(Optional MacroName As String)
On Error GoTo fin

Dim projectpath
Dim iIndex As Long
Dim sfilter As String

sEXT = ".pmf"

sfilter = "Macro Files (*" & sEXT & ")" & vbNullChar & "*" & sEXT & vbNullChar & "All Files (*.*)" & vbNullChar & "*.*"

iFileNumber = FreeFile()

DoEvents

If MacroName = "" Then
    
   '//cprin 17July2006: changed next line to display a well form of MsgBox
   'MsgBox "you didn't Enter a name for the Macro", vbCritical, App.Title
   MsgBox "Enter a name for the Macro or click cancel.", vbCritical, App.Title
   
   Exit Sub

End If

If right(App.Path, 1) <> "\" Then projectpath = App.Path + "\" Else projectpath = App.Path

projectpath = projectpath & "Data\" & MacroName & sEXT

sFileName = projectpath 'ShowSave(frmmangmacro.hwnd, True, sfilter)

'//cprin 7Aug2006: Uncomment the next line to enable Smart Playback
'//Search for the word Smart Playback to get the remaining Lines.
'SaveWinInfoArray MacroName

If sFileName <> vbNullChar Then
    
    If Mid(right(sFileName, 4), 1, 1) <> "." Then
        
        sFileName = sFileName & sEXT
    
    End If
    
    If Len(Dir(sFileName)) > 0 Then
        
        Kill sFileName
    
    End If
    
    MacroPath = sFileName
    
    Open sFileName For Random Access Write As iFileNumber Len = Len(EventArr(EventLog))
        
        
        For iIndex = 1 To EventLog '- 100
        

'Bad record length (Error 59) will not genereted because all members in EventArr are long type
'this error occur only if
'any of the members are String Type and you didn'y specify a length for it like this
'dim sdkfa as string * 30
 Put iFileNumber, iIndex, EventArr(iIndex - 1)
        
        Next iIndex
    
    Close iFileNumber

End If

Exit Sub

fin:

Select Case Err.Number
    
    Case Else

        MsgBox Err.Number & " SaveMacro " & Err.Description, vbCritical, SoftwareName

End Select

End Sub


Private Function JournalRecordProc(ByVal iCode As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
On Error GoTo fin
Dim M As Msg
Dim Result As Long
Dim sMsg As String

ReDim Preserve EventArr(EventLog)

recOK = 1

Result = 0

If iCode < 0 Then
    
    Result = CallNextHookEx(hHook, iCode, wParam, lParam)

ElseIf iCode = HC_SYSMODALON Then
    
    recOK = 0

ElseIf iCode = HC_SYSMODALOFF Then
    
    recOK = 1

ElseIf ((recOK > 0) And (iCode = HC_ACTION)) Then
    
    If CheckStopKey = True Then
Rem     if the user

        StopMacro , True
        
        bKeyStop = True
         
        frmJMacro.cmdRecord_Click
        
        JournalRecordProc = CallNextHookEx(hHook, iCode, wParam, lParam)
          
        Exit Function
    
    End If
             
'Very Very Very Very Very Very Important
'Why we use Tags.RecordingIsOver?
'I will Tell you...

'when the recording Finish...
'FrmEnterMacroName Form appear
'the problem is ===>
'the recording is still running and every key you hit for saving the macro
'is recorded in the macro

'ok what i really want is?

'Stoping Macro at the moment when i hit alt-F10 for ex,
'in other word i didn't save the unneeded messages of The FrmEnterMacroName because it's not
'the macro.

'ok but i didn't understand anything of all this bullshit? can you explain more.

'ok i will tell you the problem is steps..

'1.User start a macro
'2.User hit alt-F10 to Finish the macro. "at this moment the really macro must by stop his recording"
'3.FrmEnterMacroName appear.
'4.while you write the name of the macro, the recording is still running
'5.every key you hit for the name of the macro is recorded
'6.do you imagine what is the funken of this?
'this is the problem
    
'=============================================================
    If Tags.RecordingIsOver Then GoTo Finish:
'=============================================================
      
Dim TempEventArr(1) As EVENTMSG
   
    CopyMemoryH2T TempEventArr(1), lParam, Len(EventArr(EventLog))
    
    Dim res As Integer
    Dim Res2 As Integer
    
    res = GetINIProfileInt("chkRecoKeyboard", 1)
    Res2 = GetINIProfileInt("chkRecordMouse", 1)
   
    If res <> 1 Then
       If IsKeyBoardMessage(TempEventArr(1).message) Then
          Result = CallNextHookEx(hHook, iCode, wParam, lParam)
          GoTo Finish:
       End If
    End If
    
    If Res2 <> 1 Then
       If IsMouseMessage(TempEventArr(1).message) Then
          Result = CallNextHookEx(hHook, iCode, wParam, lParam)
          GoTo Finish:
       End If
    End If
    
    CopyMemoryH2T EventArr(EventLog), lParam, Len(EventArr(EventLog))
     
'//cprin 7Aug2006: Uncomment the next line to enable Smart Playback
'//Search for the word Smart Playback to get the remaining Lines.
'    GetWindowInfo EventArr(EventLog).hWnd
    
  ' If EventArr(EventLog).message = WM_MOUSEMOVE Then
  '    Debug.Print EventArr(EventLog).paramH, EventArr(EventLog).paramL
  '    EventArr(EventLog).paramL = EventArr(EventLog).paramL / Screen.TwipsPerPixelX
  '    EventArr(EventLog).paramH = EventArr(EventLog).paramH / Screen.TwipsPerPixelY
  '    'Debug.Print EventArr(EventLog).paramH, EventArr(EventLog).paramL
  ' End If
  
  '  Debug.Print EventArr(EventLog).time, lbstarttime, EventArr(EventLog).time - lbstarttime
    EventArr(EventLog).time = EventArr(EventLog).time - lbstarttime
    
    EventLog = EventLog + 1
    
    Result = CallNextHookEx(hHook, iCode, wParam, lParam)

End If

Finish:

JournalRecordProc = Result

Exit Function

fin:

Select Case Err.Number
    
    Case Else
    
        MsgBox Err.Number & " Record::Proc " & Err.Description, vbCritical, SoftwareName

End Select
End Function
Private Function JournalPlaybackProc(ByVal iCode As Long, ByVal wParam As Long, ByVal lParam As Long) As Long

On Error GoTo fin
Dim sMsg As String
Dim lPause As Long
Dim Result As Long
Dim evtMsg As EVENTMSG
Dim PlayBackSpeed As String

canPlay = True

Result = 0

If iCode < 0 Then
    
    Result = CallNextHookEx(hPlay, iCode, wParam, lParam)

ElseIf iCode = HC_SYSMODALON Then
    
    canPlay = False

ElseIf iCode = HC_SYSMODALOFF Then
    
    canPlay = True

ElseIf ((canPlay = True) And (iCode = HC_GETNEXT)) Then
'This code controls the timing between system messages
    If bDelay Then
        
        bDelay = False
                 
'if you wish a normal speed run don't run line 1
'if you wish a lighting speed make result = 1
'if you wish a slow speed don't run line 7
'as you see we don't need to use Line1 at-all

         
         
Rem      we don't need line one at-all, i put it only for the unexpected Modifies
1        Rem   EventArr(PlayLog).time = EventArr(PlayLog).time + lStartTime
        
Normal_Speed:

'//cprin 5June2007:
Dim SleepPeriod As Long
'//http://groups.google.com/group/microsoft.public.win32.programmer.ui/browse_thread/thread/7175392a7dbb2215/234c168f378b2d80?lnk=st&q=wh_journalplayback+vista&rnum=1
'It has been verified that the application records macros correctly, however,
'the playback process has timing issues.  It appears that Vista is not
'respecting the millisecond times returned by the playback hook function when
'they are anything greater than zero.  On XP the system waits the to withing 1
'or 2 milliseconds when the playback function returns a value on a call with
'nCode set to HC_SKIP.  On Vista the wait can be off by more than a full
'second.  This has the net effect of having the macro playback appear to
'freeze for protracted periods and then race to catch up.

         '//cprin 5June2007:
         If IsWindowsVista Then lPause = 0
    

2        If PlayLog > 0 And PlayLog < EventLog Then
             
             '//cprin 5June2007: changed next line in support of fixing windows vista issue
             '//lPause = (EventArr(PlayLog).time - lStartTime)
3            If Not IsWindowsVista Then lPause = (EventArr(PlayLog).time - lStartTime)
             'Debug.Print IsWindowsVista
        
4        Else
             '//cprin 5June2007: changed next line in support of fixing windows vista issue
             '//lPause = 0
5            If Not IsWindowsVista Then lPause = 0
        
6        End If
        
         PlayBackSpeed = frmJMacro.cmdPlayBack.Tag
         If PlayBackSpeed <> "l" Then

7            lStartTime = EventArr(PlayLog).time
        
         End If
        
         If PlayBackSpeed = "h" Then
         
            '//cprin 5June2007:
            If Not IsWindowsVista Then Result = 0.1
                 
         Else
            
            '//cprin 5June2007:
           If Not IsWindowsVista Then Result = lPause
         
         End If
    
    End If
                     
           '//pt 24July2007: added next if as a request from Matt Clark mattjclark@hotmail.com to process the windows key
          If EventArr(PlayLog).message = WM_KEYUP Then
          If TranslateKey(EventArr(PlayLog).paramL And &HFF) = "Left Win" Or TranslateKey(EventArr(PlayLog).paramL And &HFF) = "Right Win" Then
             Call keybd_event(VK_LWIN, 0, 0, 0)
             Call keybd_event(VK_LWIN, 0, KEYEVENTF_KEYUP, 0)
          End If
          End If
          
          'Debug.Print EventArr(PlayLog).time
'Debug.Print lStartTime
'//cprin 7Aug2006: Uncomment the next line to enable Smart Playback
'//Search for the word Smart Playback to get the remaining Lines.
'      ForeGroundIt
      
    ' If EventArr(PlayLog).message = WM_MOUSEMOVE Then
         'Debug.Print EventArr(PlayLog).paramH, EventArr(PlayLog).paramL
    '    Dim a As Long
    '    Dim b As Long
         
       ' If EventArr(PlayLog).paramL < 100 Then
            
         '  EventArr(PlayLog).paramL = EventArr(PlayLog).paramL * Screen.TwipsPerPixelX
               
         '  EventArr(PlayLog).paramH = EventArr(PlayLog).paramH * Screen.TwipsPerPixelY
                
         '  Debug.Print EventArr(PlayLog).paramH, EventArr(PlayLog).paramL
          
       '  End If
      
      'End If
      
      CopyMemoryT2H lParam, EventArr(PlayLog), Len(EventArr(PlayLog))
          
         '//added next if as a request from Matt Clark mattjclark@hotmail.com to process the windows key
         ' If TranslateKey(EventArr(PlayLog).paramL And &HFF) = "Left Win" Or TranslateKey(EventArr(PlayLog).paramL And &HFF) = "Right Win" Then
         '    Call keybd_event(VK_LWIN, 0, 0, 0)
         '    Call keybd_event(VK_LWIN, 0, KEYEVENTF_KEYUP, 0)
         ' End If
    
ElseIf ((canPlay = True) And (iCode = HC_SKIP)) Then
    
    If PlayLog >= EventLog Or CheckStopKey = True Then
        
        StopMacro
        
        bPlaying = False
        
        JournalPlaybackProc = Result
        
        Exit Function
    
    End If
    
    bDelay = True
    
    Result = CallNextHookEx(hPlay, iCode, wParam, lParam)
    
    PlayLog = PlayLog + 1

End If

'//cprin 5June2007:'//////////////////////////////////////////////////////////////
If IsWindowsVista Then '@@@@@@@@@//don't forget the exe macro
    If PlayBackSpeed = "h" Then
       Sleep Result '//i don't know why Result make it works well, i just tried it
       'Debug.Print "h"
    ElseIf PlayBackSpeed = "l" Then
       Sleep 100 '//i don't know why 100 make it works well, i just tried it
    ElseIf PlayBackSpeed = "n" Then
       Sleep 10 '//i don't know why 10 make it works well, i just tried it
    End If
End If

If IsWindowsVista Then JournalPlaybackProc = 0 Else JournalPlaybackProc = Result
'///////////////////////////////////////////////////////////////////////////////

Exit Function
fin:
Select Case Err.Number
    Case Else
        MsgBox Err.Number & " Playback-Proc " & Err.Description, vbCritical, SoftwareName
End Select

End Function
Public Sub StartRecord()

    '//cprin 5June2007: check if this is a windows vista
    Dim OSInfo As OSVERSIONINFO, PId As String, Ret As Long
    'Set the structure size
    OSInfo.dwOSVersionInfoSize = Len(OSInfo)
    'Get the Windows version
    Ret = GetVersionEx(OSInfo)
    If OSInfo.dwPlatformId = 2 And OSInfo.dwMajorVersion = 6 Then
        IsWindowsVista = True '//Yes this is a windows zefta
    End If
    
On Error GoTo fin

'//cprin 7Aug2006: Uncomment the next line to enable Smart Playback
'//Search for the word Smart Playback to get the remaining Lines.
'ShoowDesktop

' we assign Tags.ProLog & Tags.UnqiueId to 0
'why?
'ProLog and UnqiuedId is the Index of Two Arrays
'in which we use for save windows Properties
'So these Indexs must be Zero whenever you record new macro
Tags.ProLog = 0
 
Tags.UnqiueId = 0

EventLog = 0

lbstarttime = GetTickCount

'to avoid conflict the playback with recording
'we assing the value ""
PlayBackPauseForValerie_Dion(0) = ""

hHook = SetWindowsHookEx(WH_JOURNALRECORD, AddressOf JournalRecordProc, App.hInstance, 0)

If hHook <> 0 Then bRecording = True

'//cprin 5June2007:
If hHook = 0 And IsWindowsVista Then
    MsgBox "You must disable User Account Control (UAC) In order to record and playback macros under Windows Vista ." & vbNewLine & vbNewLine & _
    "Go to Control Panel > User Accounts > Turn User Account Control on or off, then restart your computer" & vbNewLine & vbNewLine & _
    "Thank you for you patience.", vbInformation, SoftwareName
End If

Exit Sub

fin:

Select Case Err.Number
    
    Case Else
        
        MsgBox Err.Number & " StartRecord::" & Err.Description, vbCritical, SoftwareName

End Select

End Sub

Public Sub StartPlay(Optional PauseState As Boolean)

    '//cprin 5June2007: check if this is a windows vista
    Dim OSInfo As OSVERSIONINFO, PId As String, Ret As Long
    'Set the structure size
    OSInfo.dwOSVersionInfoSize = Len(OSInfo)
    'Get the Windows version
    Ret = GetVersionEx(OSInfo)
    If OSInfo.dwPlatformId = 2 And OSInfo.dwMajorVersion = 6 Then
        IsWindowsVista = True '//Yes this is a windows zeft
    End If
   
'first we check if there is an already macro paused from the user or not

If PauseState = True Then
     
   'start from the event number ���
   PlayLog = PlayBackPauseForValerie_Dion(1)
   lStartTime = EventArr(PlayBackPauseForValerie_Dion(1)).time

Else
      
   PlayLog = 0
   lStartTime = EventArr(0).time

End If

hPlay = SetWindowsHookEx(WH_JOURNALPLAYBACK, AddressOf JournalPlaybackProc, App.hInstance, 0)

bKeyStop = False

If hPlay <> 0 Then
    
    bPlaying = True

Else
    
    bPlaying = False

End If

End Sub

Public Sub StopMacro(Optional MacroName As String, Optional cancel As Boolean, Optional Ending As Boolean)
On Error GoTo fin
Dim retval As Long

If bPlaying Then
    
    retval = UnhookWindowsHookEx(hPlay)
    
    DoEvents
    
    If retval Then
        
        Debug.Print "7'wal"
        
         bPlaying = False
               
         Tags.PlayPrelog = 0
         
         Tags.PlayUniqueTitId = 0
         
         Erase EventArr
         
         Erase InfoArray

         Erase UniqueTitles
          
 
    End If
    
Rem well well well
Rem we add "or EventLog" below
Rem in order to save the macro file after press F11 which stops the macros

ElseIf bRecording Or EventLog Then
    
    retval = UnhookWindowsHookEx(hHook)
    
    DoEvents
      
Rem user End the program while Recording or PlayBacking

    If Ending Then Exit Sub
    
    If retval Or EventLog <> 0 Then
       
       bRecording = False
       
Rem if cancel here True that's mean that the user didn't write a name for the macro in order to save
Rem in other word that's mean "User didn't want to save this macro
       
       If Not cancel Then
         
         Call SaveMacro(MacroName)
         
         PlayLog = 0

         EventLog = 0
          
         'debug.Print Tags.ProLog, Tags.UnqiueId, UBound(EventArr)
         
         Tags.ProLog = 0

         Tags.UnqiueId = 0
         
         Erase EventArr
         
         Erase InfoArray

         Erase UniqueTitles
         
      End If
    
    End If

End If


Exit Sub

fin:

Select Case Err.Number
    
    Case Else
    
        MsgBox Err.Number & " StopMacro::" & Err.Description, vbCritical, SoftwareName

End Select

End Sub

Public Function CheckStopKey(Optional TerminatePlayback As Boolean) As Boolean

On Error GoTo fin

Dim res As Integer
   
res = GetINIProfileInt("DASK", 0)

Dim StopPlayBackNowUsingShortCut As Boolean
Dim PausePlayBack As Boolean
Dim PauseRecord As Boolean

Dim DecodedKey As String

Dim key1 As String, key2 As String

Dim dkey As String * 15  '//why 15, coz it larger than "1,1,1#256*

Dim DefChar4 As String
Dim DefChar7 As String
Dim DefChar8 As String
Dim PressedKey As Integer

DefChar8 = Str(vbKeyInsert)  '//Get the ASC value of X
DefChar7 = Str(vbKeyF11)  '//Get the ASC value of N
DefChar4 = Str(vbKeyPause)  '//Get the ASC value of H
   PressedKey = GetPressedKey

   If GetAsyncKeyState(vbKeyControl) Then
      DecodedKey = 1
   Else
      DecodedKey = 0
   End If
   
   If GetAsyncKeyState(18) Then
      DecodedKey = DecodedKey & "," & 1
   Else
      DecodedKey = DecodedKey & "," & 0
   End If
   
   '//Tell Me why the space after the hash "# " ??
   '//for unknown reason, It added automatic in LoadShortcutKeys
   '//[i mean in GetINIProfileString lines in LoadShortcutKeys  ] and i don't know why
   '//and that's why i added it here ino order to match the keys
   
   If GetAsyncKeyState(vbKeyShift) Then
      DecodedKey = DecodedKey & "," & 1 & "# " & PressedKey & "*"
   Else
      DecodedKey = DecodedKey & "," & 0 & "# " & PressedKey & "*"
   End If
   
   dkey = "" '//we must clear dkey otherwise it may hold the value of the previous use
   '//and this will cause a bug in displaying the key
   '//for example: if a function has no key, then it will be stored as a blank value in ini
   '//and if dkey has this value from the prevoius use "1,1,1#256*" , then
   '//it will be "1,1#256*"
   GetINIProfileString Pause_Play_back, "0,0,0#" & DefChar4 & "*", dkey, Len(dkey)
   If InStr(1, dkey, "#") <> 0 Then
      key1 = Mid(dkey, 1, InStr(1, dkey, "*"))
      key2 = Mid(DecodedKey, 1, InStr(1, DecodedKey, "*"))
      If key1 = key2 And res <> 1 Then
         PausePlayBack = True
      End If
   End If
   
If bPlaying Then
   
   'Check rButton state
   '//If GetAsyncKeyState(19) Then
   If PausePlayBack Then
            
         PlayBackPauseForValerie_Dion(1) = PlayLog
      
         CheckStopKey = True
    
         bKeyStop = True
      
         StopMacro
        
         bPlaying = False
          
         Debug.Print "Fuck you"
         
         'there is a paused macro so we assign the value 1 to element 2
         PlayBackPauseForValerie_Dion(2) = 1 'koko
            
         '//cprin 28Jul2006: added next line to enable Continue Button
         '//if Play back had been paused.
         frmJMacro.cmdContinue.Enabled = True
         
    End If
   
End If

   dkey = "" '//we must clear dkey otherwise it may hold the value of the previous use
   '//and this will cause a bug in displaying the key
   '//for example: if a function has no key, then it will be stored as a blank value in ini
   '//and if dkey has this value from the prevoius use "1,1,1#256*" , then
   '//it will be "1,1#256*"
   GetINIProfileString Pause_Recording, "0,0,0#" & DefChar8 & "*", dkey, Len(dkey)
   If InStr(1, dkey, "#") <> 0 Then
      key1 = Mid(dkey, 1, InStr(1, dkey, "*"))
      key2 = Mid(DecodedKey, 1, InStr(1, DecodedKey, "*"))
      If key1 = key2 And res <> 1 Then
         PauseRecord = True
         Debug.Print Pause_Recording
      End If
   End If
   
If bRecording Then
 '19 is PauseKey
    'If GetAsyncKeyState(18) And GetAsyncKeyState(vbKeyInsert) Then
               
    'if Pause button is true and in the same time there is a paused recording session
    'waiting for resume
    'ElseIf GetAsyncKeyState(19) And RecordPauseForValerie_Dion(2) = 0 Then
    If PauseRecord And RecordPauseForValerie_Dion(2) = 0 Then
         RecordPauseForValerie_Dion(2) = 1
         Tags.RecordingIsOver = True
         frmJMacro.TrayIcon1.StopAnimateing
         '///////////////////////////////////////
         Dim key12 As String
         Dim key13 As String
         Dim dkey1 As String * 15
         Dim DefChar11 As String
         Dim DefChar12 As String
         DefChar12 = Str(vbKeyF10)
         DefChar11 = Str(vbKeyInsert)
         GetINIProfileString Stop_Record, "0,1,0#" & DefChar12 & "*", dkey1, Len(dkey1)
         key12 = Mid(dkey1, 1, InStr(1, dkey1, "*"))
         
         GetINIProfileString Resume_Record, "0,1,0#" & DefChar11 & "*", dkey1, Len(dkey1)
         key13 = Mid(dkey1, 1, InStr(1, dkey1, "*"))
         frmJMacro.TrayIcon1.ShowBalloon "Press " & DecodeKey(key13) & " to resume recording " & Chr(13) & Chr(10) & "or" & Chr(13) & Chr(10) & "Press " & DecodeKey(key12) & " to stop recording", "Recording Paused", Info, 10000
    End If

End If

   dkey = "" '//we must clear dkey otherwise it may hold the value of the previous use
   '//and this will cause a bug in displaying the key
   '//for example: if a function has no key, then it will be stored as a blank value in ini
   '//and if dkey has this value from the prevoius use "1,1,1#256*" , then
   '//it will be "1,1#256*"
   GetINIProfileString Stop_Play_back, "0,1,0#" & DefChar7 & "*", dkey, Len(dkey)
   If InStr(1, dkey, "#") <> 0 Then
      key1 = Mid(dkey, 1, InStr(1, dkey, "*"))
      key2 = Mid(DecodedKey, 1, InStr(1, DecodedKey, "*"))
      If key1 = key2 And res <> 1 Then
            StopPlayBackNowUsingShortCut = True
            Debug.Print Stop_Play_back
      End If
   End If
 
  '//to terminate playback from outside ..
  If TerminatePlayback Then StopPlayBackNowUsingShortCut = True
   
  'If GetAsyncKeyState(vbKeyF10) And bPlaying And GetAsyncKeyState(18) Then  ' And GetAsyncKeyState(VK_MENU) And GetAsyncKeyState(Asc("s")) Then
  If StopPlayBackNowUsingShortCut And bPlaying Then
     
     StopPlayBackNowUsingShortCut = False
    
     CheckStopKey = True
    
     bKeyStop = True
       
     Call keybd_event(VK_CONTROL, &H45, KEYEVENTF_KEYUP, 0)
    
     Call keybd_event(VK_MENU, &H45, KEYEVENTF_KEYUP, 0)
    
     '//cprin 27Jul2006: added next line to fix the bug of "can't stop play back when press alt+f10 if repeatcount is more than 1
     Tags.StopPlayBackLoop = True

Else
    
    CheckStopKey = False
    
    bKeyStop = False

End If

Exit Function

fin:
Select Case Err.Number
    
    Case Else
        
        MsgBox Err.Number & " CheckStopKey::" & Err.Description, vbCritical, SoftwareName

End Select

End Function
Public Sub WatchForCancel()
On Error GoTo fin

Dim message As Msg

Do Until bKeyStop = True Or bPlaying = False
   
   WaitMessage
    'check if it's a HOTKEY-message
    
    If PeekMessage(message, 0, WM_CANCELJOURNAL, WM_CANCELJOURNAL, PM_REMOVE) Then
        
        bKeyStop = True
        
        bPlaying = False
        
        StopMacro , True
        
        'debug.Print "Eraseed"
        Erase EventArr
        
    End If
    
    'let the operating system process other events
    
    DoEvents

Loop

Exit Sub

fin:

Select Case Err.Number
    
    Case Else

        MsgBox Err.Number & " WatchForCancel::" & Err.Description, vbCritical, SoftwareName

End Select


End Sub
Public Function AppPath()

'use the function to get the path of the parameter filename
If right(App.Path, 1) <> "\" Then AppPath = App.Path + "\" Else AppPath = App.Path
   
End Function

Public Function EnumWindowsProc(ByVal hWnd As Long, ByVal lParam As Long) As Boolean
        
    Dim ForeGroundW As String
    
    Dim sSave As String, Ret As Long
    
    Ret = GetWindowTextLength(hWnd)
    
    sSave = Space(Ret)
    
    GetWindowText hWnd, sSave, Ret + 1
    
    ForeGroundW = GetSetting(App.EXEName, "for", MacrosName, "")

    If InStr(1, sSave, ForeGroundW) And ForeGroundW <> "" Then
                
        SetWindowPos hWnd, HWND_TOP, 0, 0, 0, 0, SWP_SHOWWINDOW Or SWP_NOMOVE Or SWP_NOSIZE
               
        SetForegroundWindow hWnd
             
        EnumWindowsProc = False
        
Rem     to prevent the msgbox "window not found" from appearing
    
        Exit Function
      
    End If
    
    'continue enumeration
    
    EnumWindowsProc = True
    
End Function

Public Sub GetWindowInfo(WinHwnd As Long)

Dim i

Dim Fore_Hwnd

Dim MyStr As String
    
Dim ProLog As Variant
    
Dim Fore_Rect As RECT
    
Dim Unique As Boolean
    
Dim ClassName As String

Dim WhereChr0 As String

Dim TitleBuffer As String

Dim UniqueTitId As Variant

Dim ClassNBuffer As String


Fore_Hwnd = WinHwnd

MyStr = String(GetWindowTextLength(Fore_Hwnd) + 1, Chr$(0))

GetWindowText Fore_Hwnd, MyStr, Len(MyStr)

MyStr = Left(MyStr, Len(MyStr) - 1)

'==============================================================

ClassName = String(31, Chr$(0))

GetClassName Fore_Hwnd, ClassName, 32

WhereChr0 = InStr(1, ClassName, Chr$(0))

ClassNBuffer = Left(ClassName, WhereChr0 - 1)

'==============================================================

GetWindowRect Fore_Hwnd, Fore_Rect

'==============================================================

InfoElement.Title = MyStr

InfoElement.hWnd = Fore_Hwnd

InfoElement.Top = Fore_Rect.Top

InfoElement.Left = Fore_Rect.Left

InfoElement.right = Fore_Rect.right

InfoElement.Class_Name = ClassNBuffer

InfoElement.Bottom = Fore_Rect.Bottom

'==============================================================

ProLog = Tags.ProLog

ReDim Preserve InfoArray(ProLog) 'erase

UniqueTitId = Tags.UnqiueId

ReDim Preserve UniqueTitles(UniqueTitId)

TitleBuffer = Trim(MyStr)

If ProLog = 0 Then

   Unique = False: GoTo assign:

End If

'Check if Unique
For i = 0 To UniqueTitId
    
    'why we use [And TitleBuffer <> ""]???... to saving untitled window in the array
     If TitleBuffer = UniqueTitles(i) Then
       
        If TitleBuffer <> "" Then
        
          'Debug.Print i, UniqueTitles(i), ProLog
           Unique = True
        
        End If
       
       Exit For
       
    End If
    
Next i

assign:

If Not Unique Then
     
     If TitleBuffer <> "" Then
        
        InfoArray(ProLog) = InfoElement
        'save to the array
        UniqueTitles(UniqueTitId) = TitleBuffer
     '   Debug.Print TitleBuffer
        InfoArray(ProLog).UniqueWindow = True
   
        Tags.UnqiueId = Tags.UnqiueId + 1
        
        Tags.ProLog = Tags.ProLog + 1

     End If
     
End If


End Sub
Public Sub SaveWinInfoArray(MacName As String)

Dim i As Long

Dim ProLog As Long
 
Dim iFileNumber As Long

Dim projectpath As String


    iFileNumber = FreeFile
    
    If right(App.Path, 1) <> "\" Then projectpath = App.Path + "\" Else projectpath = App.Path
 
    projectpath = projectpath & "Data\" & MacName & ".ifo"
        
    
    ProLog = Tags.ProLog
     
    On Error Resume Next
    Kill projectpath
    On Error GoTo 0
    
    Open projectpath For Random As iFileNumber Len = Len(InfoArray(ProLog))
        
        
        For i = 1 To ProLog
            
            'very very very important
            'here the loop from the 1 to
            'beacuse we didn't want the the element no 0 in the array

              Put iFileNumber, i, InfoArray(i - 1)
              
            'very very very very very very important
            'when you Get TTTsArray(0).Classname or Title
            'you must remember that each of them is 70 bytes long
            'so you must trim them
        
        Next i

        Close iFileNumber

End Sub

Private Sub Fill2Arrays(MacName As String)


Dim i As Long

Dim ProLog As Long

Dim UniqueTitId As Long

Dim iFileNumber As Long

Dim projectpath As String

Dim HaveUnique As Boolean

    iFileNumber = FreeFile
    
    If right(App.Path, 1) <> "\" Then projectpath = App.Path + "\" Else projectpath = App.Path
 
    projectpath = projectpath & "Data\" & MacName & ".ifo"
         
    ProLog = FileLen(projectpath) / Len(InfoElement)
          
    ReDim Preserve InfoArray(ProLog)
    
    Open projectpath For Random As iFileNumber Len = Len(InfoArray(ProLog))
        
        
        For i = 1 To ProLog
            
            'very very very important
            'here the loop from the 1 to
            'beacuse we didn't want the the element no 0 in the array
'
              Get iFileNumber, i, InfoArray(i - 1)
'
            'very very very very very very important
            'when you Get TTTsArray(0).Classname or Title
            'you must remember that each of them is 70 bytes long
            'so you must trim them
               'Debug.Print InfoArray(i - 1).Title
               
               If InfoArray(i - 1).UniqueWindow = True Then
                   
                   ReDim Preserve UniqueTitles(UniqueTitId)
                    
                   UniqueTitles(UniqueTitId) = Trim(InfoArray(i - 1).Title)
                   
                   'reset Tags.PlayPrelog to the actual Element numbers in UniqueTitles array
                   Tags.PlayUniqueTitId = UBound(UniqueTitles)
        
                   UniqueTitId = UniqueTitId + 1
                   
                   HaveUnique = True
                   
               End If
               
               'DoEvents
               
        Next i
          
        Tags.PlayPrelog = ProLog
         
        
        Close iFileNumber

        If HaveUnique Then IsUniqueHere

        
End Sub

Private Sub IsUniqueHere()

'Dim i

'Dim UHwnd As Long

'For i = 0 To Tags.PlayUniqueTitId
'
'    UHwnd = FindWindow(vbNullString, UniqueTitles(i))
'
'    'If UHwnd = 0 Then MsgBox i & "-[ " & UniqueTitles(i) & " ] Not Implemented Yet."
'
'Next i

End Sub

Public Sub ForeGroundIt()
Dim i

Dim WinRect As RECT

Dim hThread As Long

Dim WinHwnd As Long

Dim hProcess As Long

Dim WinRect2 As RECT

Dim Fore_Hwnd As Long

Dim Fore_Text As String

Dim WinWidth, WinHeight

Dim ClassName As String

Dim WindowTitle As String

For i = 0 To Tags.PlayPrelog - 1
       
    ClassName = Trim(InfoArray(i).Class_Name)
          
    WindowTitle = Trim(InfoArray(i).Title)
           
           
    If ClassName <> "" Then
    
       WinHwnd = FindWindow(ClassName, WindowTitle)
       
       If WindowTitle = "FolderView" Then
                          
          Fore_Hwnd = GetForegroundWindow
          
          Fore_Text = String(100, Chr(0))
          
          GetWindowText Fore_Hwnd, Fore_Text, 100
           
          If Not InStr(1, Fore_Text, "Program Manager") Then
                  
           
                  GoTo nextone:
          
          End If
            
       End If
   
       If WinHwnd <> 0 Then
         
          'The order of the following statments is its keysuccues

            ' SetRect WinRect, InfoArray(i).Left, InfoArray(i).Top, InfoArray(i).right, InfoArray(i).Bottom
           
             WinWidth = InfoArray(i).right - InfoArray(i).Left
          
             WinHeight = InfoArray(i).Bottom - InfoArray(i).Top
                     
             hThread = GetWindowThreadProcessId(WinHwnd, hProcess)
           
             AllowSetForegroundWindow hProcess
             
             GetWindowRect WinHwnd, WinRect2
'              If Fore_Hwnd <> WinHwnd Then SetForegroundWindow WinHwnd
        
       '   @@@@@@@
       '   1.check performance
       '     i.e don 't size any window which didn't want to sized
       '   2.foreground window

SetWindowPos WinHwnd, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOACTIVATE Or SWP_SHOWWINDOW Or SWP_NOMOVE Or SWP_NOSIZE
If Fore_Hwnd <> WinHwnd Then
       ShowWindow WinHwnd, SW_RESTORE
End If

             If WinRect2.Bottom <> InfoArray(i).Bottom _
                Or WinRect2.Left <> InfoArray(i).Left Or WinRect2.right <> InfoArray(i).right _
                Or WinRect2.Top <> InfoArray(i).Top Then
                MoveWindow WinHwnd, InfoArray(i).Left, InfoArray(i).Top, WinWidth, WinHeight, True
                
             End If

             
           End If
    
    End If
    
nextone:
    
Next i
End Sub

Public Sub ShoowDesktop()
      
     Call keybd_event(VK_LWIN, 0, 0, 0)
     Call keybd_event(77, 0, 0, 0)
     Call keybd_event(VK_LWIN, 0, KEYEVENTF_KEYUP, 0)

End Sub

Function IsMouseMessage(message As Long) As Boolean
    
     Select Case message
           
           Case WM_MOUSEMOVE
           
                IsMouseMessage = True
           
           Case WM_LBUTTONDBLCLK
            
                'IsMouseMessage = True
            
           Case WM_LBUTTONUP
             
                'IsMouseMessage = True
           
           Case WM_LBUTTONDOWN
             
                'IsMouseMessage = True
           
           Case WM_MBUTTONDBLCLK
            
                'IsMouseMessage = True
              
           Case WM_MBUTTONUP
            
                'IsMouseMessage = True
            
           Case WM_MOUSEACTIVATE
            
                'IsMouseMessage = True
            
           Case WM_MOUSEWHEEL
            
                'IsMouseMessage = True
            
           Case WM_RBUTTONDBLCLK
            
                'IsMouseMessage = True
            
           Case WM_RBUTTONDOWN
            
                'IsMouseMessage = True
            
           Case WM_RBUTTONUP
            
                'IsMouseMessage = True
    End Select

End Function

Function IsKeyBoardMessage(message As Long) As Boolean
    
    Select Case message
           
           Case WM_CHAR
                IsKeyBoardMessage = True
           
           Case WM_KEYDOWN
                IsKeyBoardMessage = True
           
           Case WM_KEYUP
                IsKeyBoardMessage = True
           
           Case WM_SYSCHAR
                IsKeyBoardMessage = True
           
           Case WM_SYSKEYDOWN
                IsKeyBoardMessage = True
           
           Case WM_SYSKEYUP
                IsKeyBoardMessage = True
           
    End Select

End Function

