Imports System.data
Imports System.data.sqlclient
Imports System.Web.Security
'Imports student.Module1

Partial Class nuutsug
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
        Else
            If Not Page.IsPostBack Then

            End If
        End If
    End Sub

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton1.Click
        Panel3.Visible = False
        Panel4.Visible = True
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        Panel3.Visible = True
        Panel4.Visible = False
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        If myConnection.State = ConnectionState.Closed Then myConnection.Open()
        Dim sql As String
        sql = "select * from U25 where U25AA='" & Session("U1000") & "' and U25BB=isnull(@nuutsug,'') "
        Dim cmd = New SqlCommand(sql, myConnection)
        cmd.Parameters.Add(New SqlParameter("@nuutsug", SqlDbType.VarChar, 50))
        cmd.Parameters("@nuutsug").Value = IIf(Replace(TextBox1.Text, "'", "''") = "", "", Replace(TextBox1.Text, "'", "''"))
        'Dim dr As SqlDataReader
        Dim dr = cmd.ExecuteReader()
        If Not dr.Read() Then
            Label1.Text = "Хуучин нууц vг буруу байна !"
            Exit Sub
        End If
        dr.Close()
        If Replace(TextBox2.Text, "'", "''") <> Replace(TextBox3.Text, "'", "''") Then
            Label1.Text = "Шинэ нууц vг давтан зев оруулна уу ! "
            Exit Sub
        End If
        sql = "update U25 set U25BB=@nuutsug where U25AA='" & Session("u1000") & "' "
        cmd = New SqlCommand(sql, myConnection)
        cmd.Parameters.Add(New SqlParameter("@nuutsug", SqlDbType.VarChar, 30))
        cmd.Parameters("@nuutsug").Value = IIf(Replace(TextBox2.Text, "'", "''") = "", "", Replace(TextBox2.Text, "'", "''"))
        cmd.ExecuteNonQuery()
        myConnection.Close()
        Panel3.Visible = True
        Panel4.Visible = False
        Label1.Text = "Амжилттай солигдлооо !"
    End Sub
End Class
