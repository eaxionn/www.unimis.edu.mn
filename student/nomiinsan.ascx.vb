Imports System.data
Imports System.data.sqlclient
Imports System.Web.Security
'Imports student.Module1

Partial Class nomiinsan
    Inherits System.Web.UI.UserControl
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

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        myConnection.ConnectionString = ConfigurationManager.AppSettings("ConnectionString")
        If Not zuser(Session("u1000"), Session("psss")) Then
            Response.Redirect("login.aspx")
        End If
    End Sub

    Sub Datagrid()
        Dim sql As String = "exec sp_ReaderService '" & Session("tcode") & "',0"
        If myConnection.State = ConnectionState.Closed Then myConnection.Open()
        Dim cmd As SqlDataAdapter
        cmd = New SqlDataAdapter(sql, myConnection)
        Dim rs As DataSet = New DataSet
        cmd.Fill(rs)
        DataGrid1.DataSource = rs
        DataGrid1.DataBind()
        myConnection.Close()
    End Sub
End Class
