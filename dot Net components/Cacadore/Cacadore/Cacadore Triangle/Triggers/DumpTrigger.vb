﻿Namespace Triggers
    <Serializable()> Public Class DumpTrigger
        Inherits Trigger


#Region "Fields"
        Private _task As Task
        'Reference to the actual object responsible for handling the triggers work.
        Private _innerTrigger As Object
#End Region

#Region "Properties"

        Public Overrides Property Task As Task
            Get
                Return _task
            End Get
            Set(value As Task)
                _task = value
            End Set
        End Property

        Public Overrides ReadOnly Property MayFireAgain As Boolean
            Get
                Return Nothing
            End Get
        End Property

        Public Overrides ReadOnly Property TriggerType As ITrigger.TriggerTypeEnum
            Get
                Return ITrigger.TriggerTypeEnum.DumpTrigger
            End Get
        End Property

        'AhSaElDin 20111228: Make it writable property.
        Private _descriptionValue As String = ITrigger.TriggersDescriptions.DumpTrigger
        Public Overrides Property Description As String
            Get
                Return _descriptionValue
            End Get
            Set(value As String)
                _descriptionValue = value
            End Set
        End Property

        'Reference to the actual object responsible for handling the triggers work.
        Public Overrides Property InnerTrigger As Object
            Get
                Return _innerTrigger
            End Get
            Set(value As Object)
                _innerTrigger = value
            End Set
        End Property

        Public Overrides ReadOnly Property NextFireTimeUTC As Nullable(Of DateTime)
            Get
                Return Nothing
            End Get
        End Property

        Public Overrides ReadOnly Property PreviousFireTimeUTC As Nullable(Of DateTime)
            Get
                Return Nothing
            End Get
        End Property

        Public Overrides ReadOnly Property EndTimeUTC As Date?
            Get
                Return Nothing
            End Get
        End Property

        Public Overrides ReadOnly Property StartTimeUTC As Date?
            Get
                Return Nothing
            End Get
        End Property

        Public Overrides Property Calendar As Object
            Get
                Return Nothing
            End Get
            Set(value As Object)

            End Set
        End Property

#End Region

#Region "Methods"

        Public Overrides Function StartListening() As Object
            Return Nothing
        End Function

        Public Overrides Function StopListening() As Boolean
            Return Nothing
        End Function

#End Region


    End Class
End Namespace
