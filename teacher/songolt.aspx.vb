Imports System.data
Imports System.data.sqlclient


Namespace teacher

    Partial Class songolt
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
                    'Dim i As Integer
                    Label1.Text = Request("lesscode") & IIf(Request("type") = 1, " хичээлийн семнарын грvп хуваарьлалт ", " хичээлийн лабороторын грvп хуваарьлалт ")
                    If Request("type") <> 0 Then Call labsem()
                    If Request("type") <> 0 Then
                        Call grup_songoogui(DropDownList1.SelectedValue)
                    Else
                        Call grup_songoogui(0)
                        Call grup1(0)
                        DropDownList1.Enabled = False
                        Label1.Text = "Хичээлийн хуваарь сонгуулах"
                    End If
                    Call bagsh_songoogui()
                    Call checkinghuvaari()
                End If
            End If
        End Sub
        Sub checkinghuvaari()
            Dim type As Integer = Request("type")
            Dim sql As String
            If myConnection.State = ConnectionState.Closed Then myConnection.Open()
            If type = 0 Then
                sql = "select * from U10 inner join main on q1=U10CC and q2=U10DD" & _
                      " where U10FF='" & Session("tcode") & "' and U10EE=@lesscode  "
            Else
                sql = "select * from U10 inner join main on q1=U10CC and q2=U10DD" & _
                      " where U10FF='" & Session("tcode") & "' and U10EE=@lesscode and (U10KK=" & type & " or U10LL=" & type & ")  "
                If DropDownList1.SelectedValue <> 0 Then
                    sql += " and (U10OO=" & DropDownList1.SelectedValue & " or U10PP=" & DropDownList1.SelectedValue & ")"
                End If
            End If
            Dim cmd = New SqlCommand(sql, myConnection)
            cmd.Parameters.Add(New SqlParameter("@lesscode", SqlDbType.VarChar, 25))
            cmd.Parameters("@lesscode").Value = Request("lesscode")
            Dim dr = cmd.ExecuteReader()
            If Not dr.Read() Then
                Label7.Text = Request("lesscode") & "-н хичээлийн энэ грvпийн хуваарь санд ороогvй байна.Сургалтын албанд хандаж оруулна уу"
            End If
            myConnection.Close()
            'strsql.Text = sql
        End Sub
        Sub grup1(ByVal val As Integer)
            Dim sql As String
            Dim type As Integer = Request("type")
            If myConnection.State = ConnectionState.Closed Then myConnection.Open()
            If type = 0 Then
                sql = "SELECT U046.U046AA, U021.U021HH AS sname,U046.U046AA+'  /'+isnull(U021.U021HH,'')+'/' AS studname FROM U046 " & _
                " INNER JOIN main ON U046.U046CC = main.q2 AND U046.U046BB = main.q1 " & _
                " LEFT OUTER JOIN U021 ON U046.U046AA = U021.U021EE " & _
                " where U046DD=@lesscode and U046EE='" & Session("tcode") & "' GROUP BY U046.U046AA,U021.U021HH ORDER BY U046.U046AA "
            Else
                sql = "SELECT U046.U046AA, U021.U021HH AS sname,U046.U046AA+'  /'+isnull(U021.U021HH,'')+'/' AS studname FROM U046 INNER JOIN main ON U046.U046CC = main.q2 AND "
                sql = sql & "   U046.U046BB = main.q1 LEFT OUTER JOIN U021 ON U046.U046AA = U021.U021EE WHERE  "
                sql = sql & "  ((U046.U046JJ = @type) AND (U046.U046LL = " & val & ") and (U046.U046DD = @lesscode) AND (U046.U046EE = '" & Session("tcode") & "'))  "
                sql = sql & "  or ((U046.U046KK = @type) AND (U046.U046MM = " & val & ") AND (U046.U046DD = @lesscode) AND (U046.U046EE = '" & Session("tcode") & "'))  "
                sql = sql & "  GROUP BY U046.U046AA,U021.U021HH ORDER BY U046.U046AA  "
            End If
            Dim comm As New SqlCommand(sql, myConnection)
            comm.Parameters.Add(New SqlParameter("@lesscode", SqlDbType.VarChar, 25))
            comm.Parameters("@lesscode").Value = Request("lesscode")
            comm.Parameters.Add(New SqlParameter("@type", SqlDbType.Int))
            comm.Parameters("@type").Value = type
            Dim dr As SqlDataReader = comm.ExecuteReader()
            With ListBox3
                .DataSource = dr
                .DataTextField = "studname"
                .DataValueField = "U046AA"
                .DataBind()
            End With
            myConnection.Close()
            If ListBox3.Items.Count > 1 Then ListBox3.Height = Unit.Parse(ListBox3.Items.Count * 20)
            Label3.Text = ListBox3.Items.Count & " бичлэг байна"
            'strsql1.Text = sql
        End Sub
        Sub labsem()
            Dim i As Integer
            Dim sql As String = ""
            If myConnection.State = ConnectionState.Closed Then myConnection.Open()
            If Request("type") = 1 Then
                sql = "select * from U0367 where U0367BB=@lesscode and U0367CC='" & Session("tcode") & "'"
            ElseIf Request("type") = 2 Then
                sql = "select * from U0367A where U0367BB=@lesscode and U0367CC='" & Session("tcode") & "'"
            End If
            Dim cmd = New SqlCommand(sql, myConnection)
            cmd.Parameters.Add(New SqlParameter("@lesscode", SqlDbType.VarChar, 25))
            cmd.Parameters("@lesscode").Value = Request("lesscode")
            Dim dr = cmd.ExecuteReader()
            If dr.Read() Then
                DropDownList1.Items.Add(New ListItem("грvп сонго . .", 0))
                For i = 1 To dr("U0367EE")
                    DropDownList1.Items.Add(New ListItem(IIf(Request("type") = 1, "сем-н ", "лаб-н ") & i & "-р грvп", i))
                Next
            End If
            myConnection.Close()
        End Sub
        Sub bagsh_songoogui()
            Dim sql As String
            If myConnection.State = ConnectionState.Closed Then myConnection.Open()
            sql = "SELECT U0362.*,U0362.U0362AA+'  /'+isnull(U021.U021HH,'')+'/' AS studname FROM U0362 INNER JOIN main ON U0362.U0362BB = main.q2 AND U0362.U0362YY = main.q1 LEFT OUTER JOIN "
            sql = sql & "  U021 ON U0362.U0362AA = U021.U021EE WHERE (U0362.U0362DD = @lesscode) AND (U0362.U0362EE = '') AND (U0362.U0362GG = '2') ORDER BY U0362.U0362AA "
            Dim comm As New SqlCommand(sql, myConnection)
            comm.Parameters.Add(New SqlParameter("@lesscode", SqlDbType.VarChar, 25))
            comm.Parameters("@lesscode").Value = Request("lesscode")
            Dim dr As SqlDataReader = comm.ExecuteReader()
            With ListBox1
                .DataSource = dr
                .DataTextField = "studname"
                .DataValueField = "U0362AA"
                .DataBind()
            End With
            myConnection.Close()
            If ListBox1.Items.Count > 1 Then ListBox1.Height = Unit.Parse(ListBox1.Items.Count * 15)
            Label4.Text = ListBox1.Items.Count & " бичлэг байна"
        End Sub
        Sub grup_songoogui(ByVal grval As Integer)
            Dim sql As String
            If myConnection.State = ConnectionState.Closed Then myConnection.Open()
            sql = "SELECT U0362.*,U0362.U0362AA+'  /'+isnull(U021.U021HH,'')+'/' AS studname FROM U0362 " & _
                            " INNER JOIN main ON U0362.U0362BB = main.q2 AND U0362.U0362YY = main.q1 LEFT OUTER JOIN " & _
                            " U021 ON U0362.U0362AA = U021.U021EE WHERE   " & _
                            " (U0362.U0362DD = @lesscode) AND (U0362.U0362EE = '" & Session("tcode") & "' ) AND (U0362.U0362GG = '2')" & _
                            " and U0362AA not in " & _
                            " (select U046.U046AA from U046 " & _
                            " inner join main on q1=U046BB and q2=U046CC " & _
                            " where (U046.U046DD = @lesscode) AND (U046.U046EE = '" & Session("tcode") & "') /*and (U046JJ=" & grval & " or U046KK=" & grval & ") */ group by U046AA)"
            'Label5.Text = sql
            Dim comm As New SqlCommand(sql, myConnection)
            comm.Parameters.Add(New SqlParameter("@lesscode", SqlDbType.VarChar, 25))
            comm.Parameters("@lesscode").Value = Request("lesscode")
            Dim dr As SqlDataReader = comm.ExecuteReader()
            With ListBox2
                .DataSource = dr
                .DataTextField = "studname"
                .DataValueField = "U0362AA"
                .DataBind()
            End With
            myConnection.Close()
            If ListBox2.Items.Count > 1 Then ListBox2.Height = Unit.Parse(ListBox2.Items.Count * 15)
            Label2.Text = ListBox2.Items.Count & " бичлэг байна"
        End Sub
        Private Sub DropDownList1_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles DropDownList1.SelectedIndexChanged
            If DropDownList1.SelectedValue <> 0 Then
                Label6.Text = IIf(Request("type") = 1, "Семнарын ", "Лабороторын ") & DropDownList1.SelectedValue & "-р грvпп"
            End If
            Label5.Text = ""
            Label7.Text = ""
            Call checkinghuvaari()
            Call grup1(DropDownList1.SelectedValue)
            Call grup_songoogui(DropDownList1.SelectedValue)
        End Sub
        Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
            Dim type As Integer = Request("type")
            If type <> 0 Then
                If DropDownList1.SelectedValue = 0 Then
                    Label5.Text = "грvп сонгоно уу "
                    Exit Sub
                End If
            End If
            Dim ii As Integer
            For ii = 0 To ListBox2.Items.Count - 1
                If ListBox2.Items(ii).Selected = True Then
                    If type <> 0 Then
                        Dim cmd As New SqlCommand("input_stud", myConnection)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.Add(New SqlParameter("@lid", SqlDbType.VarChar, 25))
                        cmd.Parameters("@lid").Value = Request("lesscode")
                        cmd.Parameters.Add(New SqlParameter("@tid", SqlDbType.Text))
                        cmd.Parameters("@tid").Value = Session("tcode")
                        cmd.Parameters.Add(New SqlParameter("@sid", SqlDbType.VarChar, 25))
                        cmd.Parameters("@sid").Value = ListBox2.Items(ii).Value
                        cmd.Parameters.Add(New SqlParameter("@gr_type", SqlDbType.Int))
                        cmd.Parameters("@gr_type").Value = type
                        cmd.Parameters.Add(New SqlParameter("@gr_id", SqlDbType.Int))
                        cmd.Parameters("@gr_id").Value = DropDownList1.SelectedValue
                        If myConnection.State = ConnectionState.Closed Then myConnection.Open()
                        cmd.ExecuteNonQuery()
                        myConnection.Close()
                    ElseIf type = 0 Then
                        Dim cmd As New SqlCommand("input_stud_grupgui", myConnection)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.Add(New SqlParameter("@lid", SqlDbType.VarChar, 25))
                        cmd.Parameters("@lid").Value = Request("lesscode")
                        cmd.Parameters.Add(New SqlParameter("@tid", SqlDbType.Text))
                        cmd.Parameters("@tid").Value = Session("tcode")
                        cmd.Parameters.Add(New SqlParameter("@sid", SqlDbType.VarChar, 25))
                        cmd.Parameters("@sid").Value = ListBox2.Items(ii).Value
                        If myConnection.State = ConnectionState.Closed Then myConnection.Open()
                        cmd.ExecuteNonQuery()
                        myConnection.Close()
                    End If
                End If
            Next
            If type <> 0 Then
                Call grup_songoogui(DropDownList1.SelectedValue)
                Call grup1(DropDownList1.SelectedValue)
            Else
                Call grup_songoogui(0)
                Call grup1(0)
            End If
        End Sub
        Private Sub Button3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button3.Click
            Dim type As Integer = Request("type")
            If type <> 0 Then
                If DropDownList1.SelectedValue = 0 Then
                    Label5.Text = "грvп сонгоно уу "
                    Exit Sub
                End If
            End If
            Dim ii As Integer
            For ii = 0 To ListBox2.Items.Count - 1
                If ListBox2.Items(ii).Selected = True Then
                    If type <> 0 Then
                        Dim cmd As New SqlCommand("input_stud", myConnection)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.Add(New SqlParameter("@lid", SqlDbType.VarChar, 25))
                        cmd.Parameters("@lid").Value = Request("lesscode")
                        cmd.Parameters.Add(New SqlParameter("@tid", SqlDbType.Text))
                        cmd.Parameters("@tid").Value = Session("tcode")
                        cmd.Parameters.Add(New SqlParameter("@sid", SqlDbType.VarChar, 25))
                        cmd.Parameters("@sid").Value = ListBox2.Items(ii).Value
                        cmd.Parameters.Add(New SqlParameter("@gr_type", SqlDbType.Int))
                        cmd.Parameters("@gr_type").Value = type
                        cmd.Parameters.Add(New SqlParameter("@gr_id", SqlDbType.Int))
                        cmd.Parameters("@gr_id").Value = DropDownList1.SelectedValue
                        If myConnection.State = ConnectionState.Closed Then myConnection.Open()
                        cmd.ExecuteNonQuery()
                        myConnection.Close()
                    ElseIf type = 0 Then
                        Dim cmd As New SqlCommand("input_stud_grupgui", myConnection)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.Add(New SqlParameter("@lid", SqlDbType.VarChar, 25))
                        cmd.Parameters("@lid").Value = Request("lesscode")
                        cmd.Parameters.Add(New SqlParameter("@tid", SqlDbType.Text))
                        cmd.Parameters("@tid").Value = Session("tcode")
                        cmd.Parameters.Add(New SqlParameter("@sid", SqlDbType.VarChar, 25))
                        cmd.Parameters("@sid").Value = ListBox2.Items(ii).Value
                        If myConnection.State = ConnectionState.Closed Then myConnection.Open()
                        cmd.ExecuteNonQuery()
                        myConnection.Close()
                    End If
                End If
            Next
            If type <> 0 Then
                Call grup_songoogui(DropDownList1.SelectedValue)
                Call grup1(DropDownList1.SelectedValue)
            Else
                Call grup_songoogui(0)
                Call grup1(0)
            End If
        End Sub
        Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
            Dim ii As Integer
            Dim type As Integer = Request("type")
            Dim sql As String
            If myConnection.State = ConnectionState.Closed Then myConnection.Open()
            For ii = 0 To ListBox3.Items.Count - 1 ' zahia ilgeeh
                If ListBox3.Items(ii).Selected Then
                    If type <> 0 Then
                        sql = " delete from U046 where U046EE='" & Session("tcode") & "' and U046DD=@lesscode and  U046AA=@sid and " & _
                              " ((U046JJ=" & type & " and U046LL=" & DropDownList1.SelectedValue & ") or (U046KK=" & Request("type") & " and U046MM=" & DropDownList1.SelectedValue & " )) " & _
                              " delete from U046 where U046EE='" & Session("tcode") & "' and U046DD=@lesscode and  U046AA=@sid and (U046JJ=3 or U046KK=3 )"
                    Else
                        sql = " delete from U046 where U046EE='" & Session("tcode") & "' and U046DD=@lesscode and  U046AA=@sid "
                    End If
                    'Label3.Text = sql
                    'Exit Sub
                    Dim cmd = New SqlCommand(sql, myConnection)
                    cmd.Parameters.Add(New SqlParameter("@sid", SqlDbType.VarChar, 25))
                    cmd.Parameters("@sid").Value = ListBox3.Items(ii).Value
                    cmd.Parameters.Add(New SqlParameter("@lesscode", SqlDbType.VarChar, 25))
                    cmd.Parameters("@lesscode").Value = Request("lesscode")
                    cmd.ExecuteNonQuery()
                End If
            Next
            myConnection.Close()
            If type <> 0 Then
                Call grup_songoogui(DropDownList1.SelectedValue)
                Call grup1(DropDownList1.SelectedValue)
            Else
                Call grup_songoogui(0)
                Call grup1(0)
            End If
        End Sub

        Private Sub Button4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button4.Click
            Dim ii As Integer
            Dim type As Integer = Request("type")
            Dim sql As String
            If myConnection.State = ConnectionState.Closed Then myConnection.Open()
            For ii = 0 To ListBox3.Items.Count - 1 ' zahia ilgeeh
                If ListBox3.Items(ii).Selected Then
                    If type <> 0 Then
                        sql = " delete from U046 where U046EE='" & Session("tcode") & "' and U046DD=@lesscode and  U046AA=@sid and " & _
                              " ((U046JJ=" & type & " and U046LL=" & DropDownList1.SelectedValue & ") or (U046KK=" & Request("type") & " and U046MM=" & DropDownList1.SelectedValue & " )) " & _
                              " delete from U046 where U046EE='" & Session("tcode") & "' and U046DD=@lesscode and  U046AA=@sid and (U046JJ=3 or U046KK=3 )"
                    Else
                        sql = " delete from U046 where U046EE='" & Session("tcode") & "' and U046DD=@lesscode and  U046AA=@sid "
                    End If
                    'Label3.Text = sql
                    'Exit Sub
                    Dim cmd = New SqlCommand(sql, myConnection)
                    cmd.Parameters.Add(New SqlParameter("@sid", SqlDbType.VarChar, 25))
                    cmd.Parameters("@sid").Value = ListBox3.Items(ii).Value
                    cmd.Parameters.Add(New SqlParameter("@lesscode", SqlDbType.VarChar, 25))
                    cmd.Parameters("@lesscode").Value = Request("lesscode")
                    cmd.ExecuteNonQuery()
                End If
            Next
            myConnection.Close()
            If type <> 0 Then
                Call grup_songoogui(DropDownList1.SelectedValue)
                Call grup1(DropDownList1.SelectedValue)
            Else
                Call grup_songoogui(0)
                Call grup1(0)
            End If
        End Sub
        Private Sub Button5_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button5.Click
            Dim ii As Integer
            Dim sql As String
            If myConnection.State = ConnectionState.Closed Then myConnection.Open()
            For ii = 0 To ListBox2.Items.Count - 1 ' zahia ilgeeh
                If ListBox2.Items(ii).Selected Then
                    sql = "update U0362 set U0362EE='' where U0362AA = @sid and U0362EE = '" & Session("tcode") & "' and U0362DD = @lesscode and U0362YY in (select q1 from main)"
                    Dim cmd = New SqlCommand(sql, myConnection)
                    cmd.Parameters.Add(New SqlParameter("@sid", SqlDbType.VarChar, 25))
                    cmd.Parameters("@sid").Value = ListBox2.Items(ii).Value
                    cmd.Parameters.Add(New SqlParameter("@lesscode", SqlDbType.VarChar, 25))
                    cmd.Parameters("@lesscode").Value = Request("lesscode")
                    cmd.ExecuteNonQuery()
                End If
            Next
            myConnection.Close()
            Call grup_songoogui(DropDownList1.SelectedValue)
            Call bagsh_songoogui()
            'Call grup1(DropDownList1.SelectedValue)
        End Sub
        Private Sub Button6_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button6.Click
            Dim sql As String
            Dim ii As Integer
            If myConnection.State = ConnectionState.Closed Then myConnection.Open()
            For ii = 0 To ListBox1.Items.Count - 1 ' zahia ilgeeh
                If ListBox1.Items(ii).Selected Then
                    sql = " update U0362 set U0362EE='" & Session("tcode") & "' where U0362AA = @sid and U0362DD = @lesscode and U0362YY in (select q1 from main where q2='2') "
                    Dim cmd = New SqlCommand(sql, myConnection)
                    cmd.Parameters.Add(New SqlParameter("@sid", SqlDbType.VarChar, 25))
                    cmd.Parameters("@sid").Value = ListBox1.Items(ii).Value
                    cmd.Parameters.Add(New SqlParameter("@lesscode", SqlDbType.VarChar, 25))
                    cmd.Parameters("@lesscode").Value = Request("lesscode")
                    cmd.ExecuteNonQuery()
                End If
            Next
            myConnection.Close()
            Call grup_songoogui(IIf(Request("type") <> 0, DropDownList1.SelectedValue, 0))
            Call bagsh_songoogui()
        End Sub
        Private Sub Button7_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button7.Click
            Response.Redirect("lesson.aspx?lesscode=" & Request("lesscode"))
        End Sub
    End Class
End Namespace
