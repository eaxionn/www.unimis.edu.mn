Imports System.data
Imports System.data.sqlclient
Imports System.Web.Security
'Imports student.Module1

Partial Class songolt
    Inherits System.Web.UI.Page
    Dim myConnection As New SqlConnection
    Public sql As String
    Dim datatableTeacher1 As DataTable

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
        'If Right(Left(Session("u1000"), 6), 2) = "09" Or Session("dahin") = "1" Then
        'Button4.Enabled = True
        'Button1.Enabled = True
        'Else
        'Button4.Enabled = False
        'Button1.Enabled = False
        'End If
        If Not zuser(Session("u1000"), Session("psss")) Then
            Response.Redirect("login.aspx")
        Else
            Response.Expires = -1
            If Not Page.IsPostBack Then
                If myConnection.State = ConnectionState.Closed Then myConnection.Open()
                If Session("songolt") = 2 Then
                    sql = "Select U0322CC,U0322DD,U0322EE,U0322FF,U0322HH as uu," & _
                            " U0322HH=case  when isnull(U0322HH,0)=1 then 'намар'     " & _
                            " when isnull(U0322HH,0)=2 then 'хавар'     " & _
                            " when isnull(U0322HH,0)=9 then 'дурын' " & _
                            " end,U0322II,U035DD,U035EE,U0322KK as U035FF," & _
                            " omnouzsen=case when aa.U0364EE is null then 'true'     " & _
                            " Else 'false'     " & _
                            " end," & _
                            " songoson=case when aa1.U0362DD is null then 'false'     " & _
                            "       Else 'true'     " & _
                            "	end,aa1.U0362DD" & _
                            "           from U0322 " & _
                            " INNER JOIN U035 ON U035.U035CC=U0322.U0322DD " & _
                            " left join (select U0364EE from U0364A " & _
                            "		where U0364DD='" & Session("u1000") & "' and  isnull(U0364PP,'') !='R'  " & _
                            "           union " & _
                            "		select U0364EE from U0364 " & _
                            "		where U0364DD='" & Session("u1000") & "' and  isnull(U0364PP,'') !='R' " & _
                            "		)aa " & _
                            " on U0364EE=U0322DD " & _
                            " left join (select U0362.* from U0362 inner join main on " & _
                            " U0362YY=q1 and U0362BB=q2  where U0362AA='" & Session("u1000") & "')aa1" & _
                            " on U0362DD=U0322DD " & _
                            "           where " & _
                            " U0322.U0322CC in( Select  U021DD  from U021 where U021EE='" & Session("u1000") & "') and  U0322.U0322BB in( Select U021AE from U021 where U021EE='" & Session("u1000") & "')"
                ElseIf Session("songolt") = 1 Then
                    sql = "Select U0322CC,U0322DD,U0322EE,U0322FF,U0322HH as uu, " & _
                         " U0322HH=case when isnull(U0322HH,0)=1 then 'намар' " & _
                         " when isnull(U0322HH,0)=2 then 'хавар' " & _
                         " when isnull(U0322HH,0)=9 then 'дурын' end," & _
                         " U0322II, U035DD, U035EE, U0322KK as U035FF, " & _
                         " omnouzsen=case when aa.U0364EE is null then 'true' Else 'false' end, " & _
                         " songoson=case when aa1.U0362DD is null then 'false' Else 'true' end," & _
                         " aa1.U0362DD from U0322 " & _
                         " INNER JOIN U035 ON U035.U035CC=U0322.U0322DD " & _
                         "left join (select U0364EE from U0364A where U0364DD='" & Session("u1000") & "' and isnull(U0364PP,'') !='R' " & _
                            " union " & _
                      " select U0364EE from U0364 where U0364DD='" & Session("u1000") & "' and isnull(U0364PP,'') !='R' " & _
                      " union " & _
                      " select U0362DD from U0362 inner join main on U0362YY=q1 and U0362BB=q2 where U0362AA='" & Session("u1000") & "' and U0362GG=2 " & _
                         " )aa on " & _
                         " U0364EE=U0322DD " & _
                          " left join " & _
                         " (select U0362.* from U0362 inner join main on U0362YY=q5 and U0362BB=q4 where U0362AA='" & Session("u1000") & "')aa1 " & _
                         " on U0362DD=U0322DD " & _
                            " where U0322.U0322CC in( Select U021DD from U021 where U021EE='" & Session("u1000") & "') and " & _
                            " U0322.U0322BB in( Select U021AE from U021 where U021EE='" & Session("u1000") & "')  "
                End If
                Dim hos As Boolean = False
                Dim cmd As New SqlCommand("Select U0211CC from U0211 where U0211BB='" & Session("u1000") & "'", myConnection)
                Dim dr As SqlDataReader
                dr = cmd.ExecuteReader()
                If dr.Read() Then
                    sql += " and U0322MM='" & Trim(dr(0)) & "' "
                Else
                    sql += " and  U0322MM is null "
                End If
                'Label4.Text = sql

                myConnection.Close()
                Try
                    Deedzaaval()

                    Label2.Text = "Мэргэжлийн индекс -" & DataGrid1.Items(1).Cells(0).Text
                    HyperLink1.NavigateUrl = "st_san.aspx?ind=" & DataGrid1.Items(1).Cells(0).Text

                    Deedsongon()
                    Mergejliinzaaval()
                    Mergejliinsongon()
                    Mergejliindadlaga()
                    MerZaaval()
                    MerSongon()
                    MerDadlaga()
                    Diplom()
                Catch ex As Exception
                    Response.Write("ТАНЫ МЭДЭЭЛЭЛ БААЗАД ОРООГVЙ БАЙНА.")
                End Try
            End If
        End If
    End Sub
    Sub Deedzaaval()
        If myConnection.State = ConnectionState.Closed Then myConnection.Open()
        Dim cmd As SqlDataAdapter
        cmd = New SqlDataAdapter(sql & " and U0322.U0322EE=1 and U0322.U0322FF='A' order by U0322DD ", myConnection)
        'Label3.Text = sql & " and U0322.U0322EE=1 and U0322.U0322FF='A' order by U0322DD "
        Dim rs As DataSet = New DataSet
        cmd.Fill(rs)
        DataGrid1.DataSource = rs
        DataGrid1.DataBind()
        myConnection.Close()
    End Sub
    Sub Deedsongon()
        If myConnection.State = ConnectionState.Closed Then myConnection.Open()
        Dim cmd As SqlDataAdapter
        cmd = New SqlDataAdapter(sql & " and U0322.U0322EE=1 and U0322.U0322FF='B' order by U0322DD ", myConnection)
        Dim rs As DataSet = New DataSet
        cmd.Fill(rs)
        Datagrid2.DataSource = rs
        Datagrid2.DataBind()
        myConnection.Close()
    End Sub
    Sub Mergejliinzaaval()
        If myConnection.State = ConnectionState.Closed Then myConnection.Open()
        Dim cmd As SqlDataAdapter
        cmd = New SqlDataAdapter(sql & " and U0322.U0322EE=2 and U0322.U0322FF='A' order by U0322DD ", myConnection)
        Dim rs As DataSet = New DataSet
        cmd.Fill(rs)
        Datagrid3.DataSource = rs
        Datagrid3.DataBind()
        myConnection.Close()
    End Sub
    Sub Mergejliinsongon()
        If myConnection.State = ConnectionState.Closed Then myConnection.Open()
        Dim cmd As SqlDataAdapter
        cmd = New SqlDataAdapter(sql & " and U0322.U0322EE=2 and U0322.U0322FF='B' order by U0322DD ", myConnection)
        Dim rs As DataSet = New DataSet
        cmd.Fill(rs)
        Datagrid4.DataSource = rs
        Datagrid4.DataBind()
        myConnection.Close()
    End Sub
    Sub Mergejliindadlaga()
        If myConnection.State = ConnectionState.Closed Then myConnection.Open()
        Dim cmd As SqlDataAdapter
        cmd = New SqlDataAdapter(sql & " and U0322.U0322EE=2 and U0322.U0322FF='C' order by U0322DD ", myConnection)
        Dim rs As DataSet = New DataSet
        cmd.Fill(rs)
        Datagrid5.DataSource = rs
        Datagrid5.DataBind()
        myConnection.Close()
    End Sub
    Sub MerZaaval()
        If myConnection.State = ConnectionState.Closed Then myConnection.Open()
        Dim cmd As SqlDataAdapter
        cmd = New SqlDataAdapter(sql & " and U0322.U0322EE=3 and U0322.U0322FF='A' order by U0322DD ", myConnection)
        Dim rs As DataSet = New DataSet
        cmd.Fill(rs)
        Datagrid6.DataSource = rs
        Datagrid6.DataBind()
        myConnection.Close()
    End Sub
    Sub MerSongon()
        If myConnection.State = ConnectionState.Closed Then myConnection.Open()
        Dim cmd As SqlDataAdapter
        cmd = New SqlDataAdapter(sql & " and U0322.U0322EE=3 and U0322.U0322FF='B' order by U0322DD ", myConnection)
        Dim rs As DataSet = New DataSet
        cmd.Fill(rs)
        Datagrid7.DataSource = rs
        Datagrid7.DataBind()
        myConnection.Close()
    End Sub
    Sub MerDadlaga()
        If myConnection.State = ConnectionState.Closed Then myConnection.Open()
        Dim cmd As SqlDataAdapter
        cmd = New SqlDataAdapter(sql & " and U0322.U0322EE=3 and U0322.U0322FF='C' order by U0322DD ", myConnection)
        Dim rs As DataSet = New DataSet
        cmd.Fill(rs)
        Datagrid8.DataSource = rs
        Datagrid8.DataBind()
        myConnection.Close()
    End Sub
    Sub Diplom()
        If myConnection.State = ConnectionState.Closed Then myConnection.Open()
        Dim cmd As SqlDataAdapter
        cmd = New SqlDataAdapter(sql & " and U0322.U0322EE=3 and U0322.U0322FF='D' order by U0322DD ", myConnection)
        Dim rs As DataSet = New DataSet
        cmd.Fill(rs)
        Datagrid9.DataSource = rs
        Datagrid9.DataBind()
        myConnection.Close()
    End Sub

    Sub loadDataTable()
        If Session("songolt") = 2 Then
            Dim sqll As String = "select * from U0362 where U0362AA='" & Session("u1000") & "'"
            'If myConnection.State = ConnectionState.Closed Then myConnection.Open()
            Dim cmd As New SqlCommand(sqll, myConnection)
            datatableTeacher1 = New DataTable
            Dim tt As New SqlDataAdapter(cmd)
            tt.Fill(datatableTeacher1)
            'myConnection.Close()
        End If
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        If Session("songolt") = 1 Then
            If checkAchaalal() = 1 Then
                Exit Sub
            End If
            Dim i, ii As Integer
            Dim aa(100) As String
            ii = 0
            'Try
            For i = 0 To DataGrid1.Items.Count - 1
                Dim checked As CheckBox = CType(DataGrid1.Items(i).FindControl("CheckBox1"), CheckBox)
                Dim lcode As String = DataGrid1.Items(i).Cells(1).Text
                If checked.Checked = True Then
                    'Label3.Text += "<br>" & lcode
                    If omnohholboo(lcode) = 0 Then
                        Label4.Text = lcode & " хичээлийн емнех холбооны хичээл vзээгvй байна "
                        Exit Sub
                    End If
                    ii = ii + 1
                    aa(ii) = lcode
                End If
            Next
            For i = 0 To Datagrid2.Items.Count - 1
                Dim checked As CheckBox = CType(Datagrid2.Items(i).FindControl("CheckBox2"), CheckBox)
                Dim lcode As String = Datagrid2.Items(i).Cells(0).Text
                If checked.Checked = True Then
                    If omnohholboo(lcode) = 0 Then
                        Label4.Text = lcode & " хичээлийн емнех холбооны хичээл vзээгvй байна "
                        Exit Sub
                    End If
                    ii = ii + 1
                    aa(ii) = lcode
                End If
            Next
            For i = 0 To Datagrid3.Items.Count - 1
                Dim checked As CheckBox = CType(Datagrid3.Items(i).FindControl("CheckBox3"), CheckBox)
                Dim lcode As String = Datagrid3.Items(i).Cells(0).Text
                If checked.Checked = True Then
                    If omnohholboo(lcode) = 0 Then
                        Label4.Text = lcode & " хичээлийн емнех холбооны хичээл vзээгvй байна "
                        Exit Sub
                    End If
                    ii = ii + 1
                    aa(ii) = lcode
                End If
            Next
            For i = 0 To Datagrid4.Items.Count - 1
                Dim checked As CheckBox = CType(Datagrid4.Items(i).FindControl("CheckBox4"), CheckBox)
                Dim lcode As String = Datagrid4.Items(i).Cells(0).Text
                If checked.Checked = True Then
                    If omnohholboo(lcode) = 0 Then
                        Label4.Text = lcode & " хичээлийн емнех холбооны хичээл vзээгvй байна "
                        Exit Sub
                    End If
                    ii = ii + 1
                    aa(ii) = lcode
                End If
            Next
            For i = 0 To Datagrid5.Items.Count - 1
                Dim checked As CheckBox = CType(Datagrid5.Items(i).FindControl("CheckBox5"), CheckBox)
                Dim lcode As String = Datagrid5.Items(i).Cells(0).Text
                If checked.Checked = True Then
                    If omnohholboo(lcode) = 0 Then
                        Label4.Text = lcode & " хичээлийн емнех холбооны хичээл vзээгvй байна "
                        Exit Sub
                    End If
                    ii = ii + 1
                    aa(ii) = lcode
                End If
            Next
            For i = 0 To Datagrid6.Items.Count - 1
                Dim checked As CheckBox = CType(Datagrid6.Items(i).FindControl("CheckBox6"), CheckBox)
                Dim lcode As String = Datagrid6.Items(i).Cells(0).Text
                If checked.Checked = True Then
                    If omnohholboo(lcode) = 0 Then
                        Label4.Text = lcode & " хичээлийн емнех холбооны хичээл vзээгvй байна "
                        Exit Sub
                    End If
                    ii = ii + 1
                    aa(ii) = lcode
                End If
            Next
            For i = 0 To Datagrid7.Items.Count - 1
                Dim checked As CheckBox = CType(Datagrid7.Items(i).FindControl("CheckBox7"), CheckBox)
                Dim lcode As String = Datagrid7.Items(i).Cells(0).Text
                If checked.Checked = True Then
                    If omnohholboo(lcode) = 0 Then
                        Label4.Text = lcode & " хичээлийн емнех холбооны хичээл vзээгvй байна "
                        Exit Sub
                    End If
                    ii = ii + 1
                    aa(ii) = lcode
                End If
            Next
            For i = 0 To Datagrid8.Items.Count - 1
                Dim checked As CheckBox = CType(Datagrid8.Items(i).FindControl("CheckBox8"), CheckBox)
                Dim lcode As String = Datagrid8.Items(i).Cells(0).Text
                If checked.Checked = True Then
                    If omnohholboo(lcode) = 0 Then
                        Label4.Text = lcode & " хичээлийн емнех холбооны хичээл vзээгvй байна "
                        Exit Sub
                    End If
                    ii = ii + 1
                    aa(ii) = lcode
                End If
            Next
            For i = 0 To Datagrid9.Items.Count - 1
                Dim checked As CheckBox = CType(Datagrid9.Items(i).FindControl("CheckBox9"), CheckBox)
                Dim lcode As String = Datagrid9.Items(i).Cells(0).Text
                If checked.Checked = True Then
                    If omnohholboo(lcode) = 0 Then
                        Label4.Text = lcode & " хичээлийн емнех холбооны хичээл vзээгvй байна "
                        Exit Sub
                    End If
                    ii = ii + 1
                    aa(ii) = lcode
                End If
            Next
            If myConnection.State = ConnectionState.Closed Then myConnection.Open()

            loadDataTable()

            '-----------20090825 SONGOLT USTGAHGUI ORUULAH------------
            If Session("songolt") = 1 Then
                sql = " declare @on varchar(9),@uliral int select @on=q5,@uliral=q4 from main "
                sql = sql & " delete from U0362 where U0362AA='" & Session("u1000") & "' and U0362YY=@on and U0362BB=@uliral  "
                'ElseIf Session("songolt") = 2 Then
                'sql = " declare @on varchar(9),@uliral int select @on=q1,@uliral=q2 from main "
                'sql = sql & " delete from U0362 where U0362AA='" & Session("u1000") & "' and U0362YY=@on and U0362BB=@uliral "
                Dim cmd As New SqlCommand(sql, myConnection)
                cmd.ExecuteNonQuery()
            ElseIf Session("songolt") = 2 Then
                Dim objSongolt1 As System.Data.DataRow
                Dim counnt As Integer = 0
                For Each objSongolt1 In datatableTeacher1.Rows
                    For i = 1 To ii
                        If aa(i) = objSongolt1("U0362DD") Then
                            counnt = 1
                            Exit For
                        End If
                    Next
                    If counnt = 0 Then
                        sql = " declare @on varchar(9),@uliral int select @on=q1,@uliral=q2 from main "
                        sql = sql & " delete from U0362 where U0362AA='" & Session("u1000") & "' and U0362YY=@on and U0362BB=@uliral and U0362DD='" & objSongolt1("U0362DD") & "' "
                        Dim cmd1 As New SqlCommand(sql, myConnection)
                        cmd1.ExecuteNonQuery()
                        sql = "delete from NSongolt where studentID='" & Session("u1000") & "' and lessonID='" & objSongolt1("U0362DD") & "' and hyear='" & Session("on") & "' and hsemester='" & Session("ul") & "'"
                        cmd1 = New SqlCommand(sql, myConnection)
                        cmd1.ExecuteNonQuery()
                    End If
                    counnt = 0
                Next
            End If

            ' Dim cmd As SqlDataAdapter

            If Session("songolt") = 1 Then
                For i = 1 To ii
                    sql = " declare @on varchar(9),@uliral int select @on=q5,@uliral=q4 from main "
                    sql = sql & " insert into U0362 values('" & Session("u1000") & "',@uliral,'" & aa(i) & "',null,getdate(),'" & Session("songolt") & "','" & Session("u1000") & "',@on,null,null,null,null) "
                    Dim cmd1 As New SqlCommand(sql, myConnection)
                    cmd1.ExecuteNonQuery()
                Next
            ElseIf Session("songolt") = 2 Then
                'loadDataTable()
                Dim countt As Integer = 0
                Dim objSongolt As System.Data.DataRow
                For i = 1 To ii
                    For Each objSongolt In datatableTeacher1.Rows
                        If aa(i) = objSongolt("U0362DD") Then
                            countt = 1
                            Exit For
                        End If
                    Next
                    If countt = 0 Then
                        sql = " declare @on varchar(9),@uliral int select @on=q1,@uliral=q2 from main "
                        sql = sql & " insert into U0362 values('" & Session("u1000") & "',@uliral,'" & aa(i) & "',null,getdate(),'" & Session("songolt") & "','" & Session("u1000") & "',@on,null,null,null,null) "
                        Dim cmd1 As New SqlCommand(sql, myConnection)
                        cmd1.ExecuteNonQuery()
                    End If
                    countt = 0
                Next
            End If

            myConnection.Close()
            If Session("master") = "D" Then
                Response.Redirect("songolt1.aspx")
            Else
                Response.Redirect("songoltMaster.aspx")
            End If
        Else
            Label4.Text = "Та хичээл сонголт хийх эрхгvй байна."
        End If
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        If Session("master") = "D" Then
            Response.Redirect("songolt1.aspx")
        Else
            Response.Redirect("songoltMaster.aspx")
        End If
    End Sub

    Sub Item_Bound1(ByVal sender As Object, ByVal e As DataGridItemEventArgs)
        Select Case e.Item.ItemType
            Case ListItemType.Item, ListItemType.AlternatingItem
                Dim checked As CheckBox = CType(e.Item.FindControl("CheckBox1"), CheckBox)
                Dim ul As String = CType(e.Item.Cells(9).Text, String)
                checked.Enabled = CType(e.Item.Cells(7).Text, Boolean)
                checked.Checked = CType(e.Item.Cells(8).Text, Boolean)
                'If ul <> Session("q4") Or ul <> "9" Then
                'checked.Enabled = False
                'End If
                If checked.Enabled = True Then
                    If ul = "1" Or ul = "2" Then
                        If ul <> Session("q4") Then
                            checked.Enabled = False
                        End If
                    End If
                End If
        End Select
    End Sub
    Sub Item_Bound2(ByVal sender As Object, ByVal e As DataGridItemEventArgs)
        Select Case e.Item.ItemType
            Case ListItemType.Item, ListItemType.AlternatingItem
                Dim checked As CheckBox = CType(e.Item.FindControl("CheckBox2"), CheckBox)
                Dim ul As String = CType(e.Item.Cells(8).Text, String)
                checked.Enabled = CType(e.Item.Cells(6).Text, Boolean)
                checked.Checked = CType(e.Item.Cells(7).Text, Boolean)
                If checked.Enabled = True Then
                    If ul = "1" Or ul = "2" Then
                        If ul <> Session("q4") Then
                            checked.Enabled = False
                        End If
                    End If
                End If
        End Select
    End Sub
    Sub Item_Bound3(ByVal sender As Object, ByVal e As DataGridItemEventArgs)
        Select Case e.Item.ItemType
            Case ListItemType.Item, ListItemType.AlternatingItem
                Dim checked As CheckBox = CType(e.Item.FindControl("CheckBox3"), CheckBox)
                Dim ul As String = CType(e.Item.Cells(8).Text, String)
                checked.Enabled = CType(e.Item.Cells(6).Text, Boolean)
                checked.Checked = CType(e.Item.Cells(7).Text, Boolean)
                If checked.Enabled = True Then
                    If ul = "1" Or ul = "2" Then
                        If ul <> Session("q4") Then
                            checked.Enabled = False
                        End If
                    End If
                End If
        End Select
    End Sub
    Sub Item_Bound4(ByVal sender As Object, ByVal e As DataGridItemEventArgs)
        Select Case e.Item.ItemType
            Case ListItemType.Item, ListItemType.AlternatingItem
                Dim checked As CheckBox = CType(e.Item.FindControl("CheckBox4"), CheckBox)
                Dim ul As String = CType(e.Item.Cells(8).Text, String)
                checked.Enabled = CType(e.Item.Cells(6).Text, Boolean)
                checked.Checked = CType(e.Item.Cells(7).Text, Boolean)
                If checked.Enabled = True Then
                    If ul = "1" Or ul = "2" Then
                        If ul <> Session("q4") Then
                            checked.Enabled = False
                        End If
                    End If
                End If
        End Select
    End Sub
    Sub Item_Bound5(ByVal sender As Object, ByVal e As DataGridItemEventArgs)
        Select Case e.Item.ItemType
            Case ListItemType.Item, ListItemType.AlternatingItem
                Dim checked As CheckBox = CType(e.Item.FindControl("CheckBox5"), CheckBox)
                Dim ul As String = CType(e.Item.Cells(8).Text, String)
                checked.Enabled = CType(e.Item.Cells(6).Text, Boolean)
                checked.Checked = CType(e.Item.Cells(7).Text, Boolean)
                If checked.Enabled = True Then
                    If ul = "1" Or ul = "2" Then
                        If ul <> Session("q4") Then
                            checked.Enabled = False
                        End If
                    End If
                End If
        End Select
    End Sub
    Sub Item_Bound6(ByVal sender As Object, ByVal e As DataGridItemEventArgs)
        Select Case e.Item.ItemType
            Case ListItemType.Item, ListItemType.AlternatingItem
                Dim checked As CheckBox = CType(e.Item.FindControl("CheckBox6"), CheckBox)
                Dim ul As String = CType(e.Item.Cells(8).Text, String)
                checked.Enabled = CType(e.Item.Cells(6).Text, Boolean)
                checked.Checked = CType(e.Item.Cells(7).Text, Boolean)
                If checked.Enabled = True Then
                    If ul = "1" Or ul = "2" Then
                        If ul <> Session("q4") Then
                            checked.Enabled = False
                        End If
                    End If
                End If
        End Select
    End Sub
    Sub Item_Bound7(ByVal sender As Object, ByVal e As DataGridItemEventArgs)
        Select Case e.Item.ItemType
            Case ListItemType.Item, ListItemType.AlternatingItem
                Dim checked As CheckBox = CType(e.Item.FindControl("CheckBox7"), CheckBox)
                Dim ul As String = CType(e.Item.Cells(8).Text, String)
                checked.Enabled = CType(e.Item.Cells(6).Text, Boolean)
                checked.Checked = CType(e.Item.Cells(7).Text, Boolean)
                If checked.Enabled = True Then
                    If ul = "1" Or ul = "2" Then
                        If ul <> Session("q4") Then
                            checked.Enabled = False
                        End If
                    End If
                End If
        End Select
    End Sub
    Sub Item_Bound8(ByVal sender As Object, ByVal e As DataGridItemEventArgs)
        Select Case e.Item.ItemType
            Case ListItemType.Item, ListItemType.AlternatingItem
                Dim checked As CheckBox = CType(e.Item.FindControl("CheckBox8"), CheckBox)
                Dim ul As String = CType(e.Item.Cells(8).Text, String)
                checked.Enabled = CType(e.Item.Cells(6).Text, Boolean)
                checked.Checked = CType(e.Item.Cells(7).Text, Boolean)
                If checked.Enabled = True Then
                    If ul = "1" Or ul = "2" Then
                        If ul <> Session("q4") Then
                            checked.Enabled = False
                        End If
                    End If
                End If
        End Select
    End Sub
    Sub Item_Bound9(ByVal sender As Object, ByVal e As DataGridItemEventArgs)
        Select Case e.Item.ItemType
            Case ListItemType.Item, ListItemType.AlternatingItem
                Dim checked As CheckBox = CType(e.Item.FindControl("CheckBox9"), CheckBox)
                Dim ul As String = CType(e.Item.Cells(8).Text, String)
                checked.Enabled = CType(e.Item.Cells(6).Text, Boolean)
                checked.Checked = CType(e.Item.Cells(7).Text, Boolean)
                If checked.Enabled = True Then
                    If ul = "1" Or ul = "2" Then
                        If ul <> Session("q4") Then
                            checked.Enabled = False
                        End If
                    End If
                End If
        End Select
    End Sub

    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button3.Click
        If Session("master") = "D" Then
            Response.Redirect("songolt1.aspx")
        Else
            Response.Redirect("songoltMaster.aspx")
        End If
    End Sub

    Function omnohholboo(ByVal lcode As String) As Integer
        Dim val As Boolean = False
        If myConnection.State = ConnectionState.Closed Then myConnection.Open()
        Dim sql As String = "exec sp_Check_LessPrevweb	'" & Session("u1000") & "','" & lcode & "'"
        Dim cmd1 As New SqlCommand(sql, myConnection)
        Dim dr1 As SqlDataReader
        dr1 = cmd1.ExecuteReader()
        If dr1.Read() Then
            omnohholboo = dr1(0)
        End If
        dr1.Close()
        myConnection.Close()
    End Function

    Protected Sub Button4_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button4.Click
        If Session("songolt") = 1 Then
            Dim i, ii As Integer
            Dim aa(100) As String
            ii = 0
            'Try
            If checkAchaalal() = 1 Then
                Exit Sub
            End If
            For i = 0 To DataGrid1.Items.Count - 1
                Dim checked As CheckBox = CType(DataGrid1.Items(i).FindControl("CheckBox1"), CheckBox)
                Dim lcode As String = DataGrid1.Items(i).Cells(1).Text
                If checked.Checked = True Then
                    'Label3.Text += "<br>" & lcode
                    If omnohholboo(lcode) = 0 Then
                        Label4.Text = lcode & " хичээлийн емнех холбооны хичээл vзээгvй байна "
                        Exit Sub
                    End If
                    ii = ii + 1
                    aa(ii) = lcode
                End If
            Next
            For i = 0 To Datagrid2.Items.Count - 1
                Dim checked As CheckBox = CType(Datagrid2.Items(i).FindControl("CheckBox2"), CheckBox)
                Dim lcode As String = Datagrid2.Items(i).Cells(0).Text
                If checked.Checked = True Then
                    If omnohholboo(lcode) = 0 Then
                        Label4.Text = lcode & " хичээлийн емнех холбооны хичээл vзээгvй байна "
                        Exit Sub
                    End If
                    ii = ii + 1
                    aa(ii) = lcode
                End If
            Next
            For i = 0 To Datagrid3.Items.Count - 1
                Dim checked As CheckBox = CType(Datagrid3.Items(i).FindControl("CheckBox3"), CheckBox)
                Dim lcode As String = Datagrid3.Items(i).Cells(0).Text
                If checked.Checked = True Then
                    If omnohholboo(lcode) = 0 Then
                        Label4.Text = lcode & " хичээлийн емнех холбооны хичээл vзээгvй байна "
                        Exit Sub
                    End If
                    ii = ii + 1
                    aa(ii) = lcode
                End If
            Next
            For i = 0 To Datagrid4.Items.Count - 1
                Dim checked As CheckBox = CType(Datagrid4.Items(i).FindControl("CheckBox4"), CheckBox)
                Dim lcode As String = Datagrid4.Items(i).Cells(0).Text
                If checked.Checked = True Then
                    If omnohholboo(lcode) = 0 Then
                        Label4.Text = lcode & " хичээлийн емнех холбооны хичээл vзээгvй байна "
                        Exit Sub
                    End If
                    ii = ii + 1
                    aa(ii) = lcode
                End If
            Next
            For i = 0 To Datagrid5.Items.Count - 1
                Dim checked As CheckBox = CType(Datagrid5.Items(i).FindControl("CheckBox5"), CheckBox)
                Dim lcode As String = Datagrid5.Items(i).Cells(0).Text
                If checked.Checked = True Then
                    If omnohholboo(lcode) = 0 Then
                        Label4.Text = lcode & " хичээлийн емнех холбооны хичээл vзээгvй байна "
                        Exit Sub
                    End If
                    ii = ii + 1
                    aa(ii) = lcode
                End If
            Next
            For i = 0 To Datagrid6.Items.Count - 1
                Dim checked As CheckBox = CType(Datagrid6.Items(i).FindControl("CheckBox6"), CheckBox)
                Dim lcode As String = Datagrid6.Items(i).Cells(0).Text
                If checked.Checked = True Then
                    If omnohholboo(lcode) = 0 Then
                        Label4.Text = lcode & " хичээлийн емнех холбооны хичээл vзээгvй байна "
                        Exit Sub
                    End If
                    ii = ii + 1
                    aa(ii) = lcode
                End If
            Next
            For i = 0 To Datagrid7.Items.Count - 1
                Dim checked As CheckBox = CType(Datagrid7.Items(i).FindControl("CheckBox7"), CheckBox)
                Dim lcode As String = Datagrid7.Items(i).Cells(0).Text
                If checked.Checked = True Then
                    If omnohholboo(lcode) = 0 Then
                        Label4.Text = lcode & " хичээлийн емнех холбооны хичээл vзээгvй байна "
                        Exit Sub
                    End If
                    ii = ii + 1
                    aa(ii) = lcode
                End If
            Next
            For i = 0 To Datagrid8.Items.Count - 1
                Dim checked As CheckBox = CType(Datagrid8.Items(i).FindControl("CheckBox8"), CheckBox)
                Dim lcode As String = Datagrid8.Items(i).Cells(0).Text
                If checked.Checked = True Then
                    If omnohholboo(lcode) = 0 Then
                        Label4.Text = lcode & " хичээлийн емнех холбооны хичээл vзээгvй байна "
                        Exit Sub
                    End If
                    ii = ii + 1
                    aa(ii) = lcode
                End If
            Next
            For i = 0 To Datagrid9.Items.Count - 1
                Dim checked As CheckBox = CType(Datagrid9.Items(i).FindControl("CheckBox9"), CheckBox)
                Dim lcode As String = Datagrid9.Items(i).Cells(0).Text
                If checked.Checked = True Then
                    If omnohholboo(lcode) = 0 Then
                        Label4.Text = lcode & " хичээлийн емнех холбооны хичээл vзээгvй байна "
                        Exit Sub
                    End If
                    ii = ii + 1
                    aa(ii) = lcode
                End If
            Next
            If myConnection.State = ConnectionState.Closed Then myConnection.Open()

            loadDataTable()

            '-----------20090825 SONGOLT USTGAHGUI ORUULAH------------
            If Session("songolt") = 1 Then
                sql = " declare @on varchar(9),@uliral int select @on=q5,@uliral=q4 from main "
                sql = sql & " delete from U0362 where U0362AA='" & Session("u1000") & "' and U0362YY=@on and U0362BB=@uliral  "
                'ElseIf Session("songolt") = 2 Then
                'sql = " declare @on varchar(9),@uliral int select @on=q1,@uliral=q2 from main "
                'sql = sql & " delete from U0362 where U0362AA='" & Session("u1000") & "' and U0362YY=@on and U0362BB=@uliral "
                Dim cmd As New SqlCommand(sql, myConnection)
                cmd.ExecuteNonQuery()
            ElseIf Session("songolt") = 2 Then
                Dim objSongolt1 As System.Data.DataRow
                Dim counnt As Integer = 0
                For Each objSongolt1 In datatableTeacher1.Rows
                    For i = 1 To ii
                        If aa(i) = objSongolt1("U0362DD") Then
                            counnt = 1
                            Exit For
                        End If
                    Next
                    If counnt = 0 Then
                        sql = " declare @on varchar(9),@uliral int select @on=q1,@uliral=q2 from main "
                        sql = sql & " delete from U0362 where U0362AA='" & Session("u1000") & "' and U0362YY=@on and U0362BB=@uliral and U0362DD='" & objSongolt1("U0362DD") & "' "
                        Dim cmd1 As New SqlCommand(sql, myConnection)
                        cmd1.ExecuteNonQuery()
                        sql = "delete from NSongolt where studentID='" & Session("u1000") & "' and lessonID='" & objSongolt1("U0362DD") & "' and hyear='" & Session("on") & "' and hsemester='" & Session("ul") & "'"
                        cmd1 = New SqlCommand(sql, myConnection)
                        cmd1.ExecuteNonQuery()
                    End If
                    counnt = 0
                Next
            End If

            ' Dim cmd As SqlDataAdapter

            If Session("songolt") = 1 Then
                For i = 1 To ii
                    sql = " declare @on varchar(9),@uliral int select @on=q5,@uliral=q4 from main "
                    sql = sql & " insert into U0362 values('" & Session("u1000") & "',@uliral,'" & aa(i) & "',null,getdate(),'" & Session("songolt") & "','" & Session("u1000") & "',@on,null,null,null,null) "
                    Dim cmd1 As New SqlCommand(sql, myConnection)
                    cmd1.ExecuteNonQuery()
                Next
            ElseIf Session("songolt") = 2 Then
                'loadDataTable()
                Dim countt As Integer = 0
                Dim objSongolt As System.Data.DataRow
                For i = 1 To ii
                    For Each objSongolt In datatableTeacher1.Rows
                        If aa(i) = objSongolt("U0362DD") Then
                            countt = 1
                            Exit For
                        End If
                    Next
                    If countt = 0 Then
                        sql = " declare @on varchar(9),@uliral int select @on=q1,@uliral=q2 from main "
                        sql = sql & " insert into U0362 values('" & Session("u1000") & "',@uliral,'" & aa(i) & "',null,getdate(),'" & Session("songolt") & "','" & Session("u1000") & "',@on,null,null,null,null) "
                        Dim cmd1 As New SqlCommand(sql, myConnection)
                        cmd1.ExecuteNonQuery()
                    End If
                    countt = 0
                Next
            End If

            myConnection.Close()
            If Session("master") = "D" Then
                Response.Redirect("songolt1.aspx")
            Else
                Response.Redirect("songoltMaster.aspx")
            End If
        Else
            Label4.Text = "Та хичээл сонголт хийх эрхгvй байна."
        End If
    End Sub

    Function checkAchaalal() As Integer
        Dim i, ii, kr As Integer
        ii = 0
        kr = 0
        'Try
        For i = 0 To DataGrid1.Items.Count - 1
            Dim checked As CheckBox = CType(DataGrid1.Items(i).FindControl("CheckBox1"), CheckBox)
            kr = CInt(DataGrid1.Items(i).Cells(3).Text)
            If checked.Checked = True Then
                ii += kr
            End If
        Next
        For i = 0 To Datagrid2.Items.Count - 1
            Dim checked As CheckBox = CType(Datagrid2.Items(i).FindControl("CheckBox2"), CheckBox)
            kr = CInt(Datagrid2.Items(i).Cells(2).Text)
            If checked.Checked = True Then
                ii += kr
            End If
        Next
        For i = 0 To Datagrid3.Items.Count - 1
            Dim checked As CheckBox = CType(Datagrid3.Items(i).FindControl("CheckBox3"), CheckBox)
            kr = CInt(Datagrid3.Items(i).Cells(2).Text)
            If checked.Checked = True Then
                ii += kr
            End If
        Next
        For i = 0 To Datagrid4.Items.Count - 1
            Dim checked As CheckBox = CType(Datagrid4.Items(i).FindControl("CheckBox4"), CheckBox)
            kr = CInt(Datagrid4.Items(i).Cells(2).Text)
            If checked.Checked = True Then
                ii += kr
            End If
        Next
        For i = 0 To Datagrid5.Items.Count - 1
            Dim checked As CheckBox = CType(Datagrid5.Items(i).FindControl("CheckBox5"), CheckBox)
            kr = CInt(Datagrid5.Items(i).Cells(2).Text)
            If checked.Checked = True Then
                ii += kr
            End If
        Next
        For i = 0 To Datagrid6.Items.Count - 1
            Dim checked As CheckBox = CType(Datagrid6.Items(i).FindControl("CheckBox6"), CheckBox)
            kr = CInt(Datagrid6.Items(i).Cells(2).Text)
            If checked.Checked = True Then
                ii += kr
            End If
        Next
        For i = 0 To Datagrid7.Items.Count - 1
            Dim checked As CheckBox = CType(Datagrid7.Items(i).FindControl("CheckBox7"), CheckBox)
            kr = CInt(Datagrid7.Items(i).Cells(2).Text)
            If checked.Checked = True Then
                ii += kr
            End If
        Next
        For i = 0 To Datagrid8.Items.Count - 1
            Dim checked As CheckBox = CType(Datagrid8.Items(i).FindControl("CheckBox8"), CheckBox)
            kr = CInt(Datagrid8.Items(i).Cells(2).Text)
            If checked.Checked = True Then
                ii += kr
            End If
        Next
        For i = 0 To Datagrid9.Items.Count - 1
            Dim checked As CheckBox = CType(Datagrid9.Items(i).FindControl("CheckBox9"), CheckBox)
            kr = CInt(Datagrid9.Items(i).Cells(2).Text)
            If checked.Checked = True Then
                ii += kr
            End If
        Next
        If ii > 21 Then
            Label4.Text = "Хэт их хичээл сонгосон байна. Сонголтоо багасгана уу."
            Label3.Text = "Хэт их хичээл сонгосон байна. Сонголтоо багасгана уу."
            checkAchaalal = 1
        Else
            checkAchaalal = 0
        End If
    End Function
End Class
