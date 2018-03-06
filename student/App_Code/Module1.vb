Imports System.data
Imports System.data.sqlclient
Imports System.Web.Security


Namespace student

Public Module Module1
        Dim myConnection As New SqlConnection
        Function zuser(ByVal usr As String, ByVal pwd As String) As Boolean
            myConnection.ConnectionString = ConfigurationManager.AppSettings("ConnectionString")
            Dim sql As String
            If myConnection.State = ConnectionState.Closed Then myConnection.Open()
            sql = "select * from U25 where U25AA='" & usr & "' and U25BB='" & pwd & "'"
            Dim cmd = New SqlCommand(sql, myConnection)
            Dim dr As SqlDataReader
            dr = cmd.ExecuteReader()
            If dr.Read() Then
                zuser = True
            Else
                zuser = False
            End If
            dr.Close()
            myConnection.Close()
        End Function
End Module

End Namespace
