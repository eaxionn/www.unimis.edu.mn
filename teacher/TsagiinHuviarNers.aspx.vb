Imports System.data
Imports System.data.sqlclient

Partial Class TsagiinHuviarNers
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

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Response.Redirect("print.aspx")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        myConnection.ConnectionString = ConfigurationManager.AppSettings("ConnectionString")
        If Not zuser(Session("tcode"), Session("tpsss")) Then
            Response.Redirect("login.aspx")
        Else
            If (Request("page") = 2) Then
                'paths = "studentlist.ascx"
                Session("lcode") = Request("lesscode")
                Session("huvID") = Request("huvaariID")
                Session("ltype") = Request("ltype")
            Else
                'paths = "blank.ascx"
            End If
            cnt = 1
            datagrid()
        End If
    End Sub

    Sub datagrid()
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
                "LESSON_KOD='" & Session("lcode") & "' and POTOK in (select POTOK from NTIMETABLE where id=" & Session("huvID") & " and LESSON_KOD='" & Session("lcode") & "' and LESSON_TYPE=1) " & _
                "and LGROUP in (select LGROUP from NTIMETABLE where id=" & Session("huvID") & " and LESSON_KOD='" & Session("lcode") & "' and LESSON_TYPE=1) ) "
                'sql="SELECT U021EE as StudentCode, U021GG + ' ' + U021HH AS StudentFullName FROM U0362 INNER JOIN U021 ON U0362AA = U021EE INNER JOIN NTIMETABLE ON U0362DD = LESSON_KOD WHERE (U0362DD = '" & Session("lcode") & "') AND (LTEACHER = '" & Session("tcode") & "') AND (U0362KK = " & Session("huvID") & ") GROUP BY U021EE, id, U021GG, U021HH HAVING (id = " & Session("huvID") & ") "

                '"select studentID,upper(left(U021GG,1))+'.'+upper(U021HH) as studentName from 
                'NSongolt inner join U021 on U021EE=studentID where lessonID=
                '" & Session("lcode") & "' and teacherID='" & Session("tcode") & "
                ' and lektsID='" & Session("huvID") & "' order by studentID"
            ElseIf (Session("ltype") = 2) Then
                sql = "select U0362AA as StudentCode,left(U021GG,1) + '.' + U021HH AS StudentFullName from U0362 " & _
                "left JOIN U021 ON U0362AA = U021EE " & _
                "where U0362DD='" & Session("lcode") & "' and U0362BB=2 and U0362YY='2009-2010' " & _
                "and U0362GG=2 and U0362EE is not null " & _
                "and U0362LL in ( " & _
                "select id from NTIMETABLE where " & _
                "LESSON_KOD='" & Session("lcode") & "' and POTOK in (select POTOK from NTIMETABLE where id=" & Session("huvID") & " and LESSON_KOD='" & Session("lcode") & "' and LESSON_TYPE=2) " & _
                "and LGROUP in (select LGROUP from NTIMETABLE where id=" & Session("huvID") & " and LESSON_KOD='" & Session("lcode") & "' and LESSON_TYPE=2) ) "
                '"SELECT U021EE as StudentCode, U021GG + ' ' + U021HH AS StudentFullName FROM U0362 INNER JOIN U021 ON U0362AA = U021EE INNER JOIN NTIMETABLE ON U0362DD = LESSON_KOD WHERE (U0362DD = '" & Session("lcode") & "') AND (LTEACHER = '" & Session("tcode") & "') AND (U0362LL = " & Session("huvID") & ") GROUP BY U021EE, id, U021GG, U021HH HAVING (id = " & Session("huvID") & ") "

                'If (lk = "0" And sem <> "0" And lab = "0") Then
                '    Dim gp As String = GetItem("select LGROUP from NTIMETABLE where LESSON_KOD='" & Session("lcode") & "' and LTEACHER='" & Session("tcode") & "' and id=" & Session("huvID") & "")
                '    sql = "select studentID,upper(left(U021GG,1))+'.'+upper(U021HH) as studentName from NSongolt inner join U021 on U021EE=studentID where lessonID='" & Session("lcode") & "' and teacherID='" & Session("tcode") & "' and semID='" & gp & "' order by studentID"
                'Else
                '    sql = "select studentID,upper(left(U021GG,1))+'.'+upper(U021HH) as studentName from NSongolt inner join U021 on U021EE=studentID where lessonID='" & Session("lcode") & "' and teacherID='" & Session("tcode") & "' and semID='" & Session("huvID") & "' order by studentID"
                'End If
            ElseIf (Session("ltype") = 3) Then
                sql = "select U0362AA as StudentCode,left(U021GG,1) + '.' + U021HH AS StudentFullName from U0362 " & _
                "left JOIN U021 ON U0362AA = U021EE " & _
                "where U0362DD='" & Session("lcode") & "' and U0362BB=2 and U0362YY='2009-2010' " & _
                "and U0362GG=2 and U0362EE is not null " & _
                "and U0362MM in ( " & _
                "select id from NTIMETABLE where " & _
                "LESSON_KOD='" & Session("lcode") & "' and POTOK in (select POTOK from NTIMETABLE where id=" & Session("huvID") & " and LESSON_KOD='" & Session("lcode") & "' and LESSON_TYPE=3) " & _
                "and LGROUP in (select LGROUP from NTIMETABLE where id=" & Session("huvID") & " and LESSON_KOD='" & Session("lcode") & "' and LESSON_TYPE=3) ) "
                'sql = "SELECT U021EE as StudentCode, U021GG + ' ' + U021HH AS StudentFullName FROM U0362 INNER JOIN U021 ON U0362AA = U021EE INNER JOIN NTIMETABLE ON U0362DD = LESSON_KOD WHERE (U0362DD = '" & Session("lcode") & "') AND (LTEACHER = '" & Session("tcode") & "') AND (U0362MM = " & Session("huvID") & ") GROUP BY U021EE, id, U021GG, U021HH HAVING (id = " & Session("huvID") & ") "

                'sql = "select studentID,upper(left(U021GG,1))+'.'+upper(U021HH) as studentName from NSongolt inner join U021 on U021EE=studentID where lessonID='" & Session("lcode") & "' and teacherID='" & Session("tcode") & "' and labID='" & Session("huvID") & "' order by studentID"
            End If
            cmd = New SqlDataAdapter(sql, myConnection)
            rs = New DataTable
            cmd.Fill(rs)
            DataGrid1.DataSource = rs
            DataGrid1.DataBind()
            myConnection.Close()
        End If
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
