Imports System.data
Imports System.data.sqlclient
Imports System.Web.Security
'Imports student.Module1

Partial Class tolbor
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
            Dim sql As String
            If myConnection.State = ConnectionState.Closed Then myConnection.Open()

            Try
                sql = "declare @on char(9),@uli char(1) " & _
                "select @on=q1,@uli=q2 from main " & _
                "select AH2,AH3,AH5,AH8,AH12,AH14,AH15,AH16,AH17,AH18 from _AA8 where AH4='" & Session("u1000") & "' and AH3=@uli and AH2=@on"

                Dim cmd = New SqlCommand(sql, myConnection)
                Dim dr As SqlDataReader
                dr = cmd.ExecuteReader()
                If dr.Read() Then
                    ' huraangui
                    Label9.Text = Format(dr("AH8"), "###0.00")
                    Label10.Text = Format(dr("AH15"), "###0.00")
                    Label11.Text = Format(dr("AH17"), "###0.00")
                    Label20.Text = Format(dr("AH18"), "###0.00")
                    ' delgerengui

                    'Label1.Text = Format(dr(6), "###0.00")
                    'Label2.Text = Format(dr(7), "###0.00")
                    'Label3.Text = Format(dr(8), "###0.00")
                    'Label4.Text = Format(dr(9), "###0.00")
                    'Label5.Text = Format(dr(10), "###0.00")
                    'Label6.Text = Format(dr(11), "###0.00")
                    'Label7.Text = Format(dr(12), "###0.00")
                    'Label8.Text = Format(dr(13), "###0.00")
                End If
                dr.Close()
            Catch ex As Exception

            End Try
            myConnection.Close()
        End If
    End Sub

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton1.Click
        Panel1.Visible = False
        Panel2.Visible = True
    End Sub

    Protected Sub LinkButton2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton2.Click
        Panel1.Visible = True
        Panel2.Visible = False
    End Sub
End Class
