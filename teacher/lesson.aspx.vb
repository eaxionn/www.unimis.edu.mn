Imports System.data
Imports System.data.sqlclient


Namespace teacher

    Partial Class lesson
        Inherits System.Web.UI.Page
#Region " Web Form Designer Generated Code "

        'This call is required by the Web Form Designer.
        <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

        End Sub


        Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
            'CODEGEN: This method call is required by the Web Form Designer
            'Do not modify it using the code editor.
            InitializeComponent()
        End Sub

#End Region
        Dim myConnection As New SqlConnection
        Public cnt As Integer = 0

        Function zuser(ByVal usr As String, ByVal pwd As String) As Boolean
            'myConnection.ConnectionString = ConfigurationManager.AppSettings("ConnectionString")
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
            myConnection.ConnectionString = ConfigurationManager.AppSettings("ConnectionString")
            If Not zuser(Session("tcode"), Session("tpsss")) Then
                Response.Redirect("login.aspx")
            Else
                If Not Page.IsPostBack Then
                    Dim val1 As Integer = 0
                    Dim val2 As Integer = 0
                    'Session("lessName") = Request("ln") 'Mid(Request("lesscode"), 9, Len(Request("lessoncode")))
                    Hyperlink1.Text = Request("lesscode")
                    'Hyperlink2.NavigateUrl = "songolt.aspx?type=1&lesscode=" & Request("lesscode")
                    'Hyperlink3.NavigateUrl = "songolt.aspx?type=2&lesscode=" & Request("lesscode")

                    'Hyperlink5.NavigateUrl = "result.aspx?type=1&lesscode=" & Request("lesscode")
                    'Hyperlink6.NavigateUrl = "result.aspx?type=2&lesscode=" & Request("lesscode")
                    'Hyperlink7.NavigateUrl = "result.aspx?type=0&lesscode=" & Request("lesscode")
                    Hyperlink7.NavigateUrl = "Standart.aspx?lesscode=" & Request("lesscode")
                    Hyperlink8.NavigateUrl = "result2.aspx?lesscode=" & Request("lesscode")
                    If myConnection.State = ConnectionState.Closed Then myConnection.Open()
                    Dim cmd = New SqlCommand("select * from U0367 where U0367BB=@lesscode and U0367CC=@tid ", myConnection)
                    cmd.Parameters.Add(New SqlParameter("@tid", SqlDbType.VarChar, 25))
                    cmd.Parameters("@tid").Value = Session("tcode")
                    cmd.Parameters.Add(New SqlParameter("@lesscode", SqlDbType.VarChar, 25))
                    cmd.Parameters("@lesscode").Value = Request("lesscode")
                    Dim dr As SqlDataReader
                    dr = cmd.ExecuteReader()
                    If dr.Read() Then
                        'Hyperlink2.Visible = true
                        'Hyperlink5.Visible = true
                        'DropDownList1.Visible = true
                        val1 = 1
                    End If
                    dr.Close()
                    cmd = New SqlCommand("select * from U0367A where U0367BB=@lesscode and U0367CC=@tid ", myConnection)
                    cmd.Parameters.Add(New SqlParameter("@tid", SqlDbType.VarChar, 25))
                    cmd.Parameters("@tid").Value = Session("tcode")
                    cmd.Parameters.Add(New SqlParameter("@lesscode", SqlDbType.VarChar, 25))
                    cmd.Parameters("@lesscode").Value = Request("lesscode")
                    dr = cmd.ExecuteReader()
                    If dr.Read() Then
                        'Hyperlink3.Visible = true
                        'Hyperlink6.Visible = true
                        'DropDownList2.Visible = true
                        val2 = 1
                    End If
                    myConnection.Close()

                    'If val1 = 1 Then labsem1()
                    'If val2 = 1 Then labsem2()

                    If val1 = 0 And val2 = 0 Then
                        'Hyperlink4.Visible = true
                        'Hyperlink7.Visible = true
                        'Hyperlink4.NavigateUrl = "songolt.aspx?type=0&lesscode=" & Request("lesscode")
                    End If
                    '************** temdegleliin dugneh helber *********
                    cnt = 1
                    Call Datagrid()
                    Call Dugnehhelber()
                    TextBox1.Text = Format(Now, "yyyy-MM-dd")
                    ognoo1.Text = Format(Now, "yyyy-MM-dd")
                    ognoo2.Text = Format(Now.AddMonths(1), "yyyy-MM-dd")
                End If
            End If
        End Sub
        Sub labsem1()
            Dim i As Integer
            Dim sql As String
            If myConnection.State = ConnectionState.Closed Then myConnection.Open()
            sql = "select * from U0367 where U0367BB=@lesscode and U0367CC='" & Session("tcode") & "'"
            Dim cmd = New SqlCommand(sql, myConnection)
            cmd.Parameters.Add(New SqlParameter("@lesscode", SqlDbType.VarChar, 25))
            cmd.Parameters("@lesscode").Value = Request("lesscode")
            Dim dr = cmd.ExecuteReader()
            If dr.Read() Then
                DropDownList1.Items.Clear()
                DropDownList1.Items.Add(New ListItem("грvп сонго . .", 0))
                For i = 1 To dr("U0367EE")
                    DropDownList1.Items.Add(New ListItem("сем-н " & i & "-р грvп", i))
                Next
            End If
            myConnection.Close()
        End Sub
        Sub labsem2()
            Dim i As Integer
            Dim sql As String
            If myConnection.State = ConnectionState.Closed Then myConnection.Open()
            sql = "select * from U0367A where U0367BB=@lesscode and U0367CC='" & Session("tcode") & "'"
            Dim cmd = New SqlCommand(sql, myConnection)
            cmd.Parameters.Add(New SqlParameter("@lesscode", SqlDbType.VarChar, 25))
            cmd.Parameters("@lesscode").Value = Request("lesscode")
            Dim dr = cmd.ExecuteReader()
            If dr.Read() Then
                DropDownList2.Items.Clear()
                DropDownList2.Items.Add(New ListItem("грvп сонго . .", 0))
                For i = 1 To dr("U0367EE")
                    DropDownList2.Items.Add(New ListItem("лаб-н " & i & "-р грvп", i))
                Next
            End If
            myConnection.Close()
        End Sub
        Private Sub DropDownList1_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles DropDownList1.SelectedIndexChanged
            If DropDownList1.SelectedValue <> 0 Then
                'Hyperlink1.Text = DropDownList1.SelectedValue
                Response.Redirect("result.aspx?type=1&gr=" & DropDownList1.SelectedValue & "&lesscode=" & Request("lesscode"))
            End If
        End Sub
        Private Sub DropDownList2_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles DropDownList1.SelectedIndexChanged, DropDownList2.SelectedIndexChanged
            If DropDownList2.SelectedValue <> 0 Then
                'Hyperlink1.Text = DropDownList2.SelectedValue
                Response.Redirect("result.aspx?type=2&gr=" & DropDownList2.SelectedValue & "&lesscode=" & Request("lesscode"))
            End If
        End Sub
        Sub Dugnehhelber()
            If myConnection.State = ConnectionState.Closed Then myConnection.Open()
            Dim comm As New SqlCommand("select * from lesstype", myConnection)
            Dim dr As SqlDataReader = comm.ExecuteReader()
            With DropDownList3
                .DataSource = dr
                .DataTextField = "lessname"
                .DataValueField = "id"
                .DataBind()
            End With
            myConnection.Close()
        End Sub
        Sub Increaser(ByVal sender As Object, ByVal e As EventArgs)
            cnt = cnt + 1
        End Sub
        Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
            Dim strUpdateStmt As String
            If tolov.Text = 0 Then
                strUpdateStmt = "declare @on varchar(10),@uliral smallint select @on=q1,@uliral=q2 from main " & _
                " insert into temdeglel (ognoo,too,sedev,ltype,tsag,tcode,lesscode,jil,uliral) values('" & Replace(TextBox1.Text, "'", "") & "'," & TextBox2.Text & ",N'" & Replace(TextBox4.Text, "'", "") & "'," & DropDownList3.SelectedValue & "," & TextBox3.Text & ",'" & Session("tcode") & "','" & Request("lesscode") & "',@on,@uliral)"
            Else
                strUpdateStmt = "update temdeglel set ltype=" & DropDownList3.SelectedValue & ",ognoo='" & TextBox1.Text & "',too='" & TextBox2.Text & "',tsag='" & TextBox3.Text & "',sedev='" & TextBox4.Text.Replace("'", "''") & "' where num=" & tolov.Text
            End If
            If myConnection.State = ConnectionState.Closed Then myConnection.Open()
            Dim cmd = New SqlCommand(strUpdateStmt, myConnection)
            cmd.ExecuteNonQuery()
            myConnection.Close()
            tolov.Text = 0
            Label1.Text = "Амжилттай бvртгэлээ!"
            Call cleired()
            cnt = 1
            Call Datagrid()
        End Sub
        Sub cleired()
            TextBox2.Text = ""
            TextBox3.Text = ""
            TextBox4.Text = ""
            Label1.Text = ""
        End Sub
        Sub Datagrid()
            Dim sql As String = "select temdeglel.*,lessname from temdeglel inner join lesstype on ltype=[id]  where lesscode='" & Request("lesscode") & "' and tcode='" & Session("tcode") & "' order by ognoo"
            If myConnection.State = ConnectionState.Closed Then myConnection.Open()
            Dim cmd As SqlDataAdapter
            cmd = New SqlDataAdapter(sql, myConnection)
            Dim rs As DataSet = New DataSet
            cmd.Fill(rs)
            DataGrid1.DataSource = rs
            DataGrid1.DataBind()
            myConnection.Close()
        End Sub
        Sub ItemsGrid_Command(ByVal sender As Object, ByVal e As DataGridCommandEventArgs)
            Dim sql As String
            Dim dr As SqlDataReader

            Select Case (CType(e.CommandSource, LinkButton)).CommandName

                Case "Select"

                    Label1.Text = "Засах"
                    'Exit Sub
                    If myConnection.State = ConnectionState.Closed Then myConnection.Open()
                    sql = " select * from temdeglel where num=" & e.Item.Cells(0).Text
                    Dim cmd = New SqlCommand(sql, myConnection)
                    dr = cmd.ExecuteReader()
                    If dr.Read() Then
                        TextBox1.Text = dr("ognoo")
                        TextBox2.Text = Trim(dr("too"))
                        TextBox3.Text = Trim(dr("tsag"))
                        TextBox4.Text = Trim(dr("sedev"))
                        DropDownList3.SelectedValue = dr("ltype")
                    End If
                    dr.Close()
                    myConnection.Close()
                    tolov.Text = e.Item.Cells(0).Text
                    'Call cleired()
                Case Else
                    'Do nothing.
            End Select
            Label1.Text = (CType(e.CommandSource, LinkButton)).CommandName
        End Sub
        Sub DataGrid1_Paged(ByVal sender As Object, ByVal e As DataGridPageChangedEventArgs)
            DataGrid1.CurrentPageIndex = e.NewPageIndex
            If DataGrid1.CurrentPageIndex = 0 Then
                cnt = 1
            Else
                cnt = (DataGrid1.CurrentPageIndex) * DataGrid1.PageSize + 1
            End If
            Datagrid()
        End Sub
        Private Sub Button3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button3.Click
            Dim i As Integer
            Dim sql As String
            If myConnection.State = ConnectionState.Closed Then myConnection.Open()
            For i = 0 To DataGrid1.Items.Count - 1
                Dim remove As CheckBox = CType(DataGrid1.Items(i).FindControl("del"), CheckBox)
                Dim num As Label = CType(DataGrid1.Items(i).FindControl("num"), Label)
                If remove.Checked = True Then
                    sql = "delete from temdeglel where num=" & CInt(num.Text)
                    Dim cmd = New SqlCommand(sql, myConnection)
                    cmd.ExecuteNonQuery()
                End If
            Next
            myConnection.Close()
            cnt = 1
            Call Datagrid()
            Label1.Text = "Устгалаа"
        End Sub
        Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
            Call cleired()
            tolov.Text = 0
        End Sub
        Private Sub Button4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button4.Click
            Response.Redirect("tem_print.aspx?lesscode=" & Request("lesscode") & "&ognoo1=" & ognoo1.Text & "&ognoo2=" & ognoo2.Text & "")
        End Sub
        Private Sub Button5_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button5.Click
            Response.Redirect("tsagiintootsoo.aspx")
        End Sub


    End Class

End Namespace
