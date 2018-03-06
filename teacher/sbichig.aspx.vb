Imports System.data
Imports System.data.sqlclient


Namespace teacher

    Partial Class sbichig
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
            Response.Expires = -1
            cnt = 1
            If Not zuser(Session("tcode"), Session("tpsss")) Then
                Response.Redirect("login.aspx")
            Else
                If Not IsPostBack Then
                    Datagrid()
                    Label2.Text = Request("lesscode") & " хичээлд хэрэглэгдэх сурах бичиг"
                    Hyperlink1.NavigateUrl = "Standart.aspx?lesscode=" & Request("lesscode")
                End If
            End If
        End Sub
        Sub Increaser(ByVal sender As Object, ByVal e As EventArgs)
            cnt = cnt + 1
        End Sub
        Sub DataGrid1_Paged(ByVal sender As Object, ByVal e As DataGridPageChangedEventArgs)
            Datagrid1.CurrentPageIndex = e.NewPageIndex
            If Datagrid1.CurrentPageIndex = 0 Then
                cnt = 1
            Else
                cnt = (Datagrid1.CurrentPageIndex) * Datagrid1.PageSize + 1
            End If
            Datagrid()
        End Sub
        Sub Datagrid()
            Dim sql As String = "select * from U0352 where U0352AA='" & Request("lesscode") & "' "
            'If mstrSortCol <> "" Then
            '    sql += " ORDER BY " & mstrSortCol
            'End If
            If myConnection.State = ConnectionState.Closed Then myConnection.Open()
            Dim cmd As SqlDataAdapter
            cmd = New SqlDataAdapter(sql, myConnection)
            Dim rs As DataSet = New DataSet
            cmd.Fill(rs)
            Datagrid1.DataSource = rs
            Datagrid1.DataBind()
            myConnection.Close()
        End Sub
        Public Sub DataGrid_Edit(ByVal Source As Object, _
        ByVal E As DataGridCommandEventArgs)
            Datagrid1.ShowFooter = False
            Datagrid1.EditItemIndex = E.Item.ItemIndex
            'Label1.Text = ""
            Datagrid()
        End Sub
        Public Sub DataGrid_Cancel(ByVal Source As Object, _
        ByVal E As DataGridCommandEventArgs)
            Datagrid1.EditItemIndex = -1
            Datagrid1.ShowFooter = True
            'Label1.Text = ""
            Datagrid()
        End Sub
        Public Sub DataGrid_Update(ByVal Source As Object, _
        ByVal E As DataGridCommandEventArgs)
            Dim myCommand As SqlCommand
            Dim val As Boolean = False
            Dim sql As String
            ' Label1.Text = ""
            Dim adddugaar, addzohiogch, addner, addisbn, addon As String
            Dim addtype As Int16

            'Dim txtOnoo As TextBox = CType(E.Item.FindControl("Ed_onoo"), TextBox)
            'Dim ltype = Convert.ToInt32(CType(E.Item.FindControl("Edit_Type"), DropDownList).SelectedItem.Value)
            'If myConnection.State = ConnectionState.Closed Then myConnection.Open()
            'sql = "select shalgalt.* from shalgalt " & _
            '                    " inner join main on q1=idon and q2=uliral " & _
            '                    " where id!=" & Datagrid1.DataKeys(CInt(E.Item.ItemIndex)) & " and lesscode='" & Request("lesscode") & "' and tcode='" & Session("tcode") & "' and hcode=" & ltype
            'Dim cmd = New SqlCommand(sql, myConnection)
            'Dim dr = cmd.ExecuteReader()
            'If dr.Read() Then
            '    Val = true
            'End If
            'dr.Close()
            'If val = true Then '* shalgalt davhardaj baival garah
            '    Label1.Text = "Энэ терел емне орсон байна !!"
            '    Exit Sub
            'End If

            'sql = "select sum(onoo)onoo from shalgalt " & _
            '    " inner join main on q1=idon and q2=uliral " & _
            '    " where id!=" & Datagrid1.DataKeys(CInt(E.Item.ItemIndex)) & " and lesscode='" & Request("lesscode") & "' and tcode='" & Session("tcode") & "' "
            'cmd = New SqlCommand(sql, myConnection)
            'dr = cmd.ExecuteReader()
            'If dr.Read() Then
            '    If dr(0) + CDbl(txtOnoo.Text) > 100 Then val = true
            'End If
            'dr.Close()
            'If val = true Then '* dun hetervel garah
            '    Label1.Text = "Дvн 100 аас хэтэрсэн байна !!"
            '    Exit Sub
            'End If
            'Label1.Text = sql
            adddugaar = Replace(Convert.ToString(CType(E.Item.FindControl("ed_dugaar"), TextBox).Text), "'", "''")
            addzohiogch = Replace(Convert.ToString(CType(E.Item.FindControl("ed_zohiogch"), TextBox).Text), "'", "''")
            addner = Replace(Convert.ToString(CType(E.Item.FindControl("ed_ner"), TextBox).Text), "'", "''")
            addisbn = Replace(Convert.ToString(CType(E.Item.FindControl("ed_isbn"), TextBox).Text), "'", "''")
            addon = Replace(Convert.ToString(CType(E.Item.FindControl("ed_on"), TextBox).Text), "'", "''")
            addtype = Convert.ToInt32(CType(E.Item.FindControl("ed_type"), DropDownList).SelectedItem.Value)
            If myConnection.State = ConnectionState.Closed Then myConnection.Open()
            sql = "select * from U0352 where U0352AA='" & Request("lesscode") & "' and U0352II!=" & Datagrid1.DataKeys(CInt(E.Item.ItemIndex)) & " and U0352II=" & adddugaar
            Dim cmd = New SqlCommand(sql, myConnection)
            Dim dr = cmd.ExecuteReader()
            If dr.Read() Then
                val = True
            End If
            dr.Close()
            myConnection.Close()
            If val = True Then '* shalgalt davhardaj baival garah
                Label1.Text = "Дугаар давхардаж байна !!"
                Exit Sub
            End If

            Dim strUpdateStmt As String

            strUpdateStmt = "UPDATE U0352 SET " & _
             "U0352BB = N'" & addzohiogch & "', " & _
             "U0352CC = N'" & addner & "', " & _
             "U0352DD = N'" & addisbn & "', " & _
            "U0352II = '" & adddugaar & "', " & _
             "U0352EE = '" & addon & "', " & _
             "U0352FF = '" & addtype & "' " & _
             "WHERE U0352II = " & Datagrid1.DataKeys(CInt(E.Item.ItemIndex))
            If myConnection.State = ConnectionState.Closed Then myConnection.Open()
            myCommand = New SqlCommand(strUpdateStmt, myConnection)
            myCommand.ExecuteNonQuery()
            myConnection.Close()
            Label1.Text = "Амжилттай бvртгэлээ"
            Datagrid1.ShowFooter = True
            Datagrid1.EditItemIndex = -1
            Datagrid()
        End Sub
        Sub DataGrid_Delete(ByVal Sender As Object, ByVal E As DataGridCommandEventArgs)
            Dim MyCommand As SqlCommand
            Dim DeleteCmd As String = "DELETE from U0352 where U0352II = @Id and U0352AA='" & Request("lesscode") & "'"

            MyCommand = New SqlCommand(DeleteCmd, myConnection)
            MyCommand.Parameters.Add(New SqlParameter("@Id", SqlDbType.NVarChar, 11))
            MyCommand.Parameters("@Id").Value = Datagrid1.DataKeys(CInt(E.Item.ItemIndex))

            'try
            If myConnection.State = ConnectionState.Closed Then myConnection.Open()
            MyCommand.ExecuteNonQuery()
            myConnection.Close()
            'Message.Innerhtml = "<b>Record Deleted</b><br/>" & DeleteCmd
            'Catch Exc As SqlException
            '    Message.Innerhtml = "ERROR: Could not delete record"
            '   Message.Style("color") = "red"
            '  End try
            'Label1.Text = "Устгагдлаа"
            Datagrid()
        End Sub
        Sub doInsert(ByVal sender As Object, ByVal e As DataGridCommandEventArgs)
            If e.CommandName = "Insert" Then
                'Label1.Text = ""
                Dim adddugaar, addzohiogch, addner, addisbn, addon As String
                Dim addtype As Int16
                'Dim ltype As Int32
                Dim strSQL, sql As String
                Dim val As Boolean = False

                adddugaar = Replace(Convert.ToString(CType(e.Item.FindControl("add_dugaar"), TextBox).Text), "'", "''")
                addzohiogch = Replace(Convert.ToString(CType(e.Item.FindControl("add_zohiogch"), TextBox).Text), "'", "''")
                addner = Replace(Convert.ToString(CType(e.Item.FindControl("add_ner"), TextBox).Text), "'", "''")
                addisbn = Replace(Convert.ToString(CType(e.Item.FindControl("add_isbn"), TextBox).Text), "'", "''")
                addon = Replace(Convert.ToString(CType(e.Item.FindControl("add_on"), TextBox).Text), "'", "''")
                addtype = Convert.ToInt32(CType(e.Item.FindControl("add_type"), DropDownList).SelectedItem.Value)
                If myConnection.State = ConnectionState.Closed Then myConnection.Open()
                sql = "select * from U0352 where U0352AA='" & Request("lesscode") & "' and U0352II=" & adddugaar
                Dim cmd = New SqlCommand(sql, myConnection)
                Dim dr = cmd.ExecuteReader()
                If dr.Read() Then
                    val = True
                End If
                dr.Close()
                myConnection.Close()
                If val = True Then '* shalgalt davhardaj baival garah
                    Label1.Text = "Дугаар давхардаж байна !!"
                    Exit Sub
                End If
                'sql = "select isnull(sum(onoo),0)onoo from shalgalt " & _
                '" inner join main on q1=idon and q2=uliral " & _
                '" where lesscode='" & Request("lesscode") & "' and tcode='" & Session("tcode") & "' "
                'cmd = New SqlCommand(sql, myConnection)
                'dr = cmd.ExecuteReader()
                'If dr.Read() Then
                '    If dr(0) + CDbl(addOnoo) > 100 Then val = true
                'End If
                'dr.Close()
                'If val = true Then '* shalgalt davhardaj baival garah
                '    Label1.Text = "Дvн 100 аас хэтэрсэн байна !!"
                '    Exit Sub
                'End If


                'Label1.Text = sql

                If myConnection.State = ConnectionState.Closed Then myConnection.Open()
                strSQL = "INSERT INTO U0352  VALUES ('" & Request("lesscode") & "', N'" & addzohiogch & "'," & _
                "N'" & addner & "',N'" & addisbn & "','" & addon & "'," & addtype & "," & adddugaar & ")"
                Dim MyCommand As SqlCommand
                MyCommand = New SqlCommand(strSQL, myConnection)

                'MyCommand.Parameters.Add(New SqlParameter("@addzohiogch", SqlDbType.VarChar, 100))
                'MyCommand.Parameters("@addzohiogch").Value = addzohiogch
                'MyCommand.Parameters.Add(New SqlParameter("@addner", SqlDbType.VarChar, 100))
                'MyCommand.Parameters("@addner").Value = addner
                'MyCommand.Parameters.Add(New SqlParameter("@addisbn", SqlDbType.VarChar, 15))
                'MyCommand.Parameters("@addisbn").Value = addisbn
                'MyCommand.Parameters.Add(New SqlParameter("@addon", SqlDbType.VarChar, 4))
                'MyCommand.Parameters("@addon").Value = addon
                'MyCommand.Parameters.Add(New SqlParameter("@adddugaar", SqlDbType.TinyInt))
                'MyCommand.Parameters("@adddugaar").Value = adddugaar
                'MyCommand.Parameters.Add(New SqlParameter("@addtype", SqlDbType.SmallInt))
                'MyCommand.Parameters("@addtype").Value = addtype
                'MyCommand.Parameters.Add(New SqlParameter("@lesscode", SqlDbType.VarChar, 25))
                'MyCommand.Parameters("@lesscode").Value = Request("lesscode")

                'MyCommand.Parameters.Add(New SqlParameter("@tcode", SqlDbType.VarChar, 25))
                'MyCommand.Parameters("@tcode").Value = Session("tcode")

                MyCommand.ExecuteNonQuery()
                myConnection.Close()
                Label1.Text = "Амжилттай бvртгэлээ"
                Datagrid1.EditItemIndex = -1
                Datagrid()
            End If
        End Sub
        'Private Sub Datagrid1_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataGridItemEventArgs) Handles Datagrid1.ItemDataBound
        '    'create dropdownlists for add mode (in footer)
        '    'Dim myConnection1 = New SqlConnection("SERVER=mainserver;DATABASE=unimis;UID=sa;PWD=sqlserver;")

        '    Dim oConn As SqlConnection = New SqlConnection(ConfigurationSettings.AppSettings("ConnectionString"))
        '    'Dim oConn As New SqlConnection("SERVER=mainserver;DATABASE=laws;UID=sa;PWD=sqlserver;")
        '    Dim oComm As New SqlCommand
        '    Dim oSQLParameter As SqlParameter

        '    'create dropdownlists for add mode (in footer)
        '    If e.Item.ItemType = ListItemType.Footer Then
        '        oComm.Connection = oConn
        '        oComm.CommandType = CommandType.Text

        '        Dim ddlPMethodF As DropDownList
        '        Dim ddlECategoryF As DropDownList

        '        'Payment Method Dll - create, fill and preselect
        '        oComm.CommandText = "select * from HUW_L"
        '        oConn.Open()
        '        ddlPMethodF = CType(e.Item.FindControl("Add_Type"), DropDownList)
        '        ddlPMethodF.DataSource = oComm.ExecuteReader(CommandBehavior.CloseConnection)
        '        ddlPMethodF.DataBind()
        '        ddlPMethodF.Items.Insert(0, "Сонго ...")
        '        ddlPMethodF.Items.FindByText("Сонго ...").Value = 0 'insert don't create a value, but we need a value during defaults
        '        ddlPMethodF.SelectedIndex = 0

        '    End If

        '    'create dropdownlists for edit mode (in selected row)
        '    If e.Item.ItemType = ListItemType.EditItem Then
        '        oComm.Connection = oConn
        '        oComm.CommandType = CommandType.Text

        '        Dim ddlPMethod As DropDownList
        '        Dim ddlECategory As DropDownList
        '        Dim ddlExpenseCurrency As DropDownList
        '        Dim drv As DataRowView = CType(e.Item.DataItem, DataRowView)
        '        Dim currValue As String

        '        'Payment Method Dll - create, fill and preselect
        '        oComm.CommandText = "select * from HUW_L"
        '        oConn.Open()
        '        ddlPMethod = CType(e.Item.FindControl("Edit_Type"), DropDownList)
        '        ddlPMethod.DataSource = oComm.ExecuteReader(CommandBehavior.CloseConnection)
        '        ddlPMethod.DataBind()
        '        ddlPMethod.Items.Insert(0, "Сонго ...")
        '        ddlPMethod.Items.FindByText("Сонго ...").Value = 0 'insert don't create a value, but we need a value during defaults
        '        'currValue = CType(drv("HUW_L"), String)
        '        'ddlPMethod.Items.FindByValue(currValue).Selected = true
        '    End If



        'End Sub

    End Class

End Namespace
