Imports System.data
Imports System.data.sqlclient
'Imports teacher.Module1
Partial Class print
    Inherits System.Web.UI.Page

    Dim myConnection As New SqlConnection
    Public cnt As Integer = 0

    Function zuser(ByVal usr As String, ByVal pwd As String) As Boolean
        myConnection.ConnectionString = ConfigurationManager.AppSettings("ConnectionString")
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

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        myConnection.ConnectionString = ConfigurationManager.AppSettings("ConnectionString")
        If Not zuser(Session("tcode"), Session("tpsss")) Then
            Response.Redirect("login.aspx")
        Else
            cnt = 1
            Label1.Text = Session("lcode")
            Label2.Text = Session("tcode")
            Label3.Text = GetItem("select LDAY+'-'+LTIME+'-пар '+ROOM+ case when TEGSH_SONDGOI=1 then '(тэгш)' when TEGSH_SONDGOI=0 then '(сондгой)' else '' end + rtrim(LDESC) as LTIME from NTIMETABLE where LESSON_KOD='" & Session("lcode") & "' and LTEACHER='" & Session("tcode") & "' and id=" & Session("huvID") & "")
            If (Session("ltype") = 1) Then
                Label4.Text = "Лекц"
            ElseIf (Session("ltype") = 2) Then
                Label4.Text = "Семинар"
            ElseIf (Session("ltype") = 3) Then
                Label4.Text = "Лаборатор"
            End If
            datagrid()
        End If
    End Sub
    Sub datagrid()
        Dim a, b, c, e, f, h, k, l, m As Integer
        a = 0
        b = 0
        c = 0
        e = 0
        f = 0
        h = 0
        k = 0
        l = 0
        m = 0
        If (Session("ltype") < 4) Then
            Dim sql As String = ""
            If myConnection.State = ConnectionState.Closed Then myConnection.Open()
            Dim cmd As SqlDataAdapter = New SqlDataAdapter("select U035GG,U035HH,U035II from U035 where U035CC='" & Session("lcode") & "'", myConnection)
            Dim rs As DataTable = New DataTable
            cmd.Fill(rs)
            Dim lk As String = rs.Rows(0).Item("U035GG")
            Dim sem As String = rs.Rows(0).Item("U035HH")
            Dim lab As String = rs.Rows(0).Item("U035II")
            If (Session("ltype") = 1) Then
                sql = "select U0362AA as StudentCode,left(U021GG,1) + '.' + U021HH AS StudentFullName from U0362 " & _
                "left JOIN U021 ON U0362AA = U021EE " & _
                "where U0362DD='" & Session("lcode") & "' and U0362BB=2 and U0362YY='2009-2010' " & _
                "and U0362GG=2 and U0362EE is not null " & _
                "and U0362KK in ( " & _
                "select id from NTIMETABLE where " & _
                "LESSON_KOD='" & Session("lcode") & "' and POTOK in (select POTOK from NTIMETABLE where id=" & Session("huvID") & " and LESSON_KOD='" & Session("lcode") & "') " & _
                "and LGROUP in (select LGROUP from NTIMETABLE where id=" & Session("huvID") & " and LESSON_KOD='" & Session("lcode") & "') ) order by U0362AA"
            ElseIf (Session("ltype") = 2) Then
                sql = "select U0362AA as StudentCode,left(U021GG,1) + '.' + U021HH AS StudentFullName from U0362 " & _
                "left JOIN U021 ON U0362AA = U021EE " & _
                "where U0362DD='" & Session("lcode") & "' and U0362BB=2 and U0362YY='2009-2010' " & _
                "and U0362GG=2 and U0362EE is not null " & _
                "and U0362LL in ( " & _
                "select id from NTIMETABLE where " & _
                "LESSON_KOD='" & Session("lcode") & "' and POTOK in (select POTOK from NTIMETABLE where id=" & Session("huvID") & " and LESSON_KOD='" & Session("lcode") & "') " & _
                "and LGROUP in (select LGROUP from NTIMETABLE where id=" & Session("huvID") & " and LESSON_KOD='" & Session("lcode") & "') )  order by U0362AA"
            ElseIf (Session("ltype") = 3) Then
                sql = "select U0362AA as StudentCode,left(U021GG,1) + '.' + U021HH AS StudentFullName from U0362 " & _
                "left JOIN U021 ON U0362AA = U021EE " & _
                "where U0362DD='" & Session("lcode") & "' and U0362BB=2 and U0362YY='2009-2010' " & _
                "and U0362GG=2 and U0362EE is not null " & _
                "and U0362MM in ( " & _
                "select id from NTIMETABLE where " & _
                "LESSON_KOD='" & Session("lcode") & "' and POTOK in (select POTOK from NTIMETABLE where id=" & Session("huvID") & " and LESSON_KOD='" & Session("lcode") & "') " & _
                "and LGROUP in (select LGROUP from NTIMETABLE where id=" & Session("huvID") & " and LESSON_KOD='" & Session("lcode") & "') )  order by U0362AA"
            End If
            cmd = New SqlDataAdapter(sql, myConnection)
            rs = New DataTable
            cmd.Fill(rs)
            DataGrid1.DataSource = rs
            DataGrid1.DataBind()
            myConnection.Close()

            Dim rrow As System.Data.DataRow
            For Each rrow In rs.Rows
                If Left(rrow("StudentCode"), 1) = "A" Then
                    a += 1
                ElseIf Left(rrow("StudentCode"), 1) = "B" Then
                    b += 1
                ElseIf Left(rrow("StudentCode"), 1) = "C" Then
                    c += 1
                ElseIf Left(rrow("StudentCode"), 1) = "E" Then
                    e += 1
                ElseIf Left(rrow("StudentCode"), 1) = "F" Then
                    f += 1
                ElseIf Left(rrow("StudentCode"), 1) = "H" Then
                    h += 1
                ElseIf Left(rrow("StudentCode"), 1) = "K" Then
                    k += 1
                ElseIf Left(rrow("StudentCode"), 1) = "L" Then
                    l += 1
                ElseIf Left(rrow("StudentCode"), 1) = "M" Then
                    m += 1
                End If
            Next
        End If
        niit.Text = "A: " & a.ToString & " B: " & b.ToString & " C: " & c.ToString & " E: " & e.ToString & " F: " & f.ToString & " H: " & h.ToString & " K: " & k.ToString & " L: " & l.ToString & " M:" & m.ToString
    End Sub
    Sub DataGrid1_Paged(ByVal sender As Object, ByVal e As DataGridPageChangedEventArgs) Handles DataGrid1.PageIndexChanged
        DataGrid1.CurrentPageIndex = e.NewPageIndex
        If DataGrid1.CurrentPageIndex = 0 Then
            cnt = 1
        Else
            cnt = (DataGrid1.CurrentPageIndex) * DataGrid1.PageSize + 1
        End If
        datagrid()
    End Sub
    Sub Increaser(ByVal sender As Object, ByVal e As EventArgs)
        cnt = cnt + 1
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        Response.Redirect("index.aspx")
    End Sub

    Public Function GetItem(ByVal strSQL As String) As String
        Dim Retstr As String = ""
        Try
            If myConnection.State = ConnectionState.Closed Then myConnection.Open()
            Dim oCmd As New SqlClient.SqlCommand(strSQL, myConnection)
            Dim oReader As SqlClient.SqlDataReader
            oReader = oCmd.ExecuteReader
            While oReader.Read()
                Retstr = oReader.Item(0)
            End While
            oReader.Close()
            myConnection.Close()
        Catch e As Exception
        Finally
            GetItem = Retstr
        End Try
    End Function

End Class
