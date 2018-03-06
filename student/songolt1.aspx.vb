Imports System.data
Imports System.data.sqlclient
Imports System.Web.Security
'Imports student.Module1

Partial Class songolt1
    Inherits System.Web.UI.Page
    Dim myConnection As New SqlConnection
    Public sql As String
    Public total As Double
    Public cnt As Integer

    Dim dsGroup As DataTable
    Dim sqlCommand As SqlCommand
    Dim daGroup As SqlDataAdapter
    Dim dsItem As DataTable
    Dim daItem As SqlDataAdapter

    Dim lk1 As Integer = 0
    Dim sm1 As Integer = 0
    Dim lb1 As Integer = 0
    Dim bd1 As Integer = 0

    Dim aaaa As Integer = 0

    Dim loadDropDown As Int16 = 0
    'Dim gadaadhel As Int16 = 0

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        myConnection.ConnectionString = ConfigurationManager.AppSettings("ConnectionString")
        'System.Threading.Thread.Sleep(3000)
        'Try
        If Session("songolt") = 2 Then
            print1.Enabled = True
            Button3.Enabled = True
        End If
        Response.Expires = -1

        If Not IsPostBack Then
            aaaa = 1
            cnt = 1
            Try
                If myConnection.State = ConnectionState.Closed Then myConnection.Open()
                loadGrid()
                HyperLink1.NavigateUrl = "st_san.aspx"
                Label1.Text = "Хичээл сонголт " & Session("songolt")
            Catch ex As Exception
                '
            Finally
                myConnection.Close()
            End Try
        End If
    End Sub
    Sub songoltHaah()
        If myConnection.State = ConnectionState.Closed Then myConnection.Open()
        Dim sss As String = "select count(*) from U0362 " & _
        "left join NSongolt on U0362AA=studentID AND U0362DD=lessonID and U0362EE=teacherID " & _
        "where studentID='" & Session("u1000") & "'"
        Dim cmd1 = New SqlCommand(sss, myConnection)
        Dim dr1 As SqlDataReader
        dr1 = cmd1.ExecuteReader()
        Dim sonLen As Int16 = 0
        If dr1.Read() Then
            sonLen = CInt(dr1(0))
        End If
        If sonLen > 3 Then
            Button3.Enabled = False
        Else
            Button3.Enabled = True
        End If
        dr1.Close()
        'myConnection.Close()
    End Sub
    Sub loadGrid()
        'Try
        Dim sql As String = ""
        If Session("songolt") = 1 Then
            sql = "select U0362.*,U035DD,U035EE,U035CC,U035GG,U035HH,U035II" & _
            ",isnull(U0362KK,0) as a,isnull(U0362LL,0) as b,isnull(U0362MM,0) as c,isnull(U0362NN,0) as d from U0362 " & _
            " inner join main on q5=U0362YY and q4=U0362BB " & _
            " inner join U035 on U035CC=U0362DD  " & _
            " where U0362AA='" & Session("u1000") & "' "
        ElseIf Session("songolt") = 2 Then
            sql = "select U0362.*,U035DD,U035EE,U035CC,U035GG,U035HH,U035II" & _
            ",isnull(U0362KK,1001) as a,isnull(U0362LL,1001) as b,isnull(U0362MM,1001) as c,isnull(U0362NN,1001) as d from U0362 " & _
            " inner join main on q1=U0362YY and q2=U0362BB " & _
            " inner join U035 on U035CC=U0362DD  " & _
            " where U0362AA='" & Session("u1000") & "' "
        End If
        If myConnection.State = ConnectionState.Closed Then myConnection.Open()
        dsGroup = New DataTable
        daGroup = New SqlDataAdapter(sql, myConnection)
        daGroup.Fill(dsGroup)
        DataGrid1.DataSource = dsGroup
        DataGrid1.DataBind()
        'Catch ex As Exception
        'Response.Redirect("error.htm")
        'End Try
        'myConnection.Close()
    End Sub
    Sub Increaser(ByVal sender As Object, ByVal e As EventArgs)
        cnt = cnt + 1
    End Sub

    Function songohtoo(ByVal tcode As String, ByVal lcode As String, ByVal idd As String, ByVal timeid As Integer) As Integer
        'Dim val As Boolean = False
        'If myConnection.State = ConnectionState.Closed Then myConnection.Open()
        'Dim sql As String = "exec sp_Check_Songolt_Too1	'" & tcode & "','" & lcode & "','" & idd & "'," & timeid
        Dim sql As String = ""
        Dim cnt1, cnt2 As Integer
        cnt1 = 0
        cnt2 = 0
        sql = "select count(*) from U0362 " & _
        "where U0362YY='" & Session("on") & "' and U0362BB='" & Session("ul") & "' and U0362DD='" & lcode & "' " & _
        "and U0362AA<>'" & Session("u1000") & "' and U0362GG=2 "
        If timeid = 1 Then
            sql = sql + " and U0362EE='" & tcode & "' and U0362KK=" & idd
        ElseIf timeid = 2 Then
            sql = sql + " and  U0362LL=" & idd
        ElseIf timeid = 3 Then
            sql = sql + " and  U0362MM=" & idd
        End If
        If myConnection.State = ConnectionState.Closed Then myConnection.Open()
        Dim cmd1 = New SqlCommand(sql, myConnection)
        Dim dr1 As SqlDataReader
        dr1 = cmd1.ExecuteReader()
        If dr1.Read() Then
            cnt1 = CInt(dr1(0))
        End If
        dr1.Close()
        'myConnection.Close()
        
        sql = "select STUDENT_NUM from NTIMETABLE " & _
        " where LYEAR='" & Session("on") & "' and SEMESTER='" & Session("ul") & "' and LESSON_KOD='" & lcode & "' and id=" & idd
        'If myConnection.State = ConnectionState.Closed Then myConnection.Open()
        cmd1 = New SqlCommand(sql, myConnection)
        dr1 = cmd1.ExecuteReader()
        If dr1.Read() Then
            cnt2 = CInt(dr1(0))
        End If
        dr1.Close()
        myConnection.Close()
        If cnt1 < cnt2 Then
            songohtoo = 1
        Else
            songohtoo = 0
        End If
        'myConnection.Close()
    End Function

    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button3.Click
        Try
            loadDropDown = 1
            Label2.Text = ""
            Dim i As Integer
            Dim sql1 As String
            Dim errorLesson As String = ""
            Dim errorLesson2 As String = ""
            For i = 0 To DataGrid1.Items.Count - 1
                Dim checked As CheckBox = CType(DataGrid1.Items(i).FindControl("CheckBox1"), CheckBox)
                Dim lcode As String = DataGrid1.Items(i).Cells(1).Text

                If Session("songolt") = 2 Then
                    Dim tcode As DropDownList = CType(DataGrid1.Items(i).FindControl("DropDownList1"), DropDownList)
                    Dim ddl1 As DropDownList = CType(DataGrid1.Items(i).FindControl("DropDownList2"), DropDownList)
                    Dim ddl2 As DropDownList = CType(DataGrid1.Items(i).FindControl("DropDownList3"), DropDownList)
                    Dim ddl3 As DropDownList = CType(DataGrid1.Items(i).FindControl("DropDownList4"), DropDownList)

                    '-------------- hicheel shalgah(dadlaga,tusul) ---------------
                    Dim sss As String = "SELECT U0322FF FROM U021 LEFT JOIN U0322 ON U021DD=U0322CC " & _
                    "WHERE U0322DD='" & lcode & "' AND U021EE='" & Session("u1000") & "' AND U0322AA=LEFT('" & Session("u1000") & "',1) and U0322CC=U021DD AND U0322FF IN ('C','D')"
                    If myConnection.State = ConnectionState.Closed Then myConnection.Open()
                    Dim cmdd1 = New SqlCommand(sss, myConnection)
                    Dim drr1 As SqlDataReader
                    drr1 = cmdd1.ExecuteReader()
                    Dim kk As String = ""
                    If drr1.Read Then
                        kk = Trim(IIf(Not IsDBNull(drr1("U0322FF")), drr1("U0322FF"), ""))
                    End If
                    drr1.Close()
                    'myConnection.Close()
                    If kk.Trim = "" Then
                        If tcode.SelectedValue = "teacher" Then
                            Label2.Text += lcode + " хичээл дээр багшаа сонгоно уу. <br/>"
                            'Exit Sub
                            errorLesson = lcode
                        End If
                        If ddl1.SelectedValue = "0" And ddl1.Enabled = True Then
                            Label2.Text += lcode + " хичээлийн лекцийн цагаа сонгоно уу.<br/>"
                            'Exit Sub
                            errorLesson = lcode
                        End If
                        If ddl2.SelectedValue = "0" And ddl2.Enabled = True Then
                            Label2.Text += lcode + " хичээлийн семинарын цагаа сонгоно уу.</br>"
                            'Exit Sub
                            errorLesson = lcode
                        End If
                        If ddl3.SelectedValue = "0" And ddl3.Enabled = True Then
                            Label2.Text += lcode + " хичээлийн лабораторийн цагаа сонгоно уу.<br/>"
                            'Exit Sub
                            errorLesson = lcode
                        End If

                        '----------------- songoh oyutnii toonii hyazgaar shalgah ------------------
                        If ddl1.Enabled = True And errorLesson.Trim = "" Then
                            If songohtoo(tcode.SelectedValue, lcode, ddl1.SelectedValue, 1) = 0 Then
                                Label2.Text += lcode + " лекцийн танхим дvvрсэн байна. бусад цаг сонгоно уу.<br/>"
                                errorLesson = lcode
                            End If
                        End If
                        If ddl2.Enabled = True And errorLesson.Trim = "" Then
                            If songohtoo(tcode.SelectedValue, lcode, ddl2.SelectedValue, 2) = 0 Then
                                Label2.Text += lcode + " семинарын танхим дvvрсэн байна. бусад цаг сонгоно уу.<br/>"
                                errorLesson = lcode
                            End If
                        End If
                        If ddl3.Enabled = True And errorLesson.Trim = "" Then
                            If songohtoo(tcode.SelectedValue, lcode, ddl3.SelectedValue, 3) = 0 Then
                                Label2.Text += lcode + " лаборатори дvvрсэн байна. бусад цаг сонгоно уу.<br/>"
                                errorLesson = lcode
                            End If
                        End If
                    Else
                        ddl1.Enabled = False
                        ddl2.Enabled = False
                        ddl3.Enabled = False
                    End If

                    If errorLesson.Trim = "" Then
                        If myConnection.State = ConnectionState.Closed Then myConnection.Open()
                        'check huviar davhtsal 
                        Dim q1 As String
                        Dim check1 As Integer
                        q1 = "exec check_student_huv_davh1 '" & Session("u1000") & "','" & lcode & "'," & ddl1.SelectedValue & "," & ddl2.SelectedValue & "," & ddl3.SelectedValue & ",'" & Session("on") & "'," & Session("ul")
                        cmdd1 = New SqlCommand(q1, myConnection)
                        drr1 = cmdd1.ExecuteReader()
                        If drr1.Read() Then
                            check1 = CInt(drr1(0))
                        Else : check1 = 0
                        End If
                        drr1.Close()
                        If check1 = 0 Then
                            sql1 = " update U0362 set U0362GG=2,U0362EE= case when '" & Trim(tcode.SelectedValue) & "'='teacher' then null else '" & Trim(tcode.SelectedValue) & "' end " & _
                            ",U0362KK=" & ddl1.SelectedValue & ",U0362LL=" & ddl2.SelectedValue & ",U0362MM=" & ddl3.SelectedValue & _
                            " where U0362AA='" & Session("u1000") & "' and U0362DD='" & lcode & "'  " & _
                            " and U0362YY='" & Session("on") & "' and U0362BB='" & Session("ul") & "'"
                            cmdd1 = New SqlCommand(sql1, myConnection)
                            cmdd1.ExecuteNonQuery()
                        Else
                            errorLesson2 = lcode + " хичээлийн хуваарь давхардаж байна.<br/>"
                        End If

                        'myConnection.Close()
                    End If
                    Label2.Text += "<BR/>" + errorLesson2
                End If
                errorLesson = ""
            Next
            'myConnection.Close()
            Label4.Text = "<br/><br/>Хадгалагдлаа"
        Catch ex As Exception
            '
        Finally
            myConnection.Close()
        End Try
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        Response.Redirect("st_dun.aspx")
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Response.Redirect("songolt.aspx")
    End Sub

    Protected Sub Button4_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button4.Click
        Try
            Dim i As Integer
            Dim sql1 As String = ""
            If myConnection.State = ConnectionState.Closed Then myConnection.Open()
            For i = 0 To DataGrid1.Items.Count - 1
                Dim checked As CheckBox = CType(DataGrid1.Items(i).FindControl("CheckBox1"), CheckBox)
                Dim lcode As String = DataGrid1.Items(i).Cells(1).Text
                If checked.Checked = True Then
                    If Session("songolt") = 1 Then
                        sql1 = " declare @on varchar(9),@uliral int select @on=q5,@uliral=q4 from main " & _
                        " delete from U0362 where U0362AA='" & Session("u1000") & "' and U0362DD='" & lcode & "' " & _
                        " and U0362YY=@on and U0362BB=@uliral "
                    ElseIf Session("songolt") = 2 Then
                        sql1 = " delete from U0362 where U0362AA='" & Session("u1000") & "' and U0362DD='" & lcode & "' " & _
                        " and U0362YY='" & Session("on") & "'  and U0362BB='" & Session("ul") & "' "
                    End If
                    'If myConnection.State = ConnectionState.Closed Then myConnection.Open()
                    Dim cmd = New SqlCommand(sql1, myConnection)
                    cmd.ExecuteNonQuery()
                    'myConnection.Close()
                End If
            Next
            'myConnection.Close()
            Label2.Text = "Хасагдлаа"
            Response.Redirect("songolt1.aspx")
            'cnt = 1
            'loadGrid()
        Catch ex As Exception
            'Response.Redirect("error.htm")
        Finally
            myConnection.Close()
        End Try
    End Sub
    
    Protected Sub DataGrid1_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataGridItemEventArgs) Handles DataGrid1.ItemDataBound
        Dim dr As DataRowView = CType(e.Item.DataItem, DataRowView)
        If ((e.Item.ItemType = ListItemType.Item) OrElse (e.Item.ItemType = ListItemType.AlternatingItem)) Then
            Dim listGroup As DropDownList = CType(e.Item.FindControl("DropDownList1"), DropDownList)
            Dim ddl1 As DropDownList = CType(e.Item.FindControl("DropDownList2"), DropDownList)
            Dim ddl2 As DropDownList = CType(e.Item.FindControl("DropDownList3"), DropDownList)
            Dim ddl3 As DropDownList = CType(e.Item.FindControl("DropDownList4"), DropDownList)
            Dim lcode As String = CType(e.Item.Cells(1).Text, String)
            Dim tcode As String = CType(e.Item.Cells(2).Text, String) '12
            Dim lekts1 As String = CType(e.Item.Cells(3).Text, String) '13
            Dim seminar1 As String = CType(e.Item.Cells(4).Text, String) '14
            Dim lab1 As String = CType(e.Item.Cells(5).Text, String) '15
            Dim kr1 As String = CType(e.Item.Cells(15).Text, String) '10
            
            Dim kr As Int16 = CInt(kr1)
            total += kr
            If Session("songolt") = 1 Then
                listGroup.Enabled = False
                ddl1.Enabled = False
                ddl2.Enabled = False
                ddl3.Enabled = False
                Exit Sub
            End If
            dsGroup = New DataTable
            If myConnection.State = ConnectionState.Closed Then myConnection.Open()
            'nTimeTableLoadTeacher
            Dim aa As String = "exec nTimeTableLoadTeacher '" & Session("on") & "'," & Session("ul") & ",'" & lcode & "'," & lekts1 & "," & seminar1 & "," & lab1
            Dim index As Int16 = 0
            Dim ii As Integer = 1
            Dim cmd1 = New SqlCommand(aa, myConnection)
            Dim dr1 As SqlDataReader
            dr1 = cmd1.ExecuteReader()
            With listGroup
                .Items.Add(New ListItem("сонго ...", "teacher"))
                While dr1.Read
                    .Items.Add(New ListItem(IIf(Not IsDBNull(dr1("tname")), dr1("tname"), "a"), Trim(IIf(Not IsDBNull(dr1("U0351BB")), dr1("U0351BB"), "a"))))
                    If tcode = Trim(IIf(Not IsDBNull(dr1("U0351BB")), dr1("U0351BB"), "a")) Then
                        index = ii
                    End If
                    ii = ii + 1
                End While
                dr1.Close()
                .SelectedIndex = index
            End With
            dr1.Close()

            If Val(lekts1) = 0 Then
                ddl1.Enabled = False
            End If
            If Val(seminar1) = 0 Then
                ddl2.Enabled = False
            End If
            If Val(lab1) = 0 Then
                ddl3.Enabled = False
            End If

            loadDropDown = 1
        End If
        Select Case e.Item.ItemType
            Case ListItemType.Footer
                e.Item.Cells(3).Text = "Нийт: "
                e.Item.Cells(3).HorizontalAlign = HorizontalAlign.Right
                e.Item.Cells(4).Text = "<b><font color='#CC0000'>" & total & "</font></b>"
        End Select
    End Sub

    Protected Sub ddlGroup_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs)
        loadDropDown = 5
        loadd(sender, e, 1, "DropDownList2")
        loadd(sender, e, 2, "DropDownList3")
        loadd(sender, e, 3, "DropDownList4")
    End Sub

    Protected Sub lk_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs)
        loadDropDown = 5
        'loadd(sender, e,  1, "DropDownList2")
        loadd(sender, e, 2, "DropDownList3")
        loadd(sender, e, 3, "DropDownList4")
    End Sub

    Protected Sub ddlGroup_load(ByVal sender As Object, ByVal e As EventArgs)
        If loadDropDown = 1 Then
            loadd1(sender, e, 1, "DropDownList2")
            loadd1(sender, e, 2, "DropDownList3")
            loadd1(sender, e, 3, "DropDownList4")
        End If
    End Sub

    Sub loadd(ByVal sender As Object, ByVal e As EventArgs, ByVal dd As Integer, ByVal dropdown As String)
        'Try
        Dim ddllist As DropDownList = CType(sender, DropDownList)
        Dim cell As TableCell = CType(ddllist.Parent, TableCell)
        Dim item As DataGridItem = CType(cell.Parent, DataGridItem)
        Dim content As String = item.Cells(0).Text
        Dim ddlType As DropDownList = CType(item.Cells(0).FindControl("DropDownList1"), DropDownList)
        Dim lcode As String = CType(item.Cells(1).Text, String)
        Dim lekts1 As String = CType(item.Cells(3).Text, String) '13
        Dim seminar1 As String = CType(item.Cells(4).Text, String) '14
        Dim lab1 As String = CType(item.Cells(5).Text, String) '15
        Dim krr As String = CType(item.Cells(15).Text, String) '10
        Dim ddlItem As DropDownList = CType(item.Cells(1).FindControl(dropdown), DropDownList)

        Dim ddl1 As DropDownList = CType(item.Cells(12).FindControl("DropDownList2"), DropDownList)
        Dim ddl2 As DropDownList = CType(item.Cells(13).FindControl("DropDownList3"), DropDownList)
        Dim ddl3 As DropDownList = CType(item.Cells(14).FindControl("DropDownList4"), DropDownList)

        If Session("songolt") = 1 Then
            ddlItem.Enabled = False
            Exit Sub
        End If
        Dim index As Int16 = 0
        Dim ii As Integer = 1
        ddlItem.Items.Clear()
        With ddlItem
            .Items.Add(New ListItem("сонго ...", "0"))
        End With

        If ddlItem.Enabled = True Then

            ddlItem.Items.Clear()
            With ddlItem
                .Items.Add(New ListItem("сонго ...", "0"))
            End With

            If myConnection.State = ConnectionState.Closed Then myConnection.Open()
            Dim qq As String
            If dd = 1 Then
                qq = "exec nTimeTableLoad1 '" & lcode & "','" & ddlType.SelectedValue & "'," & dd
                Dim cmd1 = New SqlCommand(qq, myConnection)
                Dim dr1 As SqlDataReader
                dr1 = cmd1.ExecuteReader()
                With ddlItem
                    While dr1.Read
                        .Items.Add(New ListItem(dr1(2), dr1(0)))
                    End While
                    dr1.Close()
                End With

            ElseIf dd = 2 Then
                If ddl1.Enabled = True Then
                    qq = "exec nTimeTableLoad2 '" & lcode & "','" & ddlType.SelectedValue & "'," & dd & "," & ddl1.SelectedValue
                Else
                    qq = "exec nTimeTableLoad1 '" & lcode & "','" & ddlType.SelectedValue & "'," & dd
                End If
                Dim cmd1 = New SqlCommand(qq, myConnection)
                Dim dr1 As SqlDataReader
                dr1 = cmd1.ExecuteReader()

                With ddlItem
                    While dr1.Read
                        .Items.Add(New ListItem(dr1(2), dr1(0)))
                    End While
                    dr1.Close()
                End With

            ElseIf dd = 3 Then
                If ddl1.Enabled = True Then
                    qq = "exec nTimeTableLoad2 '" & lcode & "','" & ddlType.SelectedValue & "'," & dd & "," & ddl1.SelectedValue
                Else
                    qq = "exec nTimeTableLoad1 '" & lcode & "','" & ddlType.SelectedValue & "'," & dd
                End If
                Dim cmd1 = New SqlCommand(qq, myConnection)
                Dim dr1 As SqlDataReader
                dr1 = cmd1.ExecuteReader()

                With ddlItem
                    While dr1.Read
                        .Items.Add(New ListItem(dr1(2), dr1(0)))
                    End While
                    dr1.Close()
                End With
            End If
            'myConnection.Close()

        End If
    End Sub

    Sub loadd1(ByVal sender As Object, ByVal e As EventArgs, ByVal dd As Integer, ByVal dropdown As String)
        'Try
        Dim ddllist As DropDownList = CType(sender, DropDownList)
        Dim cell As TableCell = CType(ddllist.Parent, TableCell)
        Dim item As DataGridItem = CType(cell.Parent, DataGridItem)
        Dim content As String = item.Cells(0).Text
        Dim ddlType As DropDownList = CType(item.Cells(0).FindControl("DropDownList1"), DropDownList)
        Dim lcode As String = CType(item.Cells(1).Text, String)
        Dim lekts1 As String = CType(item.Cells(3).Text, String) '13
        Dim seminar1 As String = CType(item.Cells(4).Text, String) '14
        Dim lab1 As String = CType(item.Cells(5).Text, String) '15
        Dim krr As String = CType(item.Cells(15).Text, String) '10
        Dim ddlItem As DropDownList = CType(item.Cells(1).FindControl(dropdown), DropDownList)

        Dim ddl1 As DropDownList = CType(item.Cells(12).FindControl("DropDownList2"), DropDownList)
        Dim ddl2 As DropDownList = CType(item.Cells(13).FindControl("DropDownList3"), DropDownList)
        Dim ddl3 As DropDownList = CType(item.Cells(14).FindControl("DropDownList4"), DropDownList)

        Dim son_lk1 As String = CType(item.Cells(6).Text, String)
        Dim son_sm1 As String = CType(item.Cells(7).Text, String)
        Dim son_lb1 As String = CType(item.Cells(8).Text, String)
        Dim son_bd1 As String = CType(item.Cells(9).Text, String)

        If Session("songolt") = 1 Then
            ddlItem.Enabled = False
            Exit Sub
        End If
        Dim index As Int16 = 0
        Dim ii As Integer = 1
        ddlItem.Items.Clear()
        With ddlItem
            .Items.Add(New ListItem("сонго ...", "0"))
        End With

        If ddlItem.Enabled = True Then

            ddlItem.Items.Clear()
            With ddlItem
                .Items.Add(New ListItem("сонго ...", "0"))
            End With

            If myConnection.State = ConnectionState.Closed Then myConnection.Open()
            Dim qq As String
            If dd = 1 Then
                qq = "exec nTimeTableLoad1 '" & lcode & "','" & ddlType.SelectedValue & "'," & dd
                Dim cmd1 = New SqlCommand(qq, myConnection)
                Dim dr1 As SqlDataReader
                dr1 = cmd1.ExecuteReader()
                With ddlItem
                    While dr1.Read
                        .Items.Add(New ListItem(dr1(2), dr1(0)))
                        If Val(son_lk1) = IIf(Not IsDBNull(dr1(0)), dr1(0), "0") Then
                            index = ii
                        End If
                        ii += 1
                    End While
                    dr1.Close()
                    .SelectedIndex = index
                End With

            ElseIf dd = 2 Then
                If ddl1.Enabled = True Then
                    qq = "exec nTimeTableLoad2 '" & lcode & "','" & ddlType.SelectedValue & "'," & dd & "," & ddl1.SelectedValue
                Else
                    qq = "exec nTimeTableLoad1 '" & lcode & "','" & ddlType.SelectedValue & "'," & dd
                End If
                Dim cmd1 = New SqlCommand(qq, myConnection)
                Dim dr1 As SqlDataReader
                dr1 = cmd1.ExecuteReader()

                With ddlItem
                    While dr1.Read
                        .Items.Add(New ListItem(dr1(2), dr1(0)))
                        If Val(son_sm1) = IIf(Not IsDBNull(dr1(0)), dr1(0), "0") Then
                            index = ii
                        End If
                        ii += 1
                    End While
                    dr1.Close()
                    .SelectedIndex = index
                End With

            ElseIf dd = 3 Then
                If ddl1.Enabled = True Then
                    qq = "exec nTimeTableLoad2 '" & lcode & "','" & ddlType.SelectedValue & "'," & dd & "," & ddl1.SelectedValue
                Else
                    qq = "exec nTimeTableLoad1 '" & lcode & "','" & ddlType.SelectedValue & "'," & dd
                End If
                Dim cmd1 = New SqlCommand(qq, myConnection)
                Dim dr1 As SqlDataReader
                dr1 = cmd1.ExecuteReader()

                With ddlItem
                    While dr1.Read
                        .Items.Add(New ListItem(dr1(2), dr1(0)))
                        If Val(son_lb1) = IIf(Not IsDBNull(dr1(0)), dr1(0), "0") Then
                            index = ii
                        End If
                        ii += 1
                    End While
                    dr1.Close()
                    .SelectedIndex = index
                End With
               
            End If
            'myConnection.Close()

        End If

    End Sub
    
    Protected Sub print1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles print1.Click
        Response.Redirect("hhuvaari.aspx")
    End Sub

End Class
