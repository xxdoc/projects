VERSION 5.00
Object = "{F247AF03-2671-4421-A87A-846ED80CD2A9}#1.0#0"; "jbet33.ocx"
Begin VB.Form frmSetShortKey 
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   1  'Fixed Single
   ClientHeight    =   1755
   ClientLeft      =   2820
   ClientTop       =   3750
   ClientWidth     =   4890
   BeginProperty Font 
      Name            =   "MS Sans Serif"
      Size            =   9.75
      Charset         =   178
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmSetShortKey.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1755
   ScaleWidth      =   4890
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame Frame1 
      BackColor       =   &H00FFFFFF&
      Height          =   1695
      Left            =   120
      TabIndex        =   0
      Top             =   0
      Width           =   4695
      Begin VB.CheckBox ChkEnable 
         Caption         =   "S&hift"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   240
         TabIndex        =   12
         Top             =   240
         Width           =   200
      End
      Begin VB.CheckBox chkCtrl 
         Caption         =   "S&hift"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   480
         TabIndex        =   11
         Top             =   600
         Value           =   1  'Checked
         Width           =   200
      End
      Begin VB.ComboBox comKeys 
         Enabled         =   0   'False
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   480
         Style           =   2  'Dropdown List
         TabIndex        =   6
         Top             =   960
         Width           =   1095
      End
      Begin VB.CheckBox chkAlt 
         Caption         =   "S&hift"
         Enabled         =   0   'False
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   1320
         TabIndex        =   5
         Top             =   600
         Width           =   200
      End
      Begin VB.CheckBox chkShift 
         Caption         =   "S&hift"
         Enabled         =   0   'False
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   2280
         TabIndex        =   4
         Top             =   600
         Width           =   200
      End
      Begin JwldButn2b.JeweledButton cmdClose 
         Height          =   375
         Left            =   3120
         TabIndex        =   1
         Top             =   1200
         Width           =   1455
         _ExtentX        =   2566
         _ExtentY        =   661
         Caption         =   "C&lose"
         PictureSize     =   0
         OriginalPicSizeW=   0
         OriginalPicSizeH=   0
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         MousePointer    =   99
         BackColor       =   12632256
      End
      Begin JwldButn2b.JeweledButton CancelButton 
         Cancel          =   -1  'True
         Height          =   375
         Left            =   3120
         TabIndex        =   2
         Top             =   720
         Width           =   1455
         _ExtentX        =   2566
         _ExtentY        =   661
         Caption         =   "&Cancel"
         PictureSize     =   0
         OriginalPicSizeW=   0
         OriginalPicSizeH=   0
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         MousePointer    =   99
         BackColor       =   12632256
      End
      Begin JwldButn2b.JeweledButton OKButton 
         Default         =   -1  'True
         Height          =   375
         Left            =   3120
         TabIndex        =   3
         Top             =   240
         Width           =   1455
         _ExtentX        =   2566
         _ExtentY        =   661
         Caption         =   "&Ok"
         PictureSize     =   0
         OriginalPicSizeW=   0
         OriginalPicSizeH=   0
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         MousePointer    =   99
         BackColor       =   12632256
      End
      Begin VB.Label Label3 
         BackStyle       =   0  'Transparent
         Caption         =   "Use this ShortCut Key"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   255
         Left            =   480
         TabIndex        =   10
         Top             =   240
         Width           =   3255
      End
      Begin VB.Label Label4 
         BackStyle       =   0  'Transparent
         Caption         =   "Ctrl"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   255
         Left            =   720
         TabIndex        =   9
         Top             =   600
         Width           =   375
      End
      Begin VB.Label Label5 
         BackStyle       =   0  'Transparent
         Caption         =   "Alt"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   255
         Left            =   1560
         TabIndex        =   8
         Top             =   600
         Width           =   375
      End
      Begin VB.Label Label6 
         BackStyle       =   0  'Transparent
         Caption         =   "Shift"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   255
         Left            =   2520
         TabIndex        =   7
         Top             =   600
         Width           =   615
      End
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "Test all Keys compainegs"
      ForeColor       =   &H00FFFFFF&
      Height          =   495
      Left            =   6240
      TabIndex        =   13
      Top             =   720
      Visible         =   0   'False
      Width           =   615
   End
End
Attribute VB_Name = "frmSetShortKey"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Private Sub CancelButton_Click()
  
  Unload Me

End Sub

Private Sub chkCtrl_Click()

Rem we cannot allow to uncheck ctrl
Rem and in the same time we need to the name ctrl
Rem appear not in gray state as if we we make the disable the control
Dim ListContent As String

ListContent = comKeys.List(comKeys.ListIndex)

If ListContent = "F9" Or ListContent = "F10" Then Exit Sub


   If chkCtrl.Value <> 1 Then
 
 '     chkCtrl.Value = 1
  
   End If



End Sub

Private Sub ChkEnable_Click()

If ChkEnable.Value = 1 Then

   chkAlt.Enabled = True
   
   chkCtrl.Enabled = True
   
   chkShift.Enabled = True
   
   comKeys.Enabled = True
   
   OKButton.Enabled = True
 
Else
   

   chkAlt.Enabled = False
   
   chkCtrl.Enabled = False
   
   chkShift.Enabled = False
   
   comKeys.Enabled = False
   
   OKButton.Enabled = False
   
End If

End Sub

Private Sub cmdClose_Click()
Unload Me
End Sub


Private Sub comKeys_Click()

If comKeys.List(comKeys.ListIndex) = "F10" Or comKeys.List(comKeys.ListIndex) = "F9" Then
      
   'chkCtrl.Value = 0
   
Else

   'chkCtrl.Value = 1

End If

End Sub


Private Sub Form_Load()

'cprin 18July2006: added next code block
'to ensure that jeweled buttons will remain
'as i want.
''''''''''''''''''''''''''''''''''''''''''''
OKButton.Caption = "&Ok"
CancelButton.Caption = "&Cancel"
cmdClose.Caption = "C&lose"
''''''''''''''''''''''''''''''''''''''''''''

comKeys.AddItem "1"
comKeys.AddItem "2"
comKeys.AddItem "3"
comKeys.AddItem "4"
comKeys.AddItem "5"
comKeys.AddItem "6"
comKeys.AddItem "7"
comKeys.AddItem "8"
comKeys.AddItem "9"
comKeys.AddItem "F1"
comKeys.AddItem "F2"
comKeys.AddItem "F3"
comKeys.AddItem "F4"
comKeys.AddItem "F5"
comKeys.AddItem "F6"
comKeys.AddItem "F7"
comKeys.AddItem "F8"
comKeys.AddItem "F9"
comKeys.AddItem "F10"
comKeys.AddItem "F11"
comKeys.AddItem "F12"
comKeys.AddItem "a"
comKeys.AddItem "b"
comKeys.AddItem "c"
comKeys.AddItem "d"
comKeys.AddItem "e"
comKeys.AddItem "f"
comKeys.AddItem "g"
comKeys.AddItem "h"
comKeys.AddItem "i"
comKeys.AddItem "j"
comKeys.AddItem "k"
comKeys.AddItem "l"
comKeys.AddItem "m"
comKeys.AddItem "n"
comKeys.AddItem "o"
comKeys.AddItem "p"
comKeys.AddItem "q"
comKeys.AddItem "r"
comKeys.AddItem "s"
comKeys.AddItem "t"
comKeys.AddItem "u"
comKeys.AddItem "v"
comKeys.AddItem "w"
comKeys.AddItem "x"
comKeys.AddItem "y"
comKeys.AddItem "z"


comKeys.AddItem "Insert"

comKeys.AddItem "Delete"
comKeys.AddItem "`"
comKeys.AddItem "-"
comKeys.AddItem "="
comKeys.AddItem "Home"
comKeys.AddItem "Page Down"
comKeys.AddItem "Page Up"
comKeys.AddItem "Pause"
comKeys.AddItem "["
comKeys.AddItem "]"

comKeys.AddItem "\"
comKeys.AddItem ";"
comKeys.AddItem "'"
comKeys.AddItem "End"
comKeys.AddItem "\"
comKeys.AddItem ","
comKeys.AddItem "."

comKeys.AddItem "/"
comKeys.AddItem "Up"
comKeys.AddItem "Down"
comKeys.AddItem "Right"
comKeys.AddItem "Left"
comKeys.AddItem "Tab"
comKeys.AddItem "Num lock"
comKeys.AddItem "Num 0"
comKeys.AddItem "Num 1"
comKeys.AddItem "Num 2"
comKeys.AddItem "Num 3"
comKeys.AddItem "Num 4"
comKeys.AddItem "Num 5"
comKeys.AddItem "Num 6"
comKeys.AddItem "Num 7"
comKeys.AddItem "Num 8"
comKeys.AddItem "Num 9"
comKeys.AddItem "Num +"
comKeys.AddItem "Num -"
comKeys.AddItem "Num *"
comKeys.AddItem "Num /"
comKeys.AddItem "."


comKeys.ListIndex = 9
End Sub


Private Sub Label3_Click()
 
If ChkEnable.Value = 1 Then ChkEnable.Value = 0: OKButton.Enabled = False: Exit Sub

If ChkEnable.Value = 0 Then ChkEnable.Value = 1: OKButton.Enabled = True

End Sub

Private Sub Label4_Click()

If chkCtrl.Enabled = False Then Exit Sub:

If chkCtrl.Value = 1 Then chkCtrl.Value = 0: Exit Sub

If chkCtrl.Value = 0 Then chkCtrl.Value = 1

End Sub

Private Sub Label5_Click()

If chkAlt.Enabled = False Then Exit Sub:

If chkAlt.Value = 1 Then chkAlt.Value = 0: Exit Sub

If chkAlt.Value = 0 Then chkAlt.Value = 1

End Sub

Private Sub Label6_Click()

If chkShift.Enabled = False Then Exit Sub

If chkShift.Value = 1 Then chkShift.Value = 0: Exit Sub

If chkShift.Value = 0 Then chkShift.Value = 1

End Sub

Private Sub OKButton_Click()

Dim SelectedKey As String

If Me.Tag = "options" Then

 SelectedKey = GetSelectedKey(, True)
   
ElseIf ChkEnable.Value = 1 Then
   
      SelectedKey = GetSelectedKey
      
Else
    
   SelectedKey = GetSelectedKey(True)
   
End If

Unload Me

End Sub
Private Function GetSelectedKey(Optional cancel As Boolean, Optional GeneralHotKey As Boolean) As String
'============================================================

' Routine Name: GetSelectedKey
' Description:
' Author: Author's Name
' Date: 26/08/2004 07:06:52 �
' Copyright � 2004
' Notes:

' Modification History:

'============================================================

    On Error GoTo GetSelectedKeyErr
    Dim i As Long
    Dim Alt As String
    Dim Ctrl As String
    Dim Char As String
    Dim Shift As String
    Dim KeySelected As String
    Dim GeneralHotKeys As String
    Dim SelectedMacroIndex As Long
    Dim SelectedMacroName As String
      
    If cancel Then GoTo deAssign:
    
    
  If chkCtrl.Value = 1 Then
       
       Ctrl = "Ctrl+"
       
    End If
    
    If chkAlt.Value = 1 Then
    
       Alt = "Alt+"
       
    End If
     
    If chkShift.Value = 1 Then
    
       Shift = "Shift+"
       
    End If
    
    KeySelected = Ctrl & Alt & Shift & comKeys.List(comKeys.ListIndex)
    
deAssign:
Rem check if the key is realy selected
    
   For i = 1 To frmManage.lstviewMacros.ListItems.Count
   
     
       If KeySelected = frmManage.lstviewMacros.ListItems(i).SubItems(4) And Not KeySelected = "" Then
       
          MsgBox KeySelected & " is already selected for ( " & frmManage.lstviewMacros.ListItems(i).Text & " ) Macro", vbCritical, App.Title
               
          Exit Function
          
       End If
    
     
       
       If frmManage.lstviewMacros.ListItems(i).Bold = True Then
          
          
          SelectedMacroIndex = i
          
          SelectedMacroName = frmManage.lstviewMacros.ListItems(i).Text
       
       End If
   
   Next i
      
   If GeneralHotKey Then GoTo GeneralHotKey:

   frmManage.lstviewMacros.ListItems(SelectedMacroIndex).SubItems(4) = KeySelected
       
   SaveSetting App.EXEName, "sm", SelectedMacroName, KeySelected
                
   GetSelectedKey = KeySelected
   

Exit Function

GeneralHotKey:
   
         For i = 2 To 7
                  
                GeneralHotKeys = GetSetting(App.EXEName, "GHK", i, "")
                
Rem             for more info about the next 2 lines retail frmoptions.cmdChange_Click

                'If Val(frmOptions.cmdApply.Tag) = 3 And KeySelected = "Alt+F10" Then Exit For
                   
                'If Val(frmOptions.cmdApply.Tag) = 4 And KeySelected = "Alt+F10" Then Exit For
                 
                If KeySelected = GeneralHotKeys Then
                   
                   MsgBox KeySelected & " is already selected ", vbCritical, App.Title
               
                   Exit Function
                
                End If
                
         Next i
        
   'frmOptions.Tag = KeySelected
   
   Unload Me
   
GetSelectedKeyExit:
    On Error Resume Next

    Exit Function

GetSelectedKeyErr:

    Dim sMsg As String
    'Add your error display message here, or use this simple MsgBox display...

    With Err
        sMsg = "Error: " & .Number & vbCrLf
        sMsg = sMsg & "Description: " & .Description & vbCrLf
        sMsg = sMsg & "Code Location: " & App.Title & ":: AssignShortKey_GetSelectedKey" & vbCrLf
        sMsg = sMsg & "Source: " & .Source & vbCrLf
        sMsg = sMsg & "Last DLL Error: " & .LastDllError & vbCrLf
        MsgBox sMsg, vbOKOnly + vbCritical, "Error" & vbCrLf
    End With
GoTo GetSelectedKeyExit

End Function


