VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form frmOptions2 
   AutoRedraw      =   -1  'True
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Perfect Macro Recorder Options"
   ClientHeight    =   5250
   ClientLeft      =   45
   ClientTop       =   345
   ClientWidth     =   6105
   Icon            =   "frmOptions2.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5250
   ScaleWidth      =   6105
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   4680
      TabIndex        =   17
      TabStop         =   0   'False
      Top             =   4560
      Width           =   1095
   End
   Begin VB.CommandButton cmdOk 
      Caption         =   "OK"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   3480
      TabIndex        =   16
      TabStop         =   0   'False
      Top             =   4560
      Width           =   1095
   End
   Begin VB.Frame fraGeneral 
      Height          =   4035
      Left            =   240
      TabIndex        =   21
      Top             =   480
      Visible         =   0   'False
      Width           =   5655
      Begin VB.CheckBox ChkTips 
         Caption         =   "&Show Tips"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   6
         Top             =   2760
         Width           =   1215
      End
      Begin VB.Frame Frame1 
         Caption         =   "Repeat Play back"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   3135
         Left            =   2880
         TabIndex        =   25
         Top             =   240
         Width           =   2655
         Begin MSComCtl2.UpDown UpDownSec 
            Height          =   375
            Left            =   960
            TabIndex        =   29
            Top             =   2160
            Width           =   255
            _ExtentX        =   450
            _ExtentY        =   661
            _Version        =   393216
            BuddyControl    =   "txtsecond"
            BuddyDispid     =   196615
            OrigLeft        =   5040
            OrigTop         =   600
            OrigRight       =   5295
            OrigBottom      =   975
            Max             =   59
            SyncBuddy       =   -1  'True
            BuddyProperty   =   65547
            Enabled         =   0   'False
         End
         Begin MSComCtl2.UpDown UpDownMin 
            Height          =   375
            Left            =   960
            TabIndex        =   28
            Top             =   1680
            Width           =   255
            _ExtentX        =   450
            _ExtentY        =   661
            _Version        =   393216
            BuddyControl    =   "txtmin"
            BuddyDispid     =   196614
            OrigLeft        =   4440
            OrigTop         =   720
            OrigRight       =   4695
            OrigBottom      =   1095
            Max             =   59
            SyncBuddy       =   -1  'True
            BuddyProperty   =   65547
            Enabled         =   0   'False
         End
         Begin VB.TextBox txtmin 
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
            Height          =   375
            Left            =   480
            TabIndex        =   12
            Text            =   "0"
            Top             =   1680
            Width           =   480
         End
         Begin VB.TextBox txtsecond 
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
            Height          =   375
            Left            =   480
            TabIndex        =   13
            Text            =   "0"
            Top             =   2160
            Width           =   480
         End
         Begin VB.TextBox txthour 
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
            Height          =   375
            Left            =   480
            TabIndex        =   11
            Text            =   "0"
            Top             =   1200
            Width           =   480
         End
         Begin VB.OptionButton optrepeatperiod 
            Caption         =   "Repeat &for a specified period"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   178
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   120
            TabIndex        =   10
            Top             =   840
            Width           =   2415
         End
         Begin VB.OptionButton optrepeatforever 
            Caption         =   "Repeat for&ever "
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   178
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   120
            TabIndex        =   14
            Top             =   2760
            Width           =   1455
         End
         Begin VB.TextBox txtRepeat 
            Alignment       =   2  'Center
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   178
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00000000&
            Height          =   360
            Left            =   1080
            TabIndex        =   15
            ToolTipText     =   "Set the Repeat count of playback."
            Top             =   240
            Width           =   615
         End
         Begin VB.OptionButton optrepeatbycount 
            Caption         =   "&Repeat"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   178
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   120
            TabIndex        =   9
            Top             =   360
            Value           =   -1  'True
            Width           =   855
         End
         Begin MSComCtl2.UpDown UpDownHour 
            Height          =   375
            Left            =   960
            TabIndex        =   27
            Top             =   1200
            Width           =   255
            _ExtentX        =   450
            _ExtentY        =   661
            _Version        =   393216
            BuddyControl    =   "txthour"
            BuddyDispid     =   196616
            OrigLeft        =   3720
            OrigTop         =   720
            OrigRight       =   3975
            OrigBottom      =   1095
            Max             =   1200
            SyncBuddy       =   -1  'True
            BuddyProperty   =   65547
            Enabled         =   0   'False
         End
         Begin VB.Label Label4 
            Caption         =   "Second(s)"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   178
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   1320
            TabIndex        =   32
            Top             =   2280
            Width           =   855
         End
         Begin VB.Label Label3 
            Caption         =   "Minute(s)"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   178
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   1320
            TabIndex        =   31
            Top             =   1800
            Width           =   735
         End
         Begin VB.Label Label2 
            Caption         =   "Hour(s)"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   178
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   1320
            TabIndex        =   30
            Top             =   1320
            Width           =   615
         End
         Begin VB.Label Label1 
            Caption         =   "time(s)"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   178
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   1800
            TabIndex        =   26
            Top             =   360
            Width           =   495
         End
      End
      Begin VB.CheckBox chkRecordMouse 
         Caption         =   "Record &mouse events"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   3
         Top             =   1800
         Width           =   2055
      End
      Begin VB.CheckBox chkRecoKeyboard 
         Caption         =   "Record &keyboard events"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   5
         Top             =   2280
         Width           =   2415
      End
      Begin VB.CheckBox chkMinStartUp 
         Caption         =   $"frmOptions2.frx":058A
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   8
         Top             =   3720
         Width           =   3135
      End
      Begin VB.Frame fraPlaybackSpeed 
         Caption         =   "Play Back Speed"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1425
         Left            =   120
         TabIndex        =   24
         Top             =   240
         Width           =   2655
         Begin VB.OptionButton OptHigh 
            Caption         =   "&High Speed"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   178
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   240
            TabIndex        =   0
            Top             =   360
            Width           =   1215
         End
         Begin VB.OptionButton optNormalSpeed 
            Caption         =   "&Normal Speed"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   178
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   240
            TabIndex        =   1
            Top             =   720
            Value           =   -1  'True
            Width           =   1335
         End
         Begin VB.OptionButton optLowSpeed 
            Caption         =   "&Low Speed"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   178
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   240
            TabIndex        =   2
            Top             =   1080
            Width           =   1215
         End
      End
      Begin VB.CheckBox chkStartUp 
         Caption         =   "&Auto run on windows startup"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   7
         Top             =   3240
         Width           =   2535
      End
   End
   Begin VB.CommandButton cmdReset 
      Caption         =   "Reset defaults..."
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   360
      TabIndex        =   22
      TabStop         =   0   'False
      Top             =   4560
      Visible         =   0   'False
      Width           =   2415
   End
   Begin VB.CommandButton cmdAssign 
      Caption         =   "Assign"
      Default         =   -1  'True
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
      Height          =   375
      Left            =   2880
      TabIndex        =   23
      TabStop         =   0   'False
      Top             =   4080
      Visible         =   0   'False
      Width           =   1095
   End
   Begin VB.Frame fraKeyboardShortcuts 
      Height          =   4575
      Left            =   240
      TabIndex        =   18
      Top             =   480
      Visible         =   0   'False
      Width           =   5655
      Begin VB.TextBox txtshortcut 
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
         Height          =   375
         Left            =   120
         TabIndex        =   19
         TabStop         =   0   'False
         Text            =   "None"
         Top             =   3600
         Width           =   2415
      End
      Begin MSComctlLib.ListView lstShortCutKeys 
         Height          =   3255
         Left            =   120
         TabIndex        =   20
         TabStop         =   0   'False
         Top             =   240
         Width           =   5415
         _ExtentX        =   9551
         _ExtentY        =   5741
         View            =   3
         LabelEdit       =   1
         Sorted          =   -1  'True
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         FullRowSelect   =   -1  'True
         GridLines       =   -1  'True
         _Version        =   393217
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         Appearance      =   1
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         NumItems        =   3
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Text            =   "Description"
            Object.Width           =   6218
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   1
            Text            =   "Shortcut"
            Object.Width           =   3175
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   2
            Text            =   "Key ""Hidden Column"""
            Object.Width           =   1764
         EndProperty
      End
   End
   Begin VB.Timer tmrchecks 
      Interval        =   1
      Left            =   4800
      Top             =   0
   End
   Begin MSComctlLib.TabStrip tbsOptions 
      Height          =   5055
      Left            =   120
      TabIndex        =   4
      TabStop         =   0   'False
      Top             =   120
      Width           =   5895
      _ExtentX        =   10398
      _ExtentY        =   8916
      _Version        =   393216
      BeginProperty Tabs {1EFB6598-857C-11D1-B16A-00C0F0283628} 
         NumTabs         =   2
         BeginProperty Tab1 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "General"
            Key             =   "a1"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab2 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Keyboard Shortcuts"
            Key             =   "a2"
            ImageVarType    =   2
         EndProperty
      EndProperty
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
End
Attribute VB_Name = "frmOptions2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
                                '____oooooooooo_______oooooooo
                                '___ooooooooooooo___ooooooooooooo
                                '___oooooooooooooo_oooooooooooooo
                                '___ooooooooooooooooooooooooooooo
                                '____ooooooooooooooooooooooooooo
                                '_____ooooooooooooooooooooooooo
                                '______ooooooooooooooooooooooo
                                '_________oooooooooooooooooo
                                '___________ooooooooooooo
                                '_____________ooooooooo
                                '______________oooooo
                                '_______________oooo
                                '_______________ooo
                                '______________oo
                                '_____________o
                                '___________o
                                '________oo
                                '______ooo
                                '_____oooo
                                '___oooooo
                                '___ooooooo
                                '____oooooooo
                                '______oooooooo
                                '________oooooooo
                                '_________ooooooo
                                '_________ooooooo
                                '________oooooo........FrIeNdShIp
                                '_______ooooo.......Is Like A Flower;
                                '_____ooooo........Growing In Its Glory,
                                '___ooooo...........Telling its own story;
                                '__ooo.............FrIeNdShIp is Precious,
                                '__oo..................Not Only In Shade,
                                '__ o............But In D Sunshine Of Life.
                                '....Thanks For Being My Friend

'//To use frmOptions2 in the furter Software isA, you need
'//1.ModGlobals
'//2.frmOptions2
'//3.ModOptions
'//4.FrmTip2 "Optionally but if you won't use it then delete its calls from ModOptions "
'//5.Search ModOptions for "frmmain", and delete all instances of frmmain
            
            '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
            '�I think the main reason for our success is that PHP has always been focused '
            'on Web development and it has always been developed by Web developers. Unlike'
            'other languages, which are general purpose language and then adopted to work '
            'on the Web, PHP is only meant for the Web.�                                  '
            '                                                                 Andi Gutmans'
            '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

Option Explicit

'//To now how to add a new shortcut, Search the whole project for '//ShortCut How To
'//And don't forget to Hit Reset Defaults Button after any change you made to the shortcut scheme

'//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
Private Sub Form_Load()
'//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
          
    '//Step 1 to hide the third column in the list view
    ShowScrollBar lstShortCutKeys.hWnd, SB_HORZ, False
    
    
    lstShortCutKeys.ListItems.Add , My_Macros, My_Macros
    lstShortCutKeys.ListItems.Add , OptionsWin, OptionsWin
    lstShortCutKeys.ListItems.Add , Pause_Play_back, Pause_Play_back
    lstShortCutKeys.ListItems.Add , Pause_Recording, Pause_Recording
    lstShortCutKeys.ListItems.Add , Resume_Play_back, Resume_Play_back
    lstShortCutKeys.ListItems.Add , Resume_Record, Resume_Record
    lstShortCutKeys.ListItems.Add , Show_Perfect_Macro_Recorder, Show_Perfect_Macro_Recorder
    lstShortCutKeys.ListItems.Add , Start_Recording, Start_Recording
    lstShortCutKeys.ListItems.Add , Stop_Play_back, Stop_Play_back
    lstShortCutKeys.ListItems.Add , Stop_Record, Stop_Record
    
    '//lstShortCutKeys.ListItems.Add , RevertWindowsVisibilty, RevertWindowsVisibilty
      '//pt 1July2007: commented next line to Delete Show Foreground Window Shortcut key
    '//lstShortCutKeys.ListItems.Add , Show_Foreground_Window, Show_Foreground_Window
    'el tarteeb is very importatn here by the order in the listview
    '//1.don't forget to order in the same order in the listview
    '//lstShortCutKeys.ListItems.Add , "Key Name here", "Key Name here" '//ShortCut How To
       
    '//Load ShortCuts from the ini file
    LoadShortcutKeys
    
    '//Load General options from the ini file
    LoadGenOptions
    
    'Dim SelTabSettings As Integer
    'SelTabSettings = GetINIProfileInt("SelTab", 0)
    'If SelTabSettings Then
    '   If tbsOptions.SelectedItem.Caption = "General" Then
    '  '    tbsOptions..SelectedItem.Selected
    '   End If
    'Else
    '  ' tbsOptions.SelectedItem.Caption = "General"
    'End If
    
    '//commented next line because it causes a delay in opening this form
    '//SubClass txtShortcut to disable the shortcut menu
    'SubtxtShortCut.BeginSubClass txtshortcut.hwnd
    
    '//Adjust fraGeneral to be exactly below fraKeybaordShortcuts
    fraGeneral.Top = fraKeyboardShortcuts.Top
    fraGeneral.Left = fraKeyboardShortcuts.Left
    fraGeneral.Width = fraKeyboardShortcuts.Width
    fraGeneral.Height = fraKeyboardShortcuts.Height
    'fraGeneral.BorderStyle = 0
    'fraKeyboardShortcuts.BorderStyle = 0
    
    '//Show the appropriate frame
    If tbsOptions.SelectedItem.Caption = "General" Then
        '//unfortunatly , for unknown reason, the command buttons appears in abnormal way in WinXP
        '//hence i didn't put the buttons in any frames
        'cmdOk.Visible = False
        cmdReset.Visible = False
        'cmdCancel.Visible = False
        cmdAssign.Visible = False
        fraGeneral.Visible = True
        fraKeyboardShortcuts.Visible = False
        'cmdGenCancel.Visible = True
        'cmdGenOK.Visible = True
   ElseIf tbsOptions.SelectedItem.Caption = "Keyboard Shortcuts" Then
         '//unfortunatly , for unknown reason, the command buttons appears in abnormal way in WinXP
         '//hence i didn't put the buttons in any frames
         'cmdOk.Visible = True
         cmdReset.Visible = True
         'cmdCancel.Visible = True
         cmdAssign.Visible = True
         fraGeneral.Visible = False
         fraKeyboardShortcuts.Visible = True
         'cmdGenCancel.Visible = False
         'cmdGenOK.Visible = False
    End If

End Sub

'//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
'//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
    
    '//Ctrl+Shift+Alt+Escape causes the form to lost the focus hence, i 'll disable it
    If KeyCode = vbKeyEscape And GetAsyncKeyState(18) And GetAsyncKeyState(vbKeyControl) And GetAsyncKeyState(vbKeyShift) Then
       txtshortcut = "" '//clear txtshortcut
       KeyCode = 0 '//disable the key
       Exit Sub '//exit the sub so that the form won't unloaded
    End If
    
    '//if the user choose "Shift + Esc" then we 'll exit this sub in order to prevent unloading this form
    If GetAsyncKeyState(vbKeyEscape) And GetAsyncKeyState(vbKeyShift) Then
       txtshortcut = "": Exit Sub
    End If
        
    '//if the user choose "Ctrl + Esc" then we 'll exit this sub in order to prevent unloading this form
    If GetAsyncKeyState(vbKeyEscape) And GetAsyncKeyState(vbKeyControl) Then
       txtshortcut = "": Exit Sub
    End If
        
    '//Note that we enable "Key Preview" property for this form in order to process the following line
    '//Unload me if Esc key hit by the user
    If KeyCode = vbKeyEscape Then Unload Me
              
End Sub


'//if the user click any item in the listview then i 'll do the following
'//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
Private Sub lstShortCutKeys_ItemClick(ByVal Item As MSComctlLib.ListItem)
'//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
    Dim i As Integer
    Dim KeyCode As String
    
    '//only call DecodeKey, if subitems(2) isn't blank in order to avoid error comes up
    '//from inside DecodeKey when using left and mid function with a blank values
    If lstShortCutKeys.SelectedItem.SubItems(2) <> "" Then
        DecodeKey lstShortCutKeys.SelectedItem.SubItems(2), KeyCode
    End If
    '//Note that txtshortcut.Tag contains only the KeyCode of the Shortcut being Displayed in it
    '//Ctrl + S , then it contains the asc("S") only, if Ctrl + then it contains asc("Ctrl") only
    '//why txtshortcut.Tag = KeyCode??
    '//To get the chr itself quickly and use it in EncodeKey and in any place where i want to the asc value of the key itself displayed in txtshortcut
     txtshortcut.Tag = KeyCode
     
    
    '//Load the txtShortCut with the shortcut shown in the listview
    txtshortcut.Text = lstShortCutKeys.SelectedItem.SubItems(1)
    
    '//Clear the bold property
    For i = 1 To lstShortCutKeys.ListItems.Count
        lstShortCutKeys.ListItems(i).Bold = False
    Next i
    
    '//Set the bold prop to the selected item in order to be distgusiable and when the user choose a shortcut key
    lstShortCutKeys.SelectedItem.Bold = True
    
    txtshortcut.Enabled = True '//enable txtshortcut
  
End Sub

'//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
Private Sub lstShortCutKeys_KeyDown(KeyCode As Integer, Shift As Integer)
'//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
    
    '//Step 2 to hide the third column in the list view
    If KeyCode = vbKeyRight Then KeyCode = 0

End Sub

'//Show the appropriate frame and button due to Tab change
'//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
Private Sub tbsOptions_Click()
'//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
    
    '//Show the appropriate frame
    If tbsOptions.SelectedItem.Caption = "General" Then
        '//unfortunatly , for unknown reason, the command buttons appears in abnormal way in WinXP
        '//hence i didn't put the buttons in any frames
        'cmdOk.Visible = False
        cmdReset.Visible = False
        'cmdCancel.Visible = False
        cmdAssign.Visible = False
        fraGeneral.Visible = True
        fraKeyboardShortcuts.Visible = False
        'cmdGenCancel.Visible = True
        'cmdGenOK.Visible = True
     ElseIf tbsOptions.SelectedItem.Caption = "Keyboard Shortcuts" Then
        '//unfortunatly , for unknown reason, the command buttons appears in abnormal way in WinXP
        '//hence i didn't put the buttons in any frames
        'cmdOk.Visible = True
        cmdReset.Visible = True
        'cmdCancel.Visible = True
        cmdAssign.Visible = True
        fraGeneral.Visible = False
        fraKeyboardShortcuts.Visible = True
        'cmdGenCancel.Visible = False
        'cmdGenOK.Visible = False
     End If

End Sub

'//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
Private Sub cmdAssign_Click()
'//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
    
    Dim LstIndex As Integer
    Dim EncodedKey As String
    Dim MsgRes As VbMsgBoxResult
    
    '//Disable the shortcut key if txtshortcut is ""
    If txtshortcut = "" Then
        '//Why using a TAB rather than using a space ""??
        '//For a reason in which i don't know, if i use a space, this cause the subitems fields to
        '//not change hence it still as it is and this causes duplicating the value in the listview
        '//i don't know why
        lstShortCutKeys.SelectedItem.SubItems(1) = "  "
        lstShortCutKeys.SelectedItem.SubItems(2) = "  "
        Exit Sub
    End If
    
    '//Note that txtshortcut.Tag contains only the KeyCode of the Shortcut being Displayed in it
    '//Ctrl + S , then it contains the asc("S") only, if Ctrl + then it contains asc("Ctrl") only
    If txtshortcut.Tag = vbKeyShift Or txtshortcut.Tag = vbKeyControl Or txtshortcut.Tag = 18 Then
       '//Don't process anything if the user click Assign button while press nothing but
       '//Ctrl or Shift or Alt
       txtshortcut = ""
       Exit Sub
    End If
    
    EncodedKey = EncodeKey(txtshortcut) '//Encode the shortcut
    
    '//Loop through the listview to check if the shortcut is already used
    For LstIndex = 1 To lstShortCutKeys.ListItems.Count
    
        If InStr(1, EncodedKey, lstShortCutKeys.ListItems.Item(LstIndex).SubItems(2)) <> 0 And lstShortCutKeys.ListItems.Item(LstIndex).SubItems(2) <> "" Then
           '//EncodedKey = $somevaluse$ and lstShortCutKeys.ListItems.Item(LstIndex).SubItems(2) = "" hence the return value
           '//of InStr will be > 0 and this will cause to exit this sub without changing the shortcut .
           '//but i want to exit this sub only if EncodedKey == lstShortCutKeys.ListItems.Item(LstIndex).SubItems(2)
           
           '//if this shortcut key already assigned to the selected item so no need to do any thing
           If InStr(1, EncodedKey, lstShortCutKeys.SelectedItem.SubItems(2)) And lstShortCutKeys.SelectedItem.SubItems(2) <> "" Then Exit Sub
           '//note that we add this ' And lstShortCutKeys.SelectedItem.SubItems(2) <> "" ' to the previous line to handle this case
           '//EncodedKey = $somevaluse$ and lstShortCutKeys.SelectedItem.SubItems(2) = "" hence the return value
           '//of InStr will be > 0 and this will cause to exit this sub without changing the shortcut .
           '//but i want to exit this sub only if EncodedKey == lstShortCutKeys.SelectedItem.SubItems(2)
           
           '//Key is already used
           MsgRes = MsgBox("This shortcut is already assigned to " & Chr(34) & lstShortCutKeys.ListItems.Item(LstIndex).Text & Chr(34) & ". Do you wish to reassign it?", vbQuestion + vbYesNo, "Confirmation")
           '//Ask the user
           If MsgRes = vbYes Then
              '//Why using a TAB rather than using a space ""??
              '//For a reason in which i don't know, if i use a space, this cause the subitems fields to
              '//not change hence it still as it is and this causes duplicating the value in the listview
              '//i don't know why
              lstShortCutKeys.ListItems.Item(LstIndex).SubItems(1) = "  " '//Yes then disable the old key
              lstShortCutKeys.ListItems.Item(LstIndex).SubItems(2) = "  "
              GoTo assign: '// and go to assign to write the shortcut key in the listview to the new function
           ElseIf MsgRes = vbNo Then
              Exit Sub
           End If
            
        End If
    
    Next LstIndex
assign:
    lstShortCutKeys.SelectedItem.SubItems(1) = txtshortcut '//write the shortcut to list view
    lstShortCutKeys.SelectedItem.SubItems(2) = EncodedKey

End Sub

'//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
Private Sub cmdOk_Click()
'//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
   
   '//Verrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrry important
   '//If you decide to delete a shortcut key from the listview, Do not EVER forget
   '//to re-adjust the "lstShortCutKeys.ListItems.Item(X)" below
   '//for example if you delete item (4) , then item(5) will be (4) and so on
   '//And don't forget to Hit Reset Defaults Button after any change you made to the shortcut scheme

   WriteToINIProfile My_Macros, lstShortCutKeys.ListItems.Item(1).SubItems(2)
   WriteToINIProfile OptionsWin, lstShortCutKeys.ListItems.Item(2).SubItems(2)
   WriteToINIProfile Pause_Play_back, lstShortCutKeys.ListItems.Item(3).SubItems(2)
   WriteToINIProfile Pause_Recording, lstShortCutKeys.ListItems.Item(4).SubItems(2)
   WriteToINIProfile Resume_Play_back, lstShortCutKeys.ListItems.Item(5).SubItems(2)
   WriteToINIProfile Resume_Record, lstShortCutKeys.ListItems.Item(6).SubItems(2)
   WriteToINIProfile Show_Perfect_Macro_Recorder, lstShortCutKeys.ListItems.Item(7).SubItems(2)
   WriteToINIProfile Start_Recording, lstShortCutKeys.ListItems.Item(8).SubItems(2)
   WriteToINIProfile Stop_Play_back, lstShortCutKeys.ListItems.Item(9).SubItems(2)
   WriteToINIProfile Stop_Record, lstShortCutKeys.ListItems.Item(10).SubItems(2)
   
   '//pt 1July2007: commented next line to Delete Revert Shortcut key
   '//WriteToINIProfile RevertWindowsVisibilty, lstShortCutKeys.ListItems.Item(4).SubItems(2)
   '//pt 1July2007: commented next line to Delete Show Foreground Window Shortcut key
   '//WriteToINIProfile Show_Foreground_Window, lstShortCutKeys.ListItems.Item(5).SubItems(2)
    'el tarteeb is very importatn here by the order in the listview
   '//1.don't forget to order in the same order in the listview
   '//2.don't forget "Increment Index here"
   '//WriteToINIProfile KeyName here, lstShortCutKeys.ListItems.Item(Increment Index here).SubItems(2) '//ShortCut How To

    WriteToINIProfile "chkStartUp", chkStartUp.Value
              
    Dim AppExeName As String
     
    If chkStartUp.Value = 1 Then
         
         SaveSetting App.EXEName, "chk", "chk", "ok"
         
         AppExeName = App.Path & IIf(right(App.Path, 1) = "\", "", "\") & App.EXEName
                 
         If Not right(AppExeName, 4) = ".exe" Then AppExeName = AppExeName & ".exe"
         
          '//cprin 10Aug2006: change next line to change registery entry from Smart Macro to PMR
          'savestring HKEY_LOCAL_MACHINE, "SOFTWARE\Microsoft\Windows\CurrentVersion\Run", "Smart Macro", AppExeName & Space(1) & "hide"
          savestring HKEY_LOCAL_MACHINE, "SOFTWARE\Microsoft\Windows\CurrentVersion\Run", "PMR", AppExeName & Space(1) & "hide"
    Else
          
          SaveSetting App.EXEName, "chk", "chk", ""
          '//cprin 10Aug2006: change next line to change registery entry from Smart Macro to PMR
          'savestring HKEY_LOCAL_MACHINE, "SOFTWARE\Microsoft\Windows\CurrentVersion\Run", "Smart Macro", ""
          savestring HKEY_LOCAL_MACHINE, "SOFTWARE\Microsoft\Windows\CurrentVersion\Run", "PMR", ""
    
    
    End If
           
    If OptHigh Then
       WriteToINIProfile "PlaybackSpeed", "h"
       frmJMacro.cmdPlayBack.Tag = "h"
    ElseIf optLowSpeed Then
       WriteToINIProfile "PlaybackSpeed", "l"
       frmJMacro.cmdPlayBack.Tag = "l"
    ElseIf optNormalSpeed Then
       WriteToINIProfile "PlaybackSpeed", "n"
       frmJMacro.cmdPlayBack.Tag = "n"
    End If
             
    WriteToINIProfile "chkRecoKeyboard", chkRecoKeyboard.Value
   
    WriteToINIProfile "chkRecordMouse", chkRecordMouse.Value
   
    If ChkTips.Value = 1 Then
       SaveSetting App.EXEName, "k", "d", ""
    Else
       SaveSetting App.EXEName, "k", "d", "one"
    End If
    
     If optrepeatbycount.Value Then
       WriteToINIProfile "repeat", 1
       WriteToINIProfile "repeatcount", txtRepeat
    ElseIf optrepeatperiod.Value Then
       WriteToINIProfile "repeat", 2
       WriteToINIProfile "tms", txthour & "#" & txtmin & "," & txtsecond & "*"
       WriteToINIProfile "tmsv", (txtsecond + txtmin * 60 + txthour * 60 * 60) * 1000 & "#"
    ElseIf optrepeatforever.Value Then
       WriteToINIProfile "repeat", 3
    End If

    Unload Me
   
End Sub

'//Reset to Default ShortcutKey
'//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
Private Sub cmdReset_Click()
'//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
    
    Dim MsgBoxRes As VbMsgBoxResult
    
    MsgBoxRes = MsgBox("Reset the keyboard shortcuts to their defaults?", vbYesNo + vbQuestion, "Confirmation")

    '//if the user select to reset
    If MsgBoxRes = vbYes Then '//then Reset to defaul
        ResetDefaults
        LoadShortcutKeys
    End If
    
End Sub

'//Reset to the Defaults Shortcut keys
'//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
Private Sub ResetDefaults()
'//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
   
   '//to add a new key in the future
   '//1. add DefChar var
   '//2. assign DefChar to the str of an asc value of the char
   '//3. add WriteToINIProfile
   
   Dim DefChar1 As String, DefChar2 As String, DefChar3 As String, DefChar4 As String, DefChar5 As String
   Dim DefChar6 As String, DefChar7 As String, DefChar8 As String, DefChar9 As String, DefChar10 As String
   Dim DefChar11 As String, DefChar12 As String
   
   DefChar1 = Str(vbKeyF9)  '//F9
   '//pt 1July2007: commented next line to Delete Revert Shortcut key
   '//DefChar2 = Str(Asc("R")) '//Get the ASC value of R
   DefChar3 = Str(Asc("O")) '//Get the ASC value of S
   DefChar4 = Str(vbKeyPause) '//Get the ASC value of H
   DefChar5 = Str(Asc("M")) '//Get the ASC value of M
   DefChar6 = Str(Asc("F")) '//Get the ASC value of F
   DefChar7 = Str(vbKeyF11)
   DefChar8 = Str(vbKeyInsert)
   DefChar9 = Str(vbKeyPause)
   DefChar10 = Str(Asc("S"))
   DefChar11 = Str(vbKeyInsert)
   DefChar12 = Str(vbKeyF10)
   
   '//DefCharX = Str(ASC("Char Here")) '//ShortCut How To
   
   '//it means "Ctrl,Alt,Shift#Key*"
   '//for example:
   '//"1,1,0#" & DefChar1 & "*"
   '//1 mean Ctrl,1 mean Alt,0 means no shift,# the first delimiter of the ASC value, * the second delimiter of the ASC value
        
   WriteToINIProfile My_Macros, "1,1,0#" & DefChar5 & "*"
   WriteToINIProfile OptionsWin, "1,1,0#" & DefChar3 & "*"
   WriteToINIProfile Pause_Play_back, "0,0,0#" & DefChar4 & "*"
   WriteToINIProfile Pause_Recording, "0,0,0#" & DefChar8 & "*"
   WriteToINIProfile Resume_Play_back, "0,1,0#" & DefChar9 & "*"
   WriteToINIProfile Resume_Record, "0,1,0#" & DefChar11 & "*"
   WriteToINIProfile Show_Perfect_Macro_Recorder, "1,1,0#" & DefChar10 & "*"
   WriteToINIProfile Start_Recording, "0,1,0#" & DefChar1 & "*"
   WriteToINIProfile Stop_Play_back, "0,1,0#" & DefChar7 & "*"
   WriteToINIProfile Stop_Record, "0,1,0#" & DefChar12 & "*"

   '//pt 1July2007: commented next line to Delete Revert Shortcut key
   '//WriteToINIProfile RevertWindowsVisibilty, "1,1,0#" & DefChar2 & "*"
    '//pt 1July2007: commented next line to Delete Show Foreground Window Shortcut key
   '//WriteToINIProfile Show_Foreground_Window, "1,1,0#" & DefChar6 & "*"
   'el tarteeb is very importatn here by the order in the listview
   '//1.don't forget to order in the same order in the listview
   '//WriteToINIProfile "KeyName Here", "DecodedCodeHere" & DefCharX & "*" '//ShortCut How To



End Sub

'//Load ShortCutKeys from the ini file
'//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
Private Sub LoadShortcutKeys()
'//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
   
   '//to load a new char in the future
   '//1.add DefChar that will represent the default value for GetINIProfileString
   '//2. Assign DefChar
   '//call GetINIProfileString and a line like this:
   '//lstShortCutKeys.ListItems.Item(Hide_Me).SubItems(1) = DecodeKey(dkey)
   
   Dim dkey As String * 15 '//why 15, coz it larger than "1,1,1#256*
   
   Dim DefChar1 As String
   '//pt 1July2007: commented next line to Delete Revert Shortcut key
   '//Dim DefChar2 As String
   Dim DefChar3 As String
   Dim DefChar4 As String
   Dim DefChar5 As String
   '//pt 1July2007: commented next line to Delete Show Foreground Window Shortcut key
   '//Dim DefChar6 As String
   Dim DefChar7 As String
   Dim DefChar8 As String
   Dim DefChar9 As String
   Dim DefChar10 As String
   Dim DefChar11 As String
   Dim DefChar12 As String
   
   DefChar1 = Str(vbKeyF9) '//Get the ASC value of Space
   '//pt 1July2007: commented next line to Delete Revert Shortcut key
   '//DefChar2 = Str(Asc("R")) '//Get the ASC value of R
   DefChar3 = Str(Asc("O")) '//Get the ASC value of S
   DefChar4 = Str(vbKeyPause)  '//F10 Key
   DefChar5 = Str(Asc("M")) '//Get the ASC value of M
   '//pt 1July2007: commented next line to Delete Show Foreground Window Shortcut key
   '//DefChar6 = Str(Asc("F")) '//Get the ASC value of F
   DefChar7 = Str(vbKeyF11) '//F10
   DefChar8 = Str(vbKeyInsert)  '//Pause
   DefChar9 = Str(vbKeyPause)  '//Insert
   '//DefCharX = Str(Asc("Code Here")) '//ShortCut How To
   DefChar10 = Str(Asc("S")) '//Get the ASC value of S
   DefChar11 = Str(vbKeyInsert) '//Insert
   DefChar12 = Str(vbKeyF10)
   
   dkey = ""
   '//Get the value of Hide_Me stored in the ini file
   GetINIProfileString OptionsWin, "1,1,0#" & DefChar3 & "*", dkey, Len(dkey)
   If InStr(1, dkey, "#") <> 0 Then '//if it is not a blank field
        '//then load the listview the keys and the hidden encoded value
        lstShortCutKeys.ListItems.Item(OptionsWin).SubItems(1) = DecodeKey(dkey)
        '//write the endcoded value to the hidden column
        lstShortCutKeys.ListItems.Item(OptionsWin).SubItems(2) = dkey
   End If
   '//Wait a second, what is the blank field, we reterived a blank vlaue from ini if the user
   '//reassign a shortcut key and use a shortcut key used for another function before then the old function
   '//shortcut key is got blank
   
   '//pt 1July2007: commented next clause to Delete Revert Shortcut key
   '//dkey = "" '//we must clear dkey otherwise it may hold the value of the previous use
   '//and this will cause a bug in displaying the key
   '//for example: if a function has no key, then it will be stored as a blank value in ini
   '//and if dkey has this value from the prevoius use "1,1,1#256*" , then
   '//it will be "1,1#256*"
   '//GetINIProfileString RevertWindowsVisibilty, "1,1,0#" & DefChar2 & "*", dkey, Len(dkey)
   '//If InStr(1, dkey, "#") <> 0 Then
   '//     lstShortCutKeys.ListItems.Item(RevertWindowsVisibilty).SubItems(1) = DecodeKey(dkey)
        '//write the endcoded value to the hidden column
   '//     lstShortCutKeys.ListItems.Item(RevertWindowsVisibilty).SubItems(2) = dkey
   '//End If
      
   dkey = "" '//we must clear dkey otherwise it may hold the value of the previous use
   '//and this will cause a bug in displaying the key
   '//for example: if a function has no key, then it will be stored as a blank value in ini
   '//and if dkey has this value from the prevoius use "1,1,1#256*" , then
   '//it will be "1,1#256*"
   GetINIProfileString My_Macros, "1,1,0#" & DefChar5 & "*", dkey, Len(dkey)
   If InStr(1, dkey, "#") <> 0 Then
        lstShortCutKeys.ListItems.Item(My_Macros).SubItems(1) = DecodeKey(dkey)
        '//write the endcoded value to the hidden column
        lstShortCutKeys.ListItems.Item(My_Macros).SubItems(2) = dkey
   End If
   
   dkey = "" '//we must clear dkey otherwise it may hold the value of the previous use
   '//and this will cause a bug in displaying the key
   '//for example: if a function has no key, then it will be stored as a blank value in ini
   '//and if dkey has this value from the prevoius use "1,1,1#256*" , then
   '//it will be "1,1#256*"
   GetINIProfileString Pause_Play_back, "0,0,0#" & DefChar4 & "*", dkey, Len(dkey)
   If InStr(1, dkey, "#") <> 0 Then
        lstShortCutKeys.ListItems.Item(Pause_Play_back).SubItems(1) = DecodeKey(dkey)
        '//write the endcoded value to the hidden column
        lstShortCutKeys.ListItems.Item(Pause_Play_back).SubItems(2) = dkey
   End If
    
   dkey = "" '//we must clear dkey otherwise it may hold the value of the previous use
   '//and this will cause a bug in displaying the key
   '//for example: if a function has no key, then it will be stored as a blank value in ini
   '//and if dkey has this value from the prevoius use "1,1,1#256*" , then
   '//it will be "1,1#256*"
   GetINIProfileString OptionsWin, "1,1,0#" & DefChar3 & "*", dkey, Len(dkey)
   If InStr(1, dkey, "#") <> 0 Then
        lstShortCutKeys.ListItems.Item(OptionsWin).SubItems(1) = DecodeKey(dkey)
        '//write the endcoded value to the hidden column
        lstShortCutKeys.ListItems.Item(OptionsWin).SubItems(2) = dkey
   End If
  
   dkey = "" '//we must clear dkey otherwise it may hold the value of the previous use
   '//and this will cause a bug in displaying the key
   '//for example: if a function has no key, then it will be stored as a blank value in ini
   '//and if dkey has this value from the prevoius use "1,1,1#256*" , then
   '//it will be "1,1#256*"
   GetINIProfileString Start_Recording, "0,1,0#" & DefChar1 & "*", dkey, Len(dkey)
   If InStr(1, dkey, "#") <> 0 Then
        lstShortCutKeys.ListItems.Item(Start_Recording).SubItems(1) = DecodeKey(dkey)
        '//write the endcoded value to the hidden column
        lstShortCutKeys.ListItems.Item(Start_Recording).SubItems(2) = dkey
   End If
   
   dkey = "" '//we must clear dkey otherwise it may hold the value of the previous use
   '//and this will cause a bug in displaying the key
   '//for example: if a function has no key, then it will be stored as a blank value in ini
   '//and if dkey has this value from the prevoius use "1,1,1#256*" , then
   '//it will be "1,1#256*" 'koko
   GetINIProfileString Stop_Play_back, "0,1,0#" & DefChar7 & "*", dkey, Len(dkey)
   If InStr(1, dkey, "#") <> 0 Then
      lstShortCutKeys.ListItems.Item(Stop_Play_back).SubItems(1) = DecodeKey(dkey)
      '//write the endcoded value to the hidden column
      lstShortCutKeys.ListItems.Item(Stop_Play_back).SubItems(2) = dkey
   End If
  
   dkey = "" '//we must clear dkey otherwise it may hold the value of the previous use
   '//and this will cause a bug in displaying the key
   '//for example: if a function has no key, then it will be stored as a blank value in ini
   '//and if dkey has this value from the prevoius use "1,1,1#256*" , then
   '//it will be "1,1#256*" koko
   GetINIProfileString Pause_Recording, "0,0,0#" & DefChar8 & "*", dkey, Len(dkey)
   If InStr(1, dkey, "#") <> 0 Then
      lstShortCutKeys.ListItems.Item(Pause_Recording).SubItems(1) = DecodeKey(dkey)
      '//write the endcoded value to the hidden column
      lstShortCutKeys.ListItems.Item(Pause_Recording).SubItems(2) = dkey
   End If
   
   dkey = "" '//we must clear dkey otherwise it may hold the value of the previous use
   '//and this will cause a bug in displaying the key
   '//for example: if a function has no key, then it will be stored as a blank value in ini
   '//and if dkey has this value from the prevoius use "1,1,1#256*" , then
   '//it will be "1,1#256*"
   GetINIProfileString Resume_Play_back, "0,1,0#" & DefChar9 & "*", dkey, Len(dkey)
   If InStr(1, dkey, "#") <> 0 Then
      lstShortCutKeys.ListItems.Item(Resume_Play_back).SubItems(1) = DecodeKey(dkey)
      '//write the endcoded value to the hidden column
      lstShortCutKeys.ListItems.Item(Resume_Play_back).SubItems(2) = dkey
   End If
   
   dkey = "" '//we must clear dkey otherwise it may hold the value of the previous use
   '//and this will cause a bug in displaying the key
   '//for example: if a function has no key, then it will be stored as a blank value in ini
   '//and if dkey has this value from the prevoius use "1,1,1#256*" , then
   '//it will be "1,1#256*"
   GetINIProfileString Show_Perfect_Macro_Recorder, "1,1,0#" & DefChar10 & "*", dkey, Len(dkey)
   If InStr(1, dkey, "#") <> 0 Then
      lstShortCutKeys.ListItems.Item(Show_Perfect_Macro_Recorder).SubItems(1) = DecodeKey(dkey)
      '//write the endcoded value to the hidden column
      lstShortCutKeys.ListItems.Item(Show_Perfect_Macro_Recorder).SubItems(2) = dkey
   End If
   
   dkey = "" '//we must clear dkey otherwise it may hold the value of the previous use
   '//and this will cause a bug in displaying the key
   '//for example: if a function has no key, then it will be stored as a blank value in ini
   '//and if dkey has this value from the prevoius use "1,1,1#256*" , then
   '//it will be "1,1#256*"
   GetINIProfileString Resume_Record, "0,1,0#" & DefChar11 & "*", dkey, Len(dkey)
   If InStr(1, dkey, "#") <> 0 Then
      lstShortCutKeys.ListItems.Item(Resume_Record).SubItems(1) = DecodeKey(dkey)
      '//write the endcoded value to the hidden column
      lstShortCutKeys.ListItems.Item(Resume_Record).SubItems(2) = dkey
   End If
        
   dkey = "" '//we must clear dkey otherwise it may hold the value of the previous use
   '//and this will cause a bug in displaying the key
   '//for example: if a function has no key, then it will be stored as a blank value in ini
   '//and if dkey has this value from the prevoius use "1,1,1#256*" , then
   '//it will be "1,1#256*"
   GetINIProfileString Stop_Record, "0,1,0#" & DefChar12 & "*", dkey, Len(dkey)
   If InStr(1, dkey, "#") <> 0 Then
      lstShortCutKeys.ListItems.Item(Stop_Record).SubItems(1) = DecodeKey(dkey)
      '//write the endcoded value to the hidden column
      lstShortCutKeys.ListItems.Item(Stop_Record).SubItems(2) = dkey
   End If
        
   '//ShortCut How To /////////////////////////////////////////////////////////////
   '$$$dkey = "" '//we must clear dkey otherwise it may hold the value of the previous use
   '//and this will cause a bug in displaying the key
   '//for example: if a function has no key, then it will be stored as a blank value in ini
   '//and if dkey has this value from the prevoius use "1,1,1#256*" , then
   '//it will be "1,1#256*"
   '$$$GetINIProfileString KeyNameHere, "1,1,0#" & DefCharX & "*", dkey, Len(dkey)
   '$$If InStr(1, dkey, "#") <> 0 Then
   '$$$     lstShortCutKeys.ListItems.Item(KeyNameHere).SubItems(1) = DecodeKey(dkey)
   '     '//write the endcoded value to the hidden column
   '$$$     lstShortCutKeys.ListItems.Item(KeyNameHere).SubItems(2) = dkey
   '$$$End If
   '//////////////////////////////////////////////////////////////////////////////////
   
End Sub

'//Load General options from the ini file
'//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
Private Sub LoadGenOptions()
'//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
   
   Dim res As Integer
   Dim dkey As String * 2

   res = GetINIProfileInt("chkStartUp", 0)
   
   If res Then chkStartUp.Value = 1
     
   GetINIProfileString "PlaybackSpeed", "n", dkey, Len(dkey)
   
   If InStr(1, dkey, "l") <> 0 Then
      optLowSpeed.Value = True
   ElseIf InStr(1, dkey, "n") <> 0 Then
      optNormalSpeed.Value = True
   ElseIf InStr(1, dkey, "h") <> 0 Then
      OptHigh.Value = True
   End If
       
   res = GetINIProfileInt("chkMinStartUp", 0)
   
   If res Then chkMinStartUp.Value = 1

   res = GetINIProfileInt("chkRecoKeyboard", 1)
   
   If res Then chkRecoKeyboard.Value = 1

   res = GetINIProfileInt("chkRecordMouse", 1)
   
   If res Then chkRecordMouse.Value = 1
   
   Dim TipState As String

   TipState = GetSetting(App.EXEName, "k", "d", "")
   
   If TipState = "" Then
      ChkTips.Value = 1
   Else
      ChkTips.Value = 0
   End If
 
   res = GetINIProfileInt("repeat", 1)
   
   Dim WhereHash As Integer
   Dim WhereStar As Integer
   Dim dkey2 As String * 20
   Dim WhereComma As Integer
   Dim H As Long, M As Long, S As Variant
    
   Select Case res
          
          Case 1
               
               optrepeatbycount.Value = True
               txtRepeat = GetINIProfileInt("repeatcount", 1)
          
          Case 2

               optrepeatperiod.Value = True
               GetINIProfileString "tms", "0", dkey2, Len(dkey2)
               WhereHash = InStr(1, dkey2, "#")
               H = Left(dkey2, WhereHash - 1)
               txthour = H
               WhereComma = InStr(1, dkey2, ",")
               M = Mid(dkey2, WhereHash + 1, WhereComma - WhereHash - 1)
               txtmin = M
               WhereStar = InStr(1, dkey2, "*")
               S = Mid(dkey2, WhereComma + 1, WhereStar - WhereComma - 1)
               txtsecond = S
        
          Case 3
               
               optrepeatforever.Value = True
               
   End Select
     
     
  ' If optrepeatbycount.Value Then
  '     WriteToINIProfile "repeat", 1
  '     WriteToINIProfile "repeatcount", txtRepeat
  '  ElseIf optrepeatperiod.Value Then
  '     TotalMillSeconds = (txtsecond + txtmin * 60 + txthour * 60 * 60) * 1000
  '     WriteToINIProfile "repeat", 2
  '     WriteToINIProfile "tms", TotalMillSeconds
  '  ElseIf optrepeatforever.Value Then
  '     WriteToINIProfile "repeat", 3
  '  End If
    
End Sub

'//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
Private Sub tmrchecks_Timer()
'//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
    '//Why i add this Timer??, because i can't catch this shortcut "Ctrl+Esc" because
    '//it makes the form lost focus hence niether txtshortcut_keydown nor from_keydown catch this event
    '//What will happen if if i didn't add this timer??
    '//txtshortcut will have this value "Ctrl + ", and if the user click Assign then he/she get "Keycode Error"
    '//if the user choose "Ctrl + Esc" then we 'll exit this sub in order to prevent unloading this form
    If GetAsyncKeyState(vbKeyEscape) And GetAsyncKeyState(vbKeyControl) Then
       txtshortcut = ""
    End If
            
    txthour.Enabled = optrepeatperiod.Value
    txtmin.Enabled = optrepeatperiod.Value
    txtsecond.Enabled = optrepeatperiod.Value
    UpDownHour.Enabled = optrepeatperiod.Value
    UpDownMin.Enabled = optrepeatperiod.Value
    UpDownSec.Enabled = optrepeatperiod.Value

        
         
    '//Note that you may use this timer in a further checking in the future isA
End Sub

Private Sub txthour_Change()

If IsNumeric(txthour) And Val(txthour) >= 0 Then


Else
    
    txthour.Text = ""

End If

End Sub

Private Sub txtmin_Change()

If IsNumeric(txtmin) And Val(txtmin) >= 0 Then


Else
    
    txtmin.Text = ""

End If

End Sub

Private Sub txtRepeat_Change()

If IsNumeric(txtRepeat) And Val(txtRepeat) >= 0 Then


Else
    
    txtRepeat.Text = ""

End If

End Sub


Private Sub txtsecond_Change()

If IsNumeric(txtsecond) And Val(txtsecond) >= 0 Then


Else
    
    txtsecond.Text = ""

End If

End Sub

'//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
Private Sub txtshortcut_KeyDown(KeyCode As Integer, Shift As Integer)
'//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
'============================================================

' Routine Name: txtshortcut_KeyDown
' Description: Template Description
' Author: Ahmed Saad
' Date: 07/08/06 11:51:29 �
' Copyright � 2006 - 2007,  Perfection Tools Software
' Notes:

' Modification History:

'============================================================
    Dim TempKey As String
    '//used to in support of update txtshortcut only if the shortcut changed
    Static OldKey As String
    Dim character As String
    
    '//Note that txtshortcut.Tag contains only the KeyCode of the Shortcut being Displayed in it
    '//Ctrl + S , then it contains the asc("S") only, if Ctrl + then it contains asc("Ctrl") only
     txtshortcut.Tag = KeyCode
    
    '//Enable cmdAssign only if the user press keys in txtshortcut
    cmdAssign.Enabled = True
   
    '//because "Home" key returns the cursor to the text start
    If KeyCode = vbKeyHome Then KeyCode = 0 '//if we didn't add this line the cursor will appear in the first pos in txtshortcut
    
    '//added next line to enable the user to choose "Alt + F4" as a shortcut key
    If KeyCode = vbKeyF4 And GetAsyncKeyState(18) Then KeyCode = 0  '//if we didn't add this line then the form will be unloaded if the user choose "Alt + F4" as a shortcut key

    '//for unknown reason, Alt+F6 causes a lost focus for this form, hence i assign keycode to 0
    '//added next line to enable the user to choose "Alt + F4" as a shortcut key
    If KeyCode = vbKeyF6 And GetAsyncKeyState(18) Then KeyCode = 0
    '//note that i tried to use [Me.SetFocus, txtshortcut.SetFocus, PutFocus and CVisWindows.SwitchTo] ...
    '//but i doesn't work hence i disabled the shortcut by calling keycode =0
    
    '//for "Up" and "Left" keys, if we didn't add the next line, then the pointer will go back to start of txtshortcut
    If GetAsyncKeyState(vbKeyLeft) Or GetAsyncKeyState(vbKeyUp) Then
       txtshortcut.SelStart = Len(txtshortcut)
       '//note that: we make a condition "GetAsyncKeyState(vbKeyLeft) Or GetAsyncKeyState(vbKeyUp)" ...
       '//if we didn't add this condition this well cause a r3shaaa in the txtshortcut
       '//to see the r3shaaa comment the if statement and leave it's body uncommented
    End If

    '//ignore Alt + Shift + Space
    If GetAsyncKeyState(18) And GetAsyncKeyState(vbKeyShift) And GetAsyncKeyState(vbKeySpace) Then
         txtshortcut = "": Exit Sub
    End If
    
    '//ignore Alt + Space
    If GetAsyncKeyState(18) And GetAsyncKeyState(vbKeySpace) Then
         txtshortcut = "": Exit Sub
    End If

    '//ignore  "alt+tab" because it invokes "alt+tab" menu
    If GetAsyncKeyState(18) And GetAsyncKeyState(vbKeyTab) And Not GetAsyncKeyState(vbKeyControl) And Not GetAsyncKeyState(vbKeyShift) Then
        txtshortcut = "": Exit Sub
    End If
            
    '//ignore "Shift+Esc" because it invokes windows start menu
    If GetAsyncKeyState(vbKeyEscape) And GetAsyncKeyState(vbKeyShift) Then
       txtshortcut = "": KeyCode = 0: Exit Sub
    End If
    
       
    '//ignore "Ctrl+Esc" because it invokes windows start menu
    If GetAsyncKeyState(vbKeyEscape) And GetAsyncKeyState(vbKeyControl) Then
       txtshortcut = "": KeyCode = 0: Exit Sub
    End If
    
    '//Ignore Windows Key, backspace, Enter, Capital lock key, Pause, SnapShot, Properties,
    '//12 means Num 5 key when the Num lock if off
    If GetAsyncKeyState(91) Or GetAsyncKeyState(vbKeyBack) _
    Or GetAsyncKeyState(13) Or GetAsyncKeyState(vbKeyCapital) _
    Or GetAsyncKeyState(VK_SNAPSHOT) Or GetAsyncKeyState(93) Or GetAsyncKeyState(12) Then
       txtshortcut = "": Exit Sub
    End If
     
    '//check if the key is like F1 and F2 an so on
    character = ResolveKeyCode
    
    '//if ResolveKeyCode returns none
    If character = "none" Then
        character = Chr(KeyCode) '//then it is a normal key
    End If
      
    '//Disable Right Control + Right Shift that make the txtshortcut right to left
    '//Right Control = 163, Right Shift 161
    If GetAsyncKeyState(161) And GetAsyncKeyState(163) Then
       KeyCode = 0
    End If
      
    '//we don't want to make the text box right to left, if the user hit the "right shift" and "control".
    '//hence if the user hit right shift and control,
     If GetAsyncKeyState(VK_RSHIFT) And GetAsyncKeyState(vbKeyControl) Then
        If KeyCode = VK_RSHIFT Then '//then we 'll check that he doesn't press any key yet "mean like this ctrl+shift+p masaln"
          KeyCode = 0 '//then assign keycode to 0 to disable turnning the text to right
          character = "" '//and make character = "" to display it like this "Ctrl + Shift +" without any char after "+"
       End If
    End If
     
    '//1.Ctrl Only "Done"
    '//2.Alt Only
    '//3.Ctrl + Shift + Alt
    '//4.Alt + Shift
    '//5.Ctrl + Shift
    '//6.Ctrl + Alt
    '//7.Shift only
    '//8.no shift or ctrl or alt
    
    '//case of Ctrl +
    If GetAsyncKeyState(vbKeyControl) And Not GetAsyncKeyState(vbKeyShift) And Not GetAsyncKeyState(18) Then
               
        '//what is the meaning of the following line below in the if statment
        '//IIf(KeyCode <> vbKeyControl, character, "")
        '//to avoid display the char representing Ctrl key, if the user press only ctrl key
        '//For Example Ctrl + 
        
        '//compare TempKey with the Static Oldkey in order to update txtshortcut only if the shortcut changed
        TempKey = "Ctrl + " & IIf(KeyCode <> vbKeyControl, character, "") '//Ctrl Only
        If TempKey = OldKey Then Exit Sub '//Only update txtshortcut if the shortcut changed
        txtshortcut = TempKey
        txtshortcut.SelStart = Len(txtshortcut) '//Set the Sel Start at the end of the text
           
    '//case of Alt +
    ElseIf GetAsyncKeyState(18) And Not GetAsyncKeyState(vbKeyShift) And Not GetAsyncKeyState(vbKeyControl) Then
       
        '//if the user hit Alt+Left, then we 'll delete the white space from the right
        If character = "Left " Then
          character = "Left"
          '//if we don't make this then the key will appear like this "Alt + Left " , and i don't know why
        End If
              
        '//if the user hit Alt+Left, then we 'll delete the white space from the right
        If character = "Up " Then
          character = "Up"
          '//if we don't make this then the key will appear like this "Alt + Up " , and i don't know why
        End If
                        
        '//compare TempKey with the Static Oldkey in order to update txtshortcut only if the shortcut changed
        TempKey = "Alt + " & IIf(KeyCode <> 18, character, "") '//Alt Only
        If TempKey = OldKey Then KeyCode = 0: Exit Sub  '//Only update txtshortcut if the shortcut changed
        txtshortcut = TempKey
        txtshortcut.SelStart = Len(txtshortcut) '//Set the Sel Start at the end of the text
    '//case of Ctrl + Alt + Shift
    ElseIf GetAsyncKeyState(vbKeyShift) And GetAsyncKeyState(vbKeyControl) And GetAsyncKeyState(18) Then
              
        '//compare TempKey with the Static Oldkey in order to update txtshortcut only if the shortcut changed
        TempKey = "Ctrl + Alt + Shift + " & IIf(KeyCode <> 18 And KeyCode <> vbKeyControl And KeyCode <> vbKeyShift, character, "")  '//Ctrl + Shift + Alt only
        If TempKey = OldKey Then Exit Sub '//Only update txtshortcut if the shortcut changed
        txtshortcut = TempKey
        txtshortcut.SelStart = Len(txtshortcut) '//Set the Sel Start at the end of the text
           
    '//case of Alt + Shift +
    ElseIf GetAsyncKeyState(vbKeyShift) And GetAsyncKeyState(18) And Not GetAsyncKeyState(vbKeyControl) Then
              
        '//compare TempKey with the Static Oldkey in order to update txtshortcut only if the shortcut changed
        TempKey = "Alt + Shift + " & IIf(KeyCode <> 18 And KeyCode <> vbKeyShift, character, "") '//Alt + Shift
        If TempKey = OldKey Then Exit Sub '//Only update txtshortcut if the shortcut changed
        txtshortcut = TempKey
        txtshortcut.SelStart = Len(txtshortcut) '//Set the Sel Start at the end of the text
           
    '//case of Ctrl + Shift +
    ElseIf GetAsyncKeyState(vbKeyShift) And GetAsyncKeyState(vbKeyControl) And Not GetAsyncKeyState(18) Then
        '//compare TempKey with the Static Oldkey in order to update txtshortcut only if the shortcut changed
        TempKey = "Ctrl + Shift + " & IIf(KeyCode <> vbKeyShift And KeyCode <> vbKeyControl, character, "") '//Ctrl + Shift
        If TempKey = OldKey Then Exit Sub '//Only update txtshortcut if the shortcut changed
        txtshortcut = TempKey
        txtshortcut.SelStart = Len(txtshortcut) '//Set the Sel Start at the end of the text
           
    '//case of Ctrl + Alt +
    ElseIf GetAsyncKeyState(vbKeyControl) And GetAsyncKeyState(18) And Not GetAsyncKeyState(vbKeyShift) Then
        '//compare TempKey with the Static Oldkey in order to update txtshortcut only if the shortcut changed
        TempKey = "Ctrl + Alt + " & IIf(KeyCode <> 18 And KeyCode <> vbKeyControl, character, "") '//Ctrl + Alt
        If TempKey = OldKey Then Exit Sub '//Only update txtshortcut if the shortcut changed
        txtshortcut = TempKey
        txtshortcut.SelStart = Len(txtshortcut) '//Set the Sel Start at the end of the text
           
    '//case of Shift +
    ElseIf GetAsyncKeyState(vbKeyShift) And Not GetAsyncKeyState(vbKeyControl) And Not GetAsyncKeyState(18) Then
              
        '//Shift + Insert causes to paste the clipboard content in the current focused textbox
        '//hence we 'll clear the clipboard
        If character = "Insert" Then Clipboard.Clear
        
        '//Shift + Delete causes to delete char char, in other words it works like backspace key
        If character = "Delete" Then KeyCode = 0 '//hence we disable this key compainions
        
        '//compare TempKey with the Static Oldkey in order to update txtshortcut only if the shortcut changed
        TempKey = "Shift + " & IIf(KeyCode <> vbKeyShift, character, "") '//Shift Only
        If TempKey = OldKey Then Exit Sub '//Only update txtshortcut if the shortcut changed
        txtshortcut = TempKey
        txtshortcut.SelStart = Len(txtshortcut) '//Set the Sel Start at the end of the text
           
    '//case of no Ctrl or Shift or Alt
    ElseIf Not GetAsyncKeyState(vbKeyControl) And Not GetAsyncKeyState(18) And Not GetAsyncKeyState(vbKeyShift) Then
        
        '//compare TempKey with the Static Oldkey in order to update txtshortcut only if the shortcut changed
        TempKey = character
        If TempKey = OldKey Then
        '  txtshortcut.SelStart = Len(txtshortcut) + 2
          Exit Sub '//Only update txtshortcut if the shortcut changed
        End If
        txtshortcut = TempKey
        txtshortcut.SelStart = Len(txtshortcut) '//Set the Sel Start at the end of the text
           
    End If
    
    '//We added 'OldKey = TempKey' to update txtshortcut only if the shortcut changed
    '//however why we add the if statment itself??
    '//well, if we didn't add the if statment then if the user press ctrl key "for example",
    '//the key won't appear in txtshortcut in the further hits
    'If txtshortcut.Tag <> vbKeyShift And txtshortcut.Tag <> vbKeyControl And txtshortcut.Tag <> 18 Then
        '//used to in support of update txtshortcut only if the shortcut changed
        '//pt 5July2007: commented next line because:
        '//if you assing a single key like "A" to any shortcut then
        '//if you try to press "A" key again in txtshortcut then it doesn't appears
        '//OldKey = TempKey
    'End If
   
End Sub

'//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
Private Sub txtshortcut_KeyPress(KeyAscii As Integer)
'//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
       '//to stop sending char to txtshortcut
       '//we want to display only the keys been hit to txtshortcut
       '//in other words: if the user hit ctrl+I , we want to display only ctrl+I and so on
       '//hence we make KeyAscii = 0, to display only the keys process intxtshortcut_KeyDown
       '//and i don't why KeyAscii = 0 achiveing this goal
       KeyAscii = 0
End Sub

'//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
Private Sub txtshortcut_KeyUp(KeyCode As Integer, Shift As Integer)
'//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
   
    '//Note that txtshortcut.Tag contains only the KeyCode of the Shortcut being Displayed in it
    '//Ctrl + S , then it contains the asc("S") only, if Ctrl + then it contains asc("Ctrl") only
   If txtshortcut.Tag = vbKeyShift Or txtshortcut.Tag = vbKeyControl Or txtshortcut.Tag = 18 Then
        txtshortcut = ""
    End If
    
End Sub

'//commented next line because it causes a delay in opening this form
'//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
Private Sub SubtxtShortCut_MessageReceived(hWnd As Long, Msg As Long, wParam As Long, lParam As Long, cancel As Boolean)
'//* * *  * * * * * * * * * * * * * * * * *  * * * * * * * * * * * * * * * * *
            
'    Const WM_CONTEXTMENU = 123
'
'    If Msg = WM_CONTEXTMENU Then 'If the user right click Text1 then
'         Cancel = True 'Cancel any further processing to disable the context menu
'    End If

End Sub

'//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
Public Function ResolveKeyCode() As String
'//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
   
    'Note: in order for txtshortcut to receive "Tab" key, i assign "TabStop" property to false in the controls
   
    '//Resolve these key , for example if the key is F1 then i 'll write "F1" and so on
    If GetAsyncKeyState(vbKeyF1) Then
        ResolveKeyCode = "F1"
    ElseIf GetAsyncKeyState(vbKeyF2) Then
        ResolveKeyCode = "F2"
    ElseIf GetAsyncKeyState(vbKeyF3) Then
        ResolveKeyCode = "F3"
    ElseIf GetAsyncKeyState(vbKeyF4) Then
        ResolveKeyCode = "F4"
    ElseIf GetAsyncKeyState(vbKeyF5) Then
        ResolveKeyCode = "F5"
    ElseIf GetAsyncKeyState(vbKeyF6) Then
        ResolveKeyCode = "F6"
    ElseIf GetAsyncKeyState(vbKeyF7) Then
        ResolveKeyCode = "F7"
    ElseIf GetAsyncKeyState(vbKeyF8) Then
        ResolveKeyCode = "F8"
    ElseIf GetAsyncKeyState(vbKeyF9) Then
        ResolveKeyCode = "F9"
    ElseIf GetAsyncKeyState(vbKeyF10) Then
        ResolveKeyCode = "F10"
    ElseIf GetAsyncKeyState(vbKeyF11) Then
        ResolveKeyCode = "F11"
    ElseIf GetAsyncKeyState(vbKeyF12) Then
        ResolveKeyCode = "F12"
    ElseIf GetAsyncKeyState(vbKeyInsert) Then
        ResolveKeyCode = "Insert"
    ElseIf GetAsyncKeyState(vbKeyPause) Then
        ResolveKeyCode = "Pause"
    ElseIf GetAsyncKeyState(vbKeyDelete) Then
        ResolveKeyCode = "Delete"
    ElseIf GetAsyncKeyState(192) Then ' ` key
        ResolveKeyCode = "`"
    ElseIf GetAsyncKeyState(189) Then
        ResolveKeyCode = "-"
    ElseIf GetAsyncKeyState(187) Then
        ResolveKeyCode = "="
    ElseIf GetAsyncKeyState(vbKeyHome) Then
        ResolveKeyCode = "Home"
    ElseIf GetAsyncKeyState(vbKeyPageDown) Then
        ResolveKeyCode = "Page Down"
    ElseIf GetAsyncKeyState(vbKeyPageUp) Then
        ResolveKeyCode = "Page Up"
    ElseIf GetAsyncKeyState(219) Then
        ResolveKeyCode = "["
    ElseIf GetAsyncKeyState(221) Then
        ResolveKeyCode = "]"
    ElseIf GetAsyncKeyState(220) Then
        ResolveKeyCode = "\"
    ElseIf GetAsyncKeyState(186) Then
        ResolveKeyCode = ";"
    ElseIf GetAsyncKeyState(222) Then
        ResolveKeyCode = "'"
    ElseIf GetAsyncKeyState(vbKeyEnd) Then
        ResolveKeyCode = "End"
    ElseIf GetAsyncKeyState(226) Then
        ResolveKeyCode = "\"
    ElseIf GetAsyncKeyState(188) Then
        ResolveKeyCode = ","
    ElseIf GetAsyncKeyState(190) Then
        ResolveKeyCode = "."
    ElseIf GetAsyncKeyState(191) Then
        ResolveKeyCode = "/"
    ElseIf GetAsyncKeyState(vbKeyUp) Then
        ResolveKeyCode = "Up " '//if we didn't add a space after Up, then the pointer will appear before "p"
    ElseIf GetAsyncKeyState(vbKeyDown) Then
        ResolveKeyCode = "Down"
    ElseIf GetAsyncKeyState(vbKeyRight) Then
        ResolveKeyCode = "Right"
    ElseIf GetAsyncKeyState(vbKeyLeft) Then
        ResolveKeyCode = "Left " '//if we didn't add a space after Left, then the pointer will appear before "t"
    ElseIf GetAsyncKeyState(vbKeyTab) Then
        ResolveKeyCode = "Tab"
    ElseIf GetAsyncKeyState(vbKeySpace) Then
        ResolveKeyCode = "Space"
    ElseIf GetAsyncKeyState(vbKeyNumlock) Then
        ResolveKeyCode = "Num lock"
    ElseIf GetAsyncKeyState(vbKeyNumpad0) Then
        ResolveKeyCode = "Num 0"
    ElseIf GetAsyncKeyState(vbKeyNumpad1) Then
        ResolveKeyCode = "Num 1"
    ElseIf GetAsyncKeyState(vbKeyNumpad2) Then
        ResolveKeyCode = "Num 2"
    ElseIf GetAsyncKeyState(vbKeyNumpad3) Then
        ResolveKeyCode = "Num 3"
    ElseIf GetAsyncKeyState(vbKeyNumpad4) Then
        ResolveKeyCode = "Num 4"
    ElseIf GetAsyncKeyState(vbKeyNumpad5) Then
        ResolveKeyCode = "Num 5"
    ElseIf GetAsyncKeyState(vbKeyNumpad6) Then
        ResolveKeyCode = "Num 6"
    ElseIf GetAsyncKeyState(vbKeyNumpad7) Then
        ResolveKeyCode = "Num 7"
    ElseIf GetAsyncKeyState(vbKeyNumpad8) Then
        ResolveKeyCode = "Num 8"
    ElseIf GetAsyncKeyState(vbKeyNumpad9) Then
        ResolveKeyCode = "Num 9"
    ElseIf GetAsyncKeyState(vbKeyNumpad9) Then
        ResolveKeyCode = "Num 9"
    ElseIf GetAsyncKeyState(107) Then '//"Num +" Key
        ResolveKeyCode = "Num +"
    ElseIf GetAsyncKeyState(109) Then '//"Num -" Key
        ResolveKeyCode = "Num -"
    ElseIf GetAsyncKeyState(106) Then '//"Num *" Key
        ResolveKeyCode = "Num *"
    ElseIf GetAsyncKeyState(111) Then '//"Num /" Key
        ResolveKeyCode = "Num /"
    ElseIf GetAsyncKeyState(110) Then '//"Num ." Key
        ResolveKeyCode = "."
    Else '//if a normal key then return none
        ResolveKeyCode = "none"
    End If
  
End Function

'//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
Private Sub cmdCancel_Click()
'//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
    
    Unload Me

End Sub
