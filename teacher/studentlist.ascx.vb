Imports System.data
Imports System.data.sqlclient
'Imports teacher.Module1

Partial Class studentlist
    Inherits System.Web.UI.UserControl
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
                sql = "select studentID,upper(left(U021GG,1))+'.'+upper(U021HH) as studentName from NSongolt inner join U021 on U021EE=studentID where lessonID='" & Session("lcode") & "' and teacherID='" & Session("tcode") & "' and lektsID='" & Session("huvID") & "' order by studentID"
            ElseIf (Session("ltype") = 2) Then
                If (lk = "0" And sem <> "0" And lab = "0") Then
                    Dim gp As String = GetItem("select LGROUP from NTIMETABLE where LESSON_KOD='" & Session("lcode") & "' and LTEACHER='" & Session("tcode") & "' and id=" & Session("huvID") & "")
                    sql = "select studentID,upper(left(U021GG,1))+'.'+upper(U021HH) as studentName from NSongolt inner join U021 on U021EE=studentID where lessonID='" & Session("lcode") & "' and teacherID='" & Session("tcode") & "' and semID='" & gp & "' order by studentID"
                Else
                    sql = "select studentID,upper(left(U021GG,1))+'.'+upper(U021HH) as studentName from NSongolt inner join U021 on U021EE=studentID where lessonID='" & Session("lcode") & "' and teacherID='" & Session("tcode") & "' and semID='" & Session("huvID") & "' order by studentID"
                End If
            ElseIf (Session("ltype") = 3) Then
                sql = "select studentID,upper(left(U021GG,1))+'.'+upper(U021HH) as studentName from NSongolt inner join U021 on U021EE=studentID where lessonID='" & Session("lcode") & "' and teacherID='" & Session("tcode") & "' and labID='" & Session("huvID") & "' order by studentID"
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

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Response.Redirect("print.aspx")
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
