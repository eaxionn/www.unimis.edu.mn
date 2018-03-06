Imports System.data
Imports System.data.sqlclient
Imports System.Web.Security
'Imports student.Module1

Partial Class st_san
    Inherits System.Web.UI.Page
    Dim myConnection As New SqlConnection
    Public sql As String

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
        If Not zuser(Session("u1000"), Session("psss")) Then
            Response.Redirect("login.aspx")
        Else
            Response.Expires = -1
            If myConnection.State = ConnectionState.Closed Then myConnection.Open()
            Dim hos As Boolean = False
            Dim cmd As New SqlCommand("Select U0211CC from U0211 where U0211BB='" & Session("u1000") & "'", myConnection)
            Dim dr As SqlDataReader
            dr = cmd.ExecuteReader()
            If dr.Read() Then
                Sql = "select U0323EE,U035DD,U035EE from U0323 INNER JOIN U035 ON U035CC=U0323EE " & _
                        " where U0323CC= (select U021DD from U021 where U021EE='" & Session("u1000") & "')  " & _
                        " and U0323BB= (select U021AE from U021 where U021EE='" & Session("u1000") & "')  " & _
                        " and U0323HH='" & Trim(dr(0)) & "'  "
            Else
                Sql = "select U0323EE,U035DD,U035EE from U0323 INNER JOIN U035 ON U035CC=U0323EE " & _
                      " where U0323CC= (select U021DD from U021 where U021EE='" & Session("u1000") & "')  " & _
                        " and U0323BB= (select U021AE from U021 where U021EE='" & Session("u1000") & "')  " & _
                        " and  U0323HH is null  "
            End If
            dr.Close()

            cmd = New SqlCommand("select MMM4 from MER_L  where MMM3='" & Request("ind") & "'", myConnection)
            dr = cmd.ExecuteReader()
            If dr.Read() Then
                Label1.Text = dr(0)
            End If
            myConnection.Close()

            Grid_1()
            Grid_2()
            Grid_3()
            Grid_4()
            Grid_5()
            Grid_6()
            Grid_7()
            Grid_8()
            Grid_9()
            Grid_10()
        End If
    End Sub
    Sub Grid_1()
        If myConnection.State = ConnectionState.Closed Then myConnection.Open()
        Dim cmd As SqlDataAdapter
        cmd = New SqlDataAdapter(sql & " and U0323DD='01' ", myConnection)
        Dim rs As DataSet = New DataSet
        cmd.Fill(rs)
        DataGrid1.DataSource = rs
        DataGrid1.DataBind()
        myConnection.Close()
        'Label1.Text = Label1.Text & "<p>" & sql
    End Sub
    Sub Grid_2()
        If myConnection.State = ConnectionState.Closed Then myConnection.Open()
        Dim cmd As SqlDataAdapter
        cmd = New SqlDataAdapter(sql & " and U0323DD='02' ", myConnection)
        Dim rs As DataSet = New DataSet
        cmd.Fill(rs)
        DataGrid2.DataSource = rs
        DataGrid2.DataBind()
        myConnection.Close()
    End Sub
    Sub Grid_3()
        If myConnection.State = ConnectionState.Closed Then myConnection.Open()
        Dim cmd As SqlDataAdapter
        cmd = New SqlDataAdapter(sql & " and U0323DD='03' ", myConnection)
        Dim rs As DataSet = New DataSet
        cmd.Fill(rs)
        Datagrid3.DataSource = rs
        Datagrid3.DataBind()
        myConnection.Close()
    End Sub
    Sub Grid_4()
        If myConnection.State = ConnectionState.Closed Then myConnection.Open()
        Dim cmd As SqlDataAdapter
        cmd = New SqlDataAdapter(sql & " and U0323DD='04' ", myConnection)
        Dim rs As DataSet = New DataSet
        cmd.Fill(rs)
        Datagrid4.DataSource = rs
        Datagrid4.DataBind()
        myConnection.Close()
    End Sub
    Sub Grid_5()
        If myConnection.State = ConnectionState.Closed Then myConnection.Open()
        Dim cmd As SqlDataAdapter
        cmd = New SqlDataAdapter(sql & " and U0323DD='05' ", myConnection)
        Dim rs As DataSet = New DataSet
        cmd.Fill(rs)
        Datagrid5.DataSource = rs
        Datagrid5.DataBind()
        myConnection.Close()
    End Sub
    Sub Grid_6()
        If myConnection.State = ConnectionState.Closed Then myConnection.Open()
        Dim cmd As SqlDataAdapter
        cmd = New SqlDataAdapter(sql & " and U0323DD='06' ", myConnection)
        Dim rs As DataSet = New DataSet
        cmd.Fill(rs)
        Datagrid6.DataSource = rs
        Datagrid6.DataBind()
        myConnection.Close()
    End Sub
    Sub Grid_7()
        If myConnection.State = ConnectionState.Closed Then myConnection.Open()
        Dim cmd As SqlDataAdapter
        cmd = New SqlDataAdapter(sql & " and U0323DD='07' ", myConnection)
        Dim rs As DataSet = New DataSet
        cmd.Fill(rs)
        Datagrid7.DataSource = rs
        Datagrid7.DataBind()
        myConnection.Close()
    End Sub
    Sub Grid_8()
        If myConnection.State = ConnectionState.Closed Then myConnection.Open()
        Dim cmd As SqlDataAdapter
        cmd = New SqlDataAdapter(sql & " and U0323DD='08' ", myConnection)
        Dim rs As DataSet = New DataSet
        cmd.Fill(rs)
        Datagrid8.DataSource = rs
        Datagrid8.DataBind()
        myConnection.Close()
    End Sub
    Sub Grid_9()
        If myConnection.State = ConnectionState.Closed Then myConnection.Open()
        Dim cmd As SqlDataAdapter
        cmd = New SqlDataAdapter(sql & " and U0323DD='09' ", myConnection)
        Dim rs As DataSet = New DataSet
        cmd.Fill(rs)
        Datagrid9.DataSource = rs
        Datagrid9.DataBind()
        myConnection.Close()
    End Sub
    Sub Grid_10()
        If myConnection.State = ConnectionState.Closed Then myConnection.Open()
        Dim cmd As SqlDataAdapter
        cmd = New SqlDataAdapter(sql & " and U0323DD='10' ", myConnection)
        Dim rs As DataSet = New DataSet
        cmd.Fill(rs)
        Datagrid10.DataSource = rs
        Datagrid10.DataBind()
        myConnection.Close()
    End Sub
End Class
