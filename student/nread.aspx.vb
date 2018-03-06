Imports System.data
Imports System.data.sqlclient
Imports System.Web.Security
'Imports student.Module1

Partial Class nread
    Inherits System.Web.UI.Page
    Dim myConnection As New SqlConnection

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        myConnection.ConnectionString = ConfigurationManager.AppSettings("ConnectionString")
        If Not zuser(Session("u1000"), Session("psss")) Then
            Response.Redirect("login.aspx")
        Else
            If Not Page.IsPostBack Then
                Dim sql As String = ""
                If myConnection.State = ConnectionState.Closed Then myConnection.Open()
                sql = "SELECT news.* "
                sql = sql & " FROM news "
                sql = sql & " where news.id=" & Request("id")
                Dim cmd As New SqlCommand(sql, myConnection)
                Dim dr As SqlDataReader
                dr = cmd.ExecuteReader()
                If dr.Read() Then
                    subject.Text = dr("subject")
                    descrebtion.Text = dr("descreb1")

                    'henees.Text = "Ìýäýýã áè÷ñýí : " & dr("userid")
                    ognoo.Text = "Îãíîî : " & dr("ognoo")
                End If
                dr.Close()
                myConnection.Close()
            End If
        End If
    End Sub

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
End Class
