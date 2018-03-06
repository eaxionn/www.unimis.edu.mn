Imports System.data
Imports System.data.sqlclient
Imports System.Web.Security
'Imports student.Module1

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
    'Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Unload
    'MsgBox("haha")
    '    Session.Clear()
    'End Sub
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        'If Right(Left(TextBox1.Text, 6), 2) = "09" Then
        Session.Clear()
        Session.RemoveAll()
        Call users()
        'Else
        'Label1.Text = "1-р курсын оюутнуудын хичээл сонголт явагдаж байна."
        'End If
    End Sub

    Private Sub users()
        Try
            TextBox1.Text = Replace(Replace(TextBox1.Text, "'", ""), "-", "")
            TextBox2.Text = Replace(Replace(TextBox2.Text, "'", ""), "-", "")

            Dim sql As String
            If myConnection.State = ConnectionState.Closed Then myConnection.Open()
            sql = "declare @on varchar(9),@uliral int,@ul int select @on=q1,@uliral=q2,@ul=q4 from main " & _
            "select * ,@on as onn,@uliral as ul,@ul as uu from U25 where U25AA='" & Trim(TextBox1.Text) & "' and U25BB='" & Trim(TextBox2.Text) & "'"
            Dim cmd = New SqlCommand(sql, myConnection)
            Dim dr As SqlDataReader
            dr = cmd.ExecuteReader()
            If dr.Read() Then
                Session("u1000") = TextBox1.Text
                Session("psss") = TextBox2.Text
                Session("on") = dr("onn")
                Session("ul") = dr("ul")
                Session("q4") = dr("uu")
                dr.Close()

                Session("master") = Right(Left(TextBox1.Text, 7), 1)
                'Dim k As String = Session("master")
                '---------songolt utga onooh---------
                'sql = "select U0361EE from U0361 " & _
                '      " where getdate() between U0361BB and dateadd(day,convert(int,U0361DD),U0361BB) and U0361HH='" & Left(Session("u1000"), 1) & "'"
                'cmd = New SqlCommand(sql, myConnection)
                'dr = cmd.ExecuteReader()
                'If dr.Read() Then
                'Select Case dr(0)
                '    Case 1, 3
                'Session("songolt") = 1
                '    Case Else
                'Session("songolt") = 2
                'End Select
                'End If
                dr.Close()
                myConnection.Close()
                Response.Redirect("st_dun.aspx")
            Else
                Label1.Text = "Нууц vг буруу байна!"
            End If
            dr.Close()
        Catch ex As Exception
            '
        Finally
            myConnection.Close()
        End Try
    End Sub
End Class



