﻿'/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\
'                                                   GlobalEntry Class                                                    
'\*/\*/\*/\*/\*/\*/\*/\*/\*/\*/\*/\*/\*/\*/\*/\*/\*/\*/\*/\*/\*/\*/\*/\*/\*/\*/\*/\*/\*/\*/\*/\*/\*/\*/\*/\*/\*/\*/\*/\*/\*/\*/
Public Class GlobalEntry
    Inherits CacadoreBase
    Implements IGlobalEntry
    Implements ICrudable
    Implements IDisposable

#Region "Fields"
    Private _nameValue As String
    Private _valueValue As String
    Private _typeValue As IGlobals.GlobalType
#End Region

#Region "Properties"
    Public Property Name As String Implements IGlobalEntry.Name
        Get
            Return _nameValue
        End Get
        Set(value As String)
            _nameValue = value
        End Set
    End Property

    Public Property type As IGlobals.GlobalType Implements IGlobalEntry.type
        Get
            Return _typeValue
        End Get
        Set(value As IGlobals.GlobalType)
            _typeValue = value
        End Set
    End Property

    Public Property Value As String Implements IGlobalEntry.Value
        Get
            Return _valueValue
        End Get
        Set(value As String)
            _valueValue = value
        End Set
    End Property
#End Region

#Region "IDisposable Support"
    Private disposedValue As Boolean ' To detect redundant calls

    ' IDisposable
    Protected Overridable Sub Dispose(disposing As Boolean)
        If Not Me.disposedValue Then
            If disposing Then
                ' TODO: dispose managed state (managed objects).
            End If

            ' TODO: free unmanaged resources (unmanaged objects) and override Finalize() below.
            ' TODO: set large fields to null.
        End If
        Me.disposedValue = True
    End Sub

    ' TODO: override Finalize() only if Dispose(ByVal disposing As Boolean) above has code to free unmanaged resources.
    'Protected Overrides Sub Finalize()
    '    ' Do not change this code.  Put cleanup code in Dispose(ByVal disposing As Boolean) above.
    '    Dispose(False)
    '    MyBase.Finalize()
    'End Sub

    ' This code added by Visual Basic to correctly implement the disposable pattern.
    Public Sub Dispose() Implements IDisposable.Dispose
        ' Do not change this code.  Put cleanup code in Dispose(ByVal disposing As Boolean) above.
        Dispose(True)
        GC.SuppressFinalize(Me)
    End Sub
#End Region

End Class