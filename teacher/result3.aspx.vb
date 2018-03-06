Imports System.data
Imports System.data.sqlclient

Partial Class result3
    Inherits System.Web.UI.Page
    Public cnt, cnt1 As Integer
    Public total As Double
    Public mstrSortCol, mstrSortColold As String
    Dim myConnection As New SqlConnection
    Dim b1, b2, b3, b4, b5, b6 As Integer
    Dim s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13 As Integer
    Dim table As DataTable

    Function zuser(ByVal usr As String, ByVal pwd As String) As Boolean
        Dim sql As String
        myConnection.Close()
        If myConnection.State = ConnectionState.Closed Then myConnection.Open()
        sql = "select U31AA from U31 where U31AA='" & usr & "' and U31BB='" & pwd & "'"
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

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Response.Expires = -1
        myConnection.ConnectionString = ConfigurationManager.AppSettings("ConnectionString")
        If Not zuser(Session("tcode"), Session("tpsss")) Then
            Response.Redirect("login.aspx")
        Else
            If Not Page.IsPostBack Then
                cnt = 1
                mstrSortCol = ""
                mstrSortColold = ""
                Call Oyutniijagsaalt()
                bkod.Text = "Багшийн код: " & Session("tcode")
                bner.Text = "Багшийн нэр: " & Session("teachName")
                hkod.Text = "Хичээлийн код: " & Request("lesscode")
                Call lessNameF()
                hjilFind()
                FindCnt()
                setLabels()
                If Request("al") = "1" Then
                    surtoo.Visible = True
                Else
                    surtoo.Visible = False
                End If
            End If
        End If
    End Sub
    Sub setLabels()
        surtoo.Text = "A: " + s1.ToString + " &nbsp; &nbsp; " + " B: " + s2.ToString + " &nbsp; &nbsp; " & _
                "C: " + s3.ToString + " &nbsp; &nbsp; " + " D: " + s4.ToString + " &nbsp; &nbsp; " & _
                "E: " + s5.ToString + " &nbsp; &nbsp; " + " F: " + s6.ToString + " &nbsp; &nbsp; " & _
                "G: " + s7.ToString + " &nbsp; &nbsp; " + " H: " + s8.ToString + " &nbsp; &nbsp; " & _
                "I: " + s9.ToString + " &nbsp; &nbsp; " + " J: " + s10.ToString + " &nbsp; &nbsp; " & _
                "K: " + s11.ToString + " &nbsp; &nbsp; " + " L: " + s12.ToString + " &nbsp; &nbsp; " & _
                "M: " + s13.ToString + "<br/><br/>"
        Label10.Text = "<br />Дvгнэвэл зохих: " + table.Rows.Count.ToString + "<br/>Дvгнэсэн: " + table.Rows.Count.ToString & _
        "&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Vvнээс: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; " & _
        "1-30 оноо &nbsp; &nbsp; <u>&nbsp;" + b1.ToString + " </u> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 51-60 оноо &nbsp; &nbsp; <u>&nbsp;" + b4.ToString & _
        "&nbsp;</u><br/>" & _
        " &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;" & _
        " &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;" & _
        "31-40 оноо &nbsp; &nbsp; <u>&nbsp;" + b2.ToString + " </u> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 61-70 оноо &nbsp; &nbsp; <u>&nbsp;" + b5.ToString & _
        "&nbsp;</u><br/>" & _
        " &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;" & _
        " &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;" & _
        "41-50 оноо &nbsp; &nbsp; <u>&nbsp;" + b3.ToString + " </u> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; W тэмдэглэгээ &nbsp; &nbsp; <u>&nbsp;" + b6.ToString & _
        "&nbsp;</u><br/><br/><br/>"
        ognoo.Text = "Хэвлэсэн огноо: " & Format(Now.Date(), "yyyy/MM/dd")
    End Sub
    Sub lessNameF()
        Dim sql As String
        myConnection.Close()
        If myConnection.State = ConnectionState.Closed Then myConnection.Open()
        sql = "select U035DD from U035 where U035CC='" & Request("lesscode") & "' "
        Dim cmd = New SqlCommand(sql, myConnection)
        Dim dr As SqlDataReader
        dr = cmd.ExecuteReader()
        If dr.Read() Then
            hner.Text = "Хичээлийн нэр: " & IIf(Not IsDBNull(dr(0)), dr(0), "")
        End If
        dr.Close()
        myConnection.Close()
    End Sub
    Sub FindCnt()
        b1 = 0
        b2 = 0
        b3 = 0
        b4 = 0
        b5 = 0
        b6 = 0

        s1 = 0
        s2 = 0
        s3 = 0
        s4 = 0
        s5 = 0
        s6 = 0
        s7 = 0
        s8 = 0
        s9 = 0
        s10 = 0
        s11 = 0
        s12 = 0
        s13 = 0

        Dim i As Integer

        Dim Row As DataRow = Nothing
        For i = 0 To table.Rows.Count - 1
            Row = table.Rows.Item(i)
            Dim a1 As String = Row("onoo")
            If a1 = "W" Then
                b6 += 1
            Else
                If val(a1) < 31 And val(a1) >= 0 Then
                    b1 += 1
                ElseIf val(a1) < 41 And val(a1) > 30 Then
                    b2 += 1
                ElseIf val(a1) < 51 And val(a1) > 40 Then
                    b3 += 1
                ElseIf val(a1) < 61 And val(a1) > 50 Then
                    b4 += 1
                ElseIf val(a1) < 71 And val(a1) > 60 Then
                    b5 += 1
                End If
            End If

            Dim a2 As String = IIf(Not IsDBNull(Row("kod")), Row("kod"), "A")
            If Left(a2, 1) = "A" Then
                s1 += 1
            ElseIf Left(a2, 1) = "B" Then
                s2 += 1
            ElseIf Left(a2, 1) = "C" Then
                s3 += 1
            ElseIf Left(a2, 1) = "D" Then
                s4 += 1
            ElseIf Left(a2, 1) = "E" Then
                s5 += 1
            ElseIf Left(a2, 1) = "F" Then
                s6 += 1
            ElseIf Left(a2, 1) = "G" Then
                s7 += 1
            ElseIf Left(a2, 1) = "H" Then
                s8 += 1
            ElseIf Left(a2, 1) = "I" Then
                s9 += 1
            ElseIf Left(a2, 1) = "J" Then
                s10 += 1
            ElseIf Left(a2, 1) = "K" Then
                s11 += 1
            ElseIf Left(a2, 1) = "L" Then
                s12 += 1
            ElseIf Left(a2, 1) = "M" Then
                s13 += 1
            End If
        Next
    End Sub
    Sub hjilFind()
        Dim sql As String
        myConnection.Close()
        If myConnection.State = ConnectionState.Closed Then myConnection.Open()
        sql = "select * from main"
        Dim cmd = New SqlCommand(sql, myConnection)
        Dim dr As SqlDataReader
        dr = cmd.ExecuteReader()
        If dr.Read() Then
            hjil.Text = IIf(Not IsDBNull(dr("q1")), dr("q1"), "") + " оны хичээлийн жил. "
            If IIf(Not IsDBNull(dr("q2")), dr("q2"), "1") = "1" Then
                hjil.Text += "Намар"
            Else
                hjil.Text += "Хавар"
            End If
        End If
        dr.Close()
        myConnection.Close()
    End Sub
    Sub Increaser(ByVal sender As Object, ByVal e As EventArgs)
        cnt = cnt + 1
    End Sub
    Sub Oyutniijagsaalt()
        'Dim sql As String
        If myConnection.State = ConnectionState.Closed Then myConnection.Open()
        Dim cmd As SqlDataAdapter
        cmd = New SqlDataAdapter("exec Dungiin_jagsaalt3 '" & Request("lesscode") & "','" & Session("tcode") & "'", myConnection)
        table = New DataTable
        cmd.Fill(table)
        Dim rs As DataSet = New DataSet
        cmd.Fill(rs)

        DataGrid1.DataSource = rs
        DataGrid1.DataBind()
        myConnection.Close()
    End Sub
    Sub FindSurToo()
        s1 = 0
        s2 = 0
        s3 = 0
        s4 = 0
        s5 = 0
        s6 = 0
        s7 = 0
        s8 = 0
        s9 = 0
        s10 = 0
        s11 = 0
        s12 = 0
        s13 = 0

        Dim i As Integer
        For i = 0 To DataGrid1.Items.Count - 1
            Dim a1 As String = DataGrid1.Items(i).Cells(3).Text
            If Left(a1, 1) = "A" Then
                s1 += 1
            ElseIf Left(a1, 1) = "B" Then
                s2 += 1
            ElseIf Left(a1, 1) = "C" Then
                s3 += 1
            ElseIf Left(a1, 1) = "D" Then
                s4 += 1
            ElseIf Left(a1, 1) = "E" Then
                s5 += 1
            ElseIf Left(a1, 1) = "F" Then
                s6 += 1
            ElseIf Left(a1, 1) = "G" Then
                s7 += 1
            ElseIf Left(a1, 1) = "H" Then
                s8 += 1
            ElseIf Left(a1, 1) = "I" Then
                s9 += 1
            ElseIf Left(a1, 1) = "J" Then
                s10 += 1
            ElseIf Left(a1, 1) = "K" Then
                s11 += 1
            ElseIf Left(a1, 1) = "L" Then
                s12 += 1
            ElseIf Left(a1, 1) = "M" Then
                s13 += 1
            End If
        Next
    End Sub

End Class
