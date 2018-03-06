Imports System.data
Imports System.data.sqlclient
Imports System.Web.Security
'Imports student.Module1

Partial Class song
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
            If Session("master") = "D" Then
                HyperLink2.Visible = True
            Else
                HyperLink2.Visible = False
            End If

            Dim sql As String
            If myConnection.State = ConnectionState.Closed Then myConnection.Open()
            If Session("master") = "D" Then
                sql = "select U0361EE from U0361 " & _
                  " where getdate() between U0361BB and dateadd(day,convert(int,U0361DD),U0361BB) and U0361HH='" & Left(Session("u1000"), 1) & "'" & _
                  " and U0361EE in (1,2)"
            Else
                sql = "select U0361EE from U0361 " & _
                  " where getdate() between U0361BB and dateadd(day,convert(int,U0361DD),U0361BB) and U0361HH='" & Left(Session("u1000"), 1) & "'" & _
                  " and U0361EE in (3,4)"
            End If
            Dim cmd = New SqlCommand(sql, myConnection)
            Dim dr As SqlDataReader
            dr = cmd.ExecuteReader()
            If dr.Read() Then
                '--------for geology-------
                'If Left(Session("u1000"), 8) = "C.GM06D1" Or Left(Session("u1000"), 8) = "C.ME06D1" Or Left(Session("u1000"), 8) = "C.ME06D2" Or Left(Session("u1000"), 8) = "C.DE06D6" Or Session("u1000") = "C.GM05D126" Or Session("u1000") = "C.ME02D128" Or Session("u1000") = "C.DE05D612" Or Session("u1000") = "C.ME05D118" Or Session("u1000") = "C.GM05D162" Or Session("u1000") = "C.GM04D170" Or Session("u1000") = "C.GM05D104" Or Session("u1000") = "C.GM05D128" Or Session("u1000") = "C.ME02D139" Or Session("u1000") = "C.ME05D212" Then
                'HyperLink1.Visible = True
                'End If
                HyperLink1.Visible = True
                Select Case dr(0)
                    Case 1, 3
                        Session("songolt") = 1
                        HyperLink1.Text = "Сонголт 1"
                    Case Else
                        Session("songolt") = 2
                        HyperLink1.Text = "Сонголт 2"
                End Select
        End If

        If Session("master") = "D" Then
            HyperLink1.NavigateUrl = "songolt1.aspx"
        Else
            HyperLink1.NavigateUrl = "songoltMaster.aspx"
        End If
        myConnection.Close()
        End If
    End Sub
End Class
