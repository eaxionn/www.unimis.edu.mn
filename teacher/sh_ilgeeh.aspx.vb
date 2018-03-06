Imports System.data
Imports System.data.sqlclient
Imports System.IO


Namespace teacher

    Partial Class sh_ilgeeh
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
        Public cnt As Integer
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
            End If
        End Sub
        Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
            Response.Redirect("index.aspx")
        End Sub
        Private Sub Button3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button3.Click
            Dim lItem As New ListItem(ilcode.Text)
            lItem.Value = ilcode.Text
            ListBox1.Items.Add(lItem)
            ilcode.Text = ""
        End Sub
        Private Sub Button5_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button5.Click
            Dim ii As Integer
            Panel1.Visible = False
            Panel2.Visible = True
            Call ListUser(0)
            Call heltes_list()
            ListBox1.Visible = True
            ListBox1.Items.Clear()
            If ListBox2.Items.Count <> 0 Then
                For ii = 0 To ListBox2.Items.Count - 1
                    Dim lItem3 As New ListItem(ListBox2.Items(ii).Text)
                    lItem3.Value = ListBox2.Items(ii).Value
                    ListBox1.Items.Add(lItem3)
                Next
            End If
        End Sub
        Private Sub Button8_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button8.Click
            Dim ii As Integer
            For ii = 0 To ListBox1.Items.Count - 1
                ListBox1.Items.Remove(ListBox1.SelectedItem)
            Next
        End Sub
        Private Sub Button4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button4.Click
            Dim ii As Integer
            For ii = 0 To ListBox1.Items.Count - 1
                ListBox1.Items.Remove(ListBox1.SelectedItem)
            Next
        End Sub
        Private Sub Button6_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button6.Click
            Dim ii As Integer
            Panel1.Visible = True
            Panel2.Visible = False
            ListBox2.Items.Clear()
            For ii = 0 To ListBox1.Items.Count - 1
                Dim lItem3 As New ListItem(ListBox1.Items(ii).Text)
                lItem3.Value = ListBox1.Items(ii).Value
                ListBox2.Items.Add(lItem3)
            Next
        End Sub
        Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
            Dim hend As String = ""
            Dim ii, retval As Integer
            Dim sFileFullPath As String
            Dim sFilePath As String = ""
            Dim fname As String = ""
            'Dim sql As String

            If Len(upfile.PostedFile.FileName()) = 0 Then
                fname = ""
            Else
                sFilePath = Path.GetFileName(upfile.PostedFile.FileName)
                If file_name(sFilePath) = 0 Then
                    sFileFullPath = ConfigurationSettings.AppSettings("FileSavePath1") & "\" & sFilePath
                    upfile.PostedFile.SaveAs(sFileFullPath)
                    fname = sFilePath
                Else
                    Label3.Text = "Алдаа: File-ийн нэр давхардаж байна"
                    Exit Sub
                End If
            End If


            Dim cmd As New SqlCommand("Zahiailgeeh", myConnection)
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.Add(New SqlParameter("@garchig", SqlDbType.VarChar, 150))
            cmd.Parameters("@garchig").Value = Replace(TextBox1.Text, "'", "''")
            cmd.Parameters.Add(New SqlParameter("@zahia", SqlDbType.Text))
            cmd.Parameters("@zahia").Value = Replace(TextBox2.Text, "'", "''")
            cmd.Parameters.Add(New SqlParameter("@henees", SqlDbType.VarChar, 25))
            cmd.Parameters("@henees").Value = Session("tcode")
            cmd.Parameters.Add(New SqlParameter("@fname", SqlDbType.VarChar, 100))
            cmd.Parameters("@fname").Value = fname
            cmd.Parameters.Add("@RetValue", SqlDbType.SmallInt)
            cmd.Parameters("@RetValue").Direction = ParameterDirection.ReturnValue

            If myConnection.State = ConnectionState.Closed Then myConnection.Open()
            cmd.ExecuteNonQuery()
            retval = cmd.Parameters("@RetValue").Value
            myConnection.Close()


            If myConnection.State = ConnectionState.Closed Then myConnection.Open()
            For ii = 0 To ListBox2.Items.Count - 1 ' zahia ilgeeh
                cmd = New SqlCommand("insert into zahiahend values(@znum,@hend,0)", myConnection)
                cmd.Parameters.Add(New SqlParameter("@znum", SqlDbType.Int))
                cmd.Parameters("@znum").Value = retval
                cmd.Parameters.Add(New SqlParameter("@hend", SqlDbType.VarChar, 25))
                cmd.Parameters("@hend").Value = ListBox2.Items(ii).Value
                cmd.ExecuteNonQuery()
            Next
            myConnection.Close()

            Panel1.Visible = False
            Panel3.Visible = True
        End Sub
        Function file_name(ByVal fname As String)
            If myConnection.State = ConnectionState.Closed Then myConnection.Open()
            Dim dr As SqlDataReader
            Dim id As Integer = 0
            Dim cmd = New SqlCommand("select * from zahia where fname='" & fname & "' ", myConnection)
            dr = cmd.ExecuteReader()
            If dr.Read() Then
                id = 1
            End If
            dr.Close()
            myConnection.Close()
            Return id
        End Function
        Sub heltes_list()
            Dim sql As String
            If myConnection.State = ConnectionState.Closed Then myConnection.Open()
            sql = "select '0' as lesscode,'хичээл сонго..' as lessname union  "
            sql = sql & " SELECT U0362DD as lesscode,U0362DD as lessname FROM "
            sql = sql & " U0362 INNER JOIN U035 ON U0362.U0362DD = U035.U035CC INNER "
            sql = sql & " JOIN main ON U0362.U0362BB = main.q2 AND U0362.U0362YY = main.q1 WHERE (U0362.U0362GG = '2') "
            sql = sql & " and U0362EE='" & Session("tcode") & "' group by U0362DD,U035DD "
            'sql = "select 0 as [id],'нийт . .' as names union  SELECT U0362DD as lesscode,'/'+U0362DD+'/' as lessname FROM U0362 INNER JOIN U035 ON U0362.U0362DD = U035.U035CC INNER JOIN "
            'sql = sql & " main ON U0362.U0362BB = main.q2 AND U0362.U0362YY = main.q1 WHERE     (U0362.U0362GG = '2') and U0362EE='" & Session("tcode") & "'  "
            'sql = sql & " group by U0362DD,U035DD "
            Dim comm As New SqlCommand(sql, myConnection)
            Dim dr As SqlDataReader = comm.ExecuteReader()
            heltes.Items.Clear()
            With heltes
                .DataSource = dr
                .DataTextField = "lessname"
                .DataValueField = "lesscode"
                .DataBind()
                .SelectedValue = 0
            End With
            myConnection.Close()
        End Sub
        Sub ListUser(ByVal val As String)
            Dim sql As String
            If myConnection.State = ConnectionState.Closed Then myConnection.Open()
            Dim cmd As SqlDataAdapter
            If val = "0" Then
                sql = "SELECT U0362AA [id],U021HH names FROM U0362 " & _
                        "inner JOIN main ON U0362.U0362BB = main.q2 AND U0362.U0362YY = main.q1 " & _
                        "inner JOIN U021 ON U021.U021EE = U0362.U0362AA " & _
                        "WHERE (U0362.U0362GG = '2') and U0362EE='" & Session("tcode") & "' order by U0362AA"
            Else
                sql = "SELECT U0362AA [id],U021HH names FROM U0362 " & _
                        "inner JOIN main ON U0362.U0362BB = main.q2 AND U0362.U0362YY = main.q1 " & _
                        "inner JOIN U021 ON U021.U021EE = U0362.U0362AA " & _
                        "WHERE (U0362.U0362GG = '2') and U0362EE='" & Session("tcode") & "' and U0362DD='" & val & "' order by U0362AA"
                'sql = "select [id],isnull(left(ovog,1),'')+'tr+rtrim(name)+' /'+rtrim(job)+'/' names from security where left(code,2)=" & val
            End If
            cmd = New SqlDataAdapter(sql, myConnection)
            Dim rs As DataSet = New DataSet
            cmd.Fill(rs)
            DataGrid1.DataSource = rs
            DataGrid1.DataBind()
            myConnection.Close()
        End Sub
        Sub DataGrid1_Paged(ByVal sender As Object, ByVal e As DataGridPageChangedEventArgs)
            DataGrid1.CurrentPageIndex = e.NewPageIndex
            cnt = 1
            ListUser(heltes.SelectedValue)
        End Sub
        Private Sub heltes_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles heltes.SelectedIndexChanged
            DataGrid1.CurrentPageIndex = 0
            If heltes.SelectedValue <> "0" Then Button9.Visible = True Else Button9.Visible = False
            Call ListUser(heltes.SelectedValue)
        End Sub
        Private Sub Button9_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button9.Click
            If myConnection.State = ConnectionState.Closed Then myConnection.Open()
            Dim sql As String = "SELECT U0362AA [id],U021HH+'/'+U0362AA+'/' names FROM U0362 " & _
                "inner JOIN main ON U0362.U0362BB = main.q2 AND U0362.U0362YY = main.q1 " & _
                "inner JOIN U021 ON U021.U021EE = U0362.U0362AA " & _
                "WHERE (U0362.U0362GG = '2') and U0362EE='" & Session("tcode") & "' and U0362DD='" & heltes.SelectedValue & "' order by U0362AA "
            Dim comm As New SqlCommand(sql, myConnection)
            Dim dr As SqlDataReader = comm.ExecuteReader()
            ListBox1.Items.Clear()
            With ListBox1
                .DataSource = dr
                .DataTextField = "names"
                .DataValueField = "id"
                .DataBind()
                '.SelectedValue = 0
            End With
            myConnection.Close()
        End Sub

        Private Sub Button7_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button7.Click
            Dim i As Integer
            For i = 0 To DataGrid1.Items.Count - 1
                Dim remove As CheckBox = CType(DataGrid1.Items(i).FindControl("Remove"), CheckBox)
                Dim id As Label = CType(DataGrid1.Items(i).FindControl("id"), Label)
                Dim ovogner As String = trim(CType(DataGrid1.Items(i).FindControl("names"), Label).Text)
                If remove.Checked = True Then
                    If shalgah(id.Text) Then
                        Dim lItem3 As New ListItem(ovogner)
                        lItem3.Value = id.Text
                        ListBox1.Items.Add(lItem3)
                    End If
                End If
                CType(DataGrid1.Items(i).FindControl("Remove"), CheckBox).Checked = False
            Next
            ListBox1.Height.Pixel(ListBox1.Items.Count * 10)
        End Sub
        Function shalgah(ByVal usid As String)
            Dim ii, val As Integer
            val = 0
            For ii = 0 To ListBox1.Items.Count - 1
                If ListBox1.Items(ii).Value = usid Then
                    val = 1
                    Exit For
                End If
            Next
            If val = 0 Then Return True Else Return False
        End Function
    End Class

End Namespace
