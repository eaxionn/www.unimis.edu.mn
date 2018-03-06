Imports System.data
Imports System.data.sqlclient

Partial Class songoltMaster
    Inherits System.Web.UI.Page
    Public sql As String
    Public cnt As Integer
    Public total As Double
    Dim myConnection As New SqlConnection
    'Dim myConnection As SqlConnection = New SqlConnection(ConfigurationSettings.AppSettings("ConnectionString"))

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        myConnection.ConnectionString = ConfigurationManager.AppSettings("ConnectionString")
        Response.Expires = -1
        If Not Page.IsPostBack Then
            If myConnection.State = ConnectionState.Closed Then myConnection.Open()
            Dim cmd = New SqlCommand("select isnull(U021DD,'')U021DD from U021 where U021EE='" & Session("u1000") & "'", myConnection)
            Dim dr As SqlDataReader
            dr = cmd.ExecuteReader()
            If dr.Read() Then
                HyperLink1.NavigateUrl = "st_san.aspx"
            End If
            dr.Close()
            myConnection.Close()

            cnt = 1
            Grid_1()
            Label1.Text = "Хичээл сонголт " & Session("songolt")
        End If
    End Sub
    Sub Grid_1()
        Dim sql As String
        If Session("songolt") = 1 Then
            sql = "select U0362.*,U035DD,U035EE from U0362 " & _
                    " inner join main on q5=U0362YY and q4=U0362BB " & _
                    " inner join U035 on U035CC=U0362DD  " & _
                    " where U0362AA='" & Session("u1000") & "' "
        ElseIf Session("songolt") = 2 Then
            sql = "select U0362.*,U035DD,U035EE from U0362 " & _
                                " inner join main on q1=U0362YY and q2=U0362BB " & _
                                " inner join U035 on U035CC=U0362DD  " & _
                                " where U0362AA='" & Session("u1000") & "' "
        End If
        'If myConnection.State = ConnectionState.Closed Then myConnection.Open()
        If myConnection.State = ConnectionState.Closed Then If myConnection.State = ConnectionState.Closed Then myConnection.Open()
        Dim cmd As SqlDataAdapter
        cmd = New SqlDataAdapter(sql, myConnection)
        Dim rs As DataSet = New DataSet
        cmd.Fill(rs)
        DataGrid1.DataSource = rs
        DataGrid1.DataBind()
        myConnection.Close()
        'Label2.Text = sql
    End Sub
    Sub Increaser(ByVal sender As Object, ByVal e As EventArgs)
        cnt = cnt + 1
    End Sub

    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button3.Click
        Dim i As Integer
        Dim sql1 As String
        If myConnection.State = ConnectionState.Closed Then myConnection.Open()
        For i = 0 To DataGrid1.Items.Count - 1
            Dim checked As CheckBox = CType(DataGrid1.Items(i).FindControl("CheckBox1"), CheckBox)
            Dim lcode As String = DataGrid1.Items(i).Cells(1).Text


            'If checked.Checked = True Then
            '    'sql = "declare @on varchar(9),@uliral int select @on=q1,@uliral=q2 from main " & _
            '    If Session("songolt") = 1 Then
            '        sql1 = " declare @on varchar(9),@uliral int select @on=q5,@uliral=q4 from main " & _
            '        " delete from U0362 where U0362AA='" & Session("u1000") & "' and U0362DD='" & lcode & "' " & _
            '        " and U0362YY=@on and U0362BB=@uliral "
            '    ElseIf Session("songolt") = 2 Then
            '        sql1 = " declare @on varchar(9),@uliral int select @on=q1,@uliral=q2 from main " & _
            '        " delete from U0362 where U0362AA='" & Session("u1000") & "' and U0362DD='" & lcode & "' " & _
            '        " and U0362YY=@on  "
            '    End If


            '    Dim cmd = New SqlCommand(sql1, myConnection)
            '    cmd.ExecuteNonQuery()
            'End If

            'If Session("songolt") = 1 Then
            '    sql1 = " declare @on varchar(9),@uliral int select @on=q5,@uliral=q4 from main " & _
            '        " update U0362 set U0362EE= case when '" & Trim(tcode.SelectedValue) & "'='teacher' then null else '" & Trim(tcode.SelectedValue) & "' end where U0362AA='" & Session("u1000") & "' and U0362DD='" & lcode & "'  " & _
            ' " and U0362YY=@on and U0362BB=@uliral "
            If Session("songolt") = 2 Then
                Dim tcode As DropDownList = CType(DataGrid1.Items(i).FindControl("DropDownList1"), DropDownList)
                '******** songoh oyutnii toonii hyzgaar shalgah *************
                If songohtoo(Trim(tcode.SelectedValue), lcode) = 0 Then
                    Label1.Text = lcode & " хичээл дээр " & tcode.SelectedValue & " багшийг сонгосон оюутны тоо хэтэрсэн байна "
                    Exit Sub
                End If

                sql1 = " declare @on varchar(9),@uliral int select @on=q1,@uliral=2 from main " & _
                    " update U0362 set U0362GG=2,U0362EE= case when '" & Trim(tcode.SelectedValue) & "'='teacher' then null else '" & Trim(tcode.SelectedValue) & "' end " & _
                    " where U0362AA='" & Session("u1000") & "' and U0362DD='" & lcode & "'  " & _
                    " and U0362YY=@on  "
                Dim cmd1 = New SqlCommand(sql1, myConnection)
                cmd1.ExecuteNonQuery()

            End If

            'sql1 = "declare @on varchar(9),@uliral int select @on=q1,@uliral=q2 from main " & _
            'Label1.Text = sql1
        Next
        myConnection.Close()
        Label2.Text = "Хадгалагдлаа"
        cnt = 1
        Call Grid_1()
    End Sub
    Function songohtoo(ByVal tcode As String, ByVal lcode As String) As Integer
        Dim val As Boolean = False
        'If myConnection.State = ConnectionState.Closed Then myConnection.Open()
        If myConnection.State = ConnectionState.Closed Then If myConnection.State = ConnectionState.Closed Then myConnection.Open()
        Dim sql As String = "exec sp_Check_Songolt_Too	'" & tcode & "','" & lcode & "'"
        Dim cmd1 = New SqlCommand(sql, myConnection)
        Dim dr1 As SqlDataReader
        dr1 = cmd1.ExecuteReader()
        If dr1.Read() Then
            songohtoo = dr1(0)
        End If
        dr1.Close()
        'myConnection.Close()
    End Function

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        Response.Redirect("st_dun.aspx")
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Response.Redirect("songolt.aspx")
    End Sub
    Sub Item_Bound1(ByVal sender As Object, ByVal e As DataGridItemEventArgs)
        Select Case e.Item.ItemType
            Case ListItemType.Item, ListItemType.AlternatingItem
                Dim kr As Int16 = CType(e.Item.Cells(4).Text, Int16)
                total += kr
                Dim teachlist As DropDownList = CType(e.Item.FindControl("DropDownList1"), DropDownList)
                If Session("songolt") = 1 Then
                    teachlist.Enabled = False
                    Exit Sub
                End If

                Dim lcode As String = CType(e.Item.Cells(1).Text, String)
                Dim tcode As String = CType(e.Item.Cells(6).Text, String)
                Dim index As Int16 = 0
                Dim ii As Integer = 1
                Dim comm1 As New SqlCommand("Select rtrim(U0351BB)U0351BB,U41II+'/'+U0351BB+'/'tname from U0351 inner join U41 on U41EE=U0351BB where U0351AA='" & lcode & "' order by U0351BB", myConnection)
                Dim dr1 As SqlDataReader = comm1.ExecuteReader()
                'With teachlist
                '    .DataSource = dr1
                '    .DataTextField = "tname"
                '    .DataValueField = "U0351BB"
                '    .DataBind()
                '    .SelectedValue = tcode
                'End With


                With teachlist
                    .Items.Add(New ListItem("сонго ...", "teacher"))
                    While dr1.Read
                        .Items.Add(New ListItem(dr1("tname"), Trim(dr1("U0351BB"))))
                        If Left(tcode, 6) = Trim(dr1("U0351BB")) Then
                            index = ii
                            'Label2.Text += "<br>" & cnt & ":<b>" & ii & "-" & RTrim(LTrim(tcode)) & "/" & tcode.Length & ":" & Trim(dr1("U0351BB")) & "</b>"
                        Else
                            'Label2.Text += "<br>" & cnt & ":" & ii & "-" & RTrim(LTrim(tcode)) & "/" & tcode.Length & ":" & Trim(dr1("U0351BB"))
                        End If
                        ii = ii + 1
                    End While
                    dr1.Close()
                    .SelectedIndex = index
                End With


            Case ListItemType.Footer
                e.Item.Cells(3).Text = "Нийт: "
                e.Item.Cells(3).HorizontalAlign = HorizontalAlign.Right
                e.Item.Cells(4).Text = "<b><font color='#CC0000'>" & total & "</font></b>"
        End Select
    End Sub

    Protected Sub Button4_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button4.Click
        Dim i As Integer
        Dim sql1 As String
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
                    sql1 = " declare @on varchar(9),@uliral int select @on=q1,@uliral=q2 from main " & _
                    " delete from U0362 where U0362AA='" & Session("u1000") & "' and U0362DD='" & lcode & "' " & _
                    " and U0362YY=@on  "
                End If
                Dim cmd = New SqlCommand(sql1, myConnection)
                cmd.ExecuteNonQuery()
            End If
        Next
        myConnection.Close()
        Label2.Text = "Хасагдлаа"
        cnt = 1
        Call Grid_1()
    End Sub
End Class
