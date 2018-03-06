Imports System.data
Imports System.data.sqlclient
Imports System.Web.Security
Imports student.Module1

Partial Class _Default
    Inherits System.Web.UI.Page

    Dim myConnection As New SqlConnection

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        myConnection.ConnectionString = ConfigurationManager.AppSettings("ConnectionString")
        If Not Request("scode") = "" Then
            TextBox1.Text = Request("scode")
            TextBox2.Text = Request("spass")
        End If
    End Sub
    
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Session.Clear()
        Session.RemoveAll()
        Call users()
    End Sub

    Private Sub users()
        TextBox1.Text = Replace(Replace(TextBox1.Text, "'", ""), "-", "")
        TextBox2.Text = Replace(Replace(TextBox2.Text, "'", ""), "-", "")

        Dim sql As String
        If myConnection.State = ConnectionState.Closed Then myConnection.Open()
        sql = "declare @on varchar(9),@uliral int select @on=q1,@uliral=q2 from main " & _
        "select * ,@on as onn,@uliral as ul from USER_L where Ucode='" & Trim(TextBox1.Text) & "' and Upswd='" & Trim(TextBox2.Text) & "' "
        Dim cmd As New SqlCommand(sql, myConnection)
        Dim dr As SqlDataReader
        dr = cmd.ExecuteReader()
        If dr.Read() Then
            Session("on") = dr("onn")
            Session("ul") = dr("ul")
            Session("user") = dr("Udesc")
            Session("songolt") = 2
            Session("Udom") = dr("Udom")
            dr.Close()
            myConnection.Close()

            Response.Redirect("songolt1.aspx")
        Else
            Label1.Text = "Нууц vг буруу байна!"
        End If
        dr.Close()
        myConnection.Close()
    End Sub
End Class



