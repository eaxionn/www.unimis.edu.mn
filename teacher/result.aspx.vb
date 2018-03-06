Imports System.data
Imports System.data.sqlclient


Namespace teacher

    Partial Class result
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
        Public cnt1 As Integer
        Public cnt As Integer = 0
        Public total As Double
        Public mstrSortCol, mstrSortColold As String
        Dim myConnection As New SqlConnection

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

        Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
            myConnection.ConnectionString = ConfigurationManager.AppSettings("ConnectionString")
            If Not zuser(Session("tcode"), Session("tpsss")) Then
                Response.Redirect("login.aspx")
            Else
                If Not Page.IsPostBack Then
                    Dim type As Integer = Request("type")
                    cnt = 1
                    mstrSortCol = ""
                    If erhhaah() = False Then
                        Button1.Enabled = False
                        Button2.Enabled = False
                        Label1.Text = "Дvн оруулах хугацаа дууссан байна"
                    Else
                        Label1.Text = ""
                        Button1.Enabled = True
                        Button2.Enabled = True
                    End If
                    Call Dugnehhelber()
                    Call Oyutniijagsaalt()
                    If type <> 0 Then
                        Label4.Text = Request("lesscode") & IIf(Request("type") = 1, " хичээлийн семнарын ", " хичээлийн лабороторын ") & Request("gr") & "-р грvпийн дvн оруулах "
                        '            Else

                    End If
                End If
            End If
        End Sub
        Function erhhaah() As Boolean
            If myConnection.State = ConnectionState.Closed Then myConnection.Open()

            Dim cmd = New SqlCommand("select * from U31 where U31AA='" & Session("tcode") & "'", myConnection)
            Dim dr = cmd.ExecuteReader()
            If dr.Read() Then
                If dr("U31CC") = 0 Then erhhaah = False Else erhhaah = True
            End If
            dr.Close()
            myConnection.Close()
        End Function
        Sub Dugnehhelber()
            Dim sql As String
            If myConnection.State = ConnectionState.Closed Then myConnection.Open()
            sql = "select 0 as val,'сонго..'as names union select UN_KOD,UN_NER+' /'+convert(varchar(5),U0355CC)+'/' from U0355 inner join UN_L on U0355BB=UN_KOD " & _
                  " where U0355AA=@lesscode"
            Dim comm As New SqlCommand(sql, myConnection)
            comm.Parameters.Add(New SqlParameter("@lesscode", SqlDbType.VarChar, 25))
            comm.Parameters("@lesscode").Value = Request("lesscode")

            Dim dr As SqlDataReader = comm.ExecuteReader()
            With DropDownList1
                .DataSource = dr
                .DataTextField = "names"
                .DataValueField = "val"
                .DataBind()
            End With
            myConnection.Close()
        End Sub
        Sub Increaser(ByVal sender As Object, ByVal e As EventArgs)
            cnt = cnt + 1
        End Sub
        Sub Increaser1(ByVal sender As Object, ByVal e As EventArgs)
            cnt1 = cnt1 + 1
        End Sub
        Sub Oyutniijagsaalt()
            'Dim sql As String
            If myConnection.State = ConnectionState.Closed Then myConnection.Open()
            Dim cmd As SqlDataAdapter
            cmd = New SqlDataAdapter("exec Dungiinlist @lesscode,@tcode,@type,@gr,@ltype," & Label2.Text, myConnection)
            cmd.SelectCommand.Parameters.Add(New SqlParameter("@lesscode", SqlDbType.VarChar, 25))
            cmd.SelectCommand.Parameters("@lesscode").Value = Request("lesscode")
            cmd.SelectCommand.Parameters.Add(New SqlParameter("@tcode", SqlDbType.VarChar, 25))
            cmd.SelectCommand.Parameters("@tcode").Value = Session("tcode")
            cmd.SelectCommand.Parameters.Add(New SqlParameter("@type", SqlDbType.SmallInt))
            cmd.SelectCommand.Parameters("@type").Value = Request("type")
            cmd.SelectCommand.Parameters.Add(New SqlParameter("@gr", SqlDbType.SmallInt))
            cmd.SelectCommand.Parameters("@gr").Value = IIf(Request("type") = 0, 0, Request("gr"))
            cmd.SelectCommand.Parameters.Add(New SqlParameter("@ltype", SqlDbType.SmallInt))
            cmd.SelectCommand.Parameters("@ltype").Value = DropDownList1.SelectedValue
            Dim rs As DataSet = New DataSet
            cmd.Fill(rs)
            DataGrid1.DataSource = rs
            DataGrid1.DataBind()
            myConnection.Close()
        End Sub
        Private Sub DataGrid1_SortCommand(ByVal source As System.Object, ByVal e As System.Web.UI.WebControls.DataGridSortCommandEventArgs) Handles DataGrid1.SortCommand
            'Grab the Name of the item to sort by
            mstrSortCol = e.SortExpression()
            cnt = 1
            If mstrSortCol = Left(Label2.Text, 1) Then
                Select Case Label2.Text
                    Case "1.1"
                        Label2.Text = "1.2"
                    Case "1.2"
                        Label2.Text = "1.1"
                    Case "2.1"
                        Label2.Text = "2.2"
                    Case "2.2"
                        Label2.Text = "2.1"
                    Case "3.1"
                        Label2.Text = "3.2"
                    Case "3.2"
                        Label2.Text = "3.1"
                End Select
            Else
                Label2.Text = mstrSortCol & ".1"
            End If
            Oyutniijagsaalt()
            'Label1.Text = mstrSortCol
        End Sub
        Function raplacecode(ByVal strval As String)
            strval = Replace(strval, "Ї", "&#1198;")
            strval = Replace(strval, "v", "&#1199;")
            strval = Replace(strval, "Є", "&#1256;")
            strval = Replace(strval, "є", "&#1257;")
            raplacecode = strval
        End Function
        Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
            Dim i, val As Integer
            'Dim sql As String
            If DropDownList1.SelectedValue = 0 Then
                Label1.Text = "Дvгнэх хэлбэр сонго"
                Exit Sub
            End If
            For i = 0 To DataGrid1.Items.Count - 1
                Dim sid As Label = CType(DataGrid1.Items(i).FindControl("sid"), Label)
                Dim dun As String = CType(DataGrid1.Items(i).FindControl("dun"), TextBox).Text

                'try
                val = AddDun(Session("tcode"), Request("lesscode"), sid.Text, DropDownList1.SelectedValue, maxonoo.Text, dun)
                If val = 1 Then
                    Label1.Text = "Алдаа! " & sid.Text & "-оюутны дvн буруу орсон байна."
                    Exit Sub
                End If
                'Catch
                '   Label1.Text = "Дvн хадгалах явцад алдаа гарлаа !"
                '  End try
            Next
            Label1.Text = "Дvн амжилттай хадгаллаа"
        End Sub

        Private Sub DropDownList1_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles DropDownList1.SelectedIndexChanged
            Dim sql As String
            If DropDownList1.SelectedValue <> 0 Then
                If myConnection.State = ConnectionState.Closed Then myConnection.Open()
                sql = "select U0355CC from U0355 where U0355AA='" & Request("lesscode") & "' and U0355BB='" & DropDownList1.SelectedValue & "'"
                Dim cmd = New SqlCommand(sql, myConnection)
                Dim dr = cmd.ExecuteReader()
                If dr.Read() Then
                    maxonoo.Text = dr(0)
                End If
                myConnection.Close()
                cnt = 1
                Oyutniijagsaalt()
                Label1.Text = ""
            End If
        End Sub
        Sub ItemsGrid_Command(ByVal sender As Object, ByVal e As DataGridCommandEventArgs)
            'Dim sql As String
            'Dim dr As SqlDataReader
            Select Case (CType(e.CommandSource, linkButton)).CommandName
                Case "Select"
                    'Panel1.Visible = False
                    'Panel2.Visible = true
                    'cnt1 = 1
                    'If myConnection.State = ConnectionState.Closed Then myConnection.Open()
                    'Dim cmd As SqlDataAdapter
                    'cmd = New SqlDataAdapter("exec Stdun @sid,@lessid ", myConnection)
                    'cmd.SelectCommand.Parameters.Add(New SqlParameter("@sid", SqlDbType.VarChar, 25))
                    'cmd.SelectCommand.Parameters("@sid").Value = e.Item.Cells(0).Text
                    'cmd.SelectCommand.Parameters.Add(New SqlParameter("@lessid", SqlDbType.VarChar, 25))
                    'cmd.SelectCommand.Parameters("@lessid").Value = Request("lesscode")
                    'Dim rs As DataSet = New DataSet
                    'cmd.Fill(rs)
                    'DataGrid2.DataSource = rs
                    'DataGrid2.DataBind()
                    'myConnection.Close()
                    'If DataGrid2.Items.Count > 0 Then
                    '    Label3.Text = DataGrid2.Items(0).Cells(3).Text & "/" & e.Item.Cells(0).Text & "/ -н <br//>" & Request("lesscode") & " хичээлийн дvн"
                    'End If


                    Panel1.Visible = False
                    Panel2.Visible = True
                    Dim sname As Label = CType(e.Item.FindControl("sname"), Label)
                    Label3.Text = "<b>" & sname.Text & "/" & e.Item.Cells(0).Text & "/</b> -н <b>" & Request("lesscode") & "</b> хичээлийн дvн оруулах"

                    sid.Text = e.Item.Cells(0).Text
                    Call stdunreg()
                    num.Text = e.Item.ItemIndex
                    'Label6.Text += "index:" & CInt(e.Item.ItemIndex) & "cnt:" & DataGrid1.Items.Count & " num:" & num.Text
                    If CInt(e.Item.ItemIndex) = 0 Then
                        omnoh.Text = ""
                        linkButton4.Enabled = False
                    Else
                        linkButton4.Enabled = True
                        omnoh.Text = DataGrid1.DataKeys(CInt(e.Item.ItemIndex) - 1)
                    End If
                    If CInt(e.Item.ItemIndex) = DataGrid1.Items.Count - 1 Then
                        daraah.Text = ""
                        linkButton3.Enabled = False
                    Else
                        linkButton3.Enabled = True
                        daraah.Text = DataGrid1.DataKeys(CInt(e.Item.ItemIndex) + 1)
                    End If
                    Label6.Text = ""
                    'linkButton2.n
                Case Else
                    'Do nothing.
            End Select
        End Sub
        Sub stdunreg()
            cnt1 = 1
            If myConnection.State = ConnectionState.Closed Then myConnection.Open()
            Dim cmd As SqlDataAdapter
            cmd = New SqlDataAdapter("exec Studentdun @sid,@lesscode,@tcode ", myConnection)
            cmd.SelectCommand.Parameters.Add(New SqlParameter("@lesscode", SqlDbType.VarChar, 25))
            cmd.SelectCommand.Parameters("@lesscode").Value = Request("lesscode")
            cmd.SelectCommand.Parameters.Add(New SqlParameter("@sid", SqlDbType.VarChar, 25))
            cmd.SelectCommand.Parameters("@sid").Value = sid.Text
            cmd.SelectCommand.Parameters.Add(New SqlParameter("@tcode", SqlDbType.VarChar, 25))
            cmd.SelectCommand.Parameters("@tcode").Value = Session("tcode")
            Dim rs As DataSet = New DataSet
            cmd.Fill(rs)
            DataGrid2.DataSource = rs
            DataGrid2.DataBind()
            myConnection.Close()
        End Sub
        Sub Item_Bound(ByVal sender As Object, ByVal e As DataGridItemEventArgs)
            Select Case e.Item.ItemType
                Case ListItemType.Item, ListItemType.AlternatingItem
                    Dim sonoo As TextBox = CType(e.Item.FindControl("onoo"), TextBox)
                    total += CType(sonoo.Text, Double)
                Case ListItemType.Footer
                    e.Item.Cells(1).Text = "<b>Нийт: </b>"
                    e.Item.Cells(2).Text = "<font color='#CC0000'>" & Format(total, "###0.00") & "</font>"
            End Select
        End Sub 'Item_Bound 

        Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
            Dim i As Integer
            Dim val As Double
            'Dim sql As String
            For i = 0 To DataGrid2.Items.Count - 1
                Dim dun As String = CType(DataGrid2.Items(i).FindControl("onoo"), TextBox).Text
                Dim hcode As Label = CType(DataGrid2.Items(i).FindControl("hcode"), Label)
                Dim hname As Label = CType(DataGrid2.Items(i).FindControl("hname"), Label)
                Dim honoo As Label = CType(DataGrid2.Items(i).FindControl("honoo"), Label)



                val = AddDun(Session("tcode"), Request("lesscode"), sid.Text, DropDownList1.SelectedValue, honoo.Text, dun)
                If val = 1 Then
                    Label6.Text = "Алдаа! " & sid.Text & "-оюутны дvн буруу орсон байна."
                    Exit Sub
                End If
            Next
            Label6.Text = "Дvн амжилттай хадгаллаа"
            Call stdunreg()
        End Sub

        Private Sub linkButton4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles linkButton4.Click
            '********* omnohruu shiljeh******************
            If CInt(num.Text) - 1 = 0 Then
                omnoh.Text = ""
                daraah.Text = DataGrid1.DataKeys(CInt(num.Text))
                linkButton4.Enabled = False
            Else
                linkButton3.Enabled = True
                omnoh.Text = DataGrid1.DataKeys(CInt(num.Text) - 2)
                daraah.Text = DataGrid1.DataKeys(CInt(num.Text))
            End If
            num.Text = CInt(num.Text) - 1
            sid.Text = DataGrid1.DataKeys(CInt(num.Text))
            Call stdunreg()
            'DataGrid1.Items(num.Text).FindControl()
            Dim sname As Label = CType(DataGrid1.Items(num.Text).FindControl("sname"), Label)
            Label3.Text = "<b>" & sname.Text & "/" & sid.Text & "/</b> -н <b>" & Request("lesscode") & "</b> хичээлийн дvн оруулах"
            Label6.Text = ""
        End Sub
        Private Sub linkButton3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles linkButton3.Click
            '********* daraahruu shiljeh******************
            If CInt(num.Text) + 1 = DataGrid1.Items.Count - 1 Then
                daraah.Text = ""
                omnoh.Text = DataGrid1.DataKeys(CInt(num.Text))
                linkButton3.Enabled = False
            Else
                linkButton4.Enabled = True
                daraah.Text = DataGrid1.DataKeys(CInt(num.Text) + 2)
                omnoh.Text = DataGrid1.DataKeys(CInt(num.Text))
            End If
            num.Text = CInt(num.Text) + 1
            sid.Text = DataGrid1.DataKeys(CInt(num.Text))
            Call stdunreg()
            Dim sname As Label = CType(DataGrid1.Items(num.Text).FindControl("sname"), Label)
            Label3.Text = "<b>" & sname.Text & "/" & sid.Text & "/</b> -н <b>" & Request("lesscode") & "</b> хичээлийн дvн оруулах"
            Label6.Text = ""
        End Sub
        Private Sub linkButton2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles linkButton2.Click
            Panel2.Visible = False
            Panel1.Visible = True
        End Sub
        Private Sub linkButton5_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles linkButton5.Click
            Response.Redirect("result1.aspx?lesscode=" & Request("lesscode") & "&type=" & Request("type") & "&gr=" & Request("gr"))
        End Sub
        Private Sub Button3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button3.Click
            Response.Redirect("lesson.aspx?lesscode=" & Request("lesscode"))
        End Sub

        Public Function AddDun(ByVal tid As String, ByVal lessid As String, ByVal sid As String, ByVal ltype As Int16, ByVal monoo As String, ByVal dun As String) As Int16
            Dim myCommand As New SqlCommand("DunAdd", myConnection)
            myCommand.CommandType = CommandType.StoredProcedure

            myCommand.Parameters.Add("@sid", SqlDbType.VarChar, 20)
            myCommand.Parameters("@sid").Value = sid

            myCommand.Parameters.Add("@tid", SqlDbType.VarChar, 25)
            myCommand.Parameters("@tid").Value = tid

            myCommand.Parameters.Add("@lessid", SqlDbType.VarChar, 10)
            myCommand.Parameters("@lessid").Value = lessid

            myCommand.Parameters.Add("@ltype", SqlDbType.Int)
            myCommand.Parameters("@ltype").Value = ltype

            myCommand.Parameters.Add("@monoo", SqlDbType.VarChar, 5)
            myCommand.Parameters("@monoo").Value = monoo

            myCommand.Parameters.Add("@dun", SqlDbType.VarChar, 5)
            myCommand.Parameters("@dun").Value = dun

            myCommand.Parameters.Add("@RetValue", SqlDbType.SmallInt)
            myCommand.Parameters("@RetValue").Direction = ParameterDirection.ReturnValue

            If myConnection.State = ConnectionState.Closed Then myConnection.Open()
            myCommand.ExecuteNonQuery()
            AddDun = myCommand.Parameters("@RetValue").Value
            myConnection.Close()
        End Function

    End Class
End Namespace
