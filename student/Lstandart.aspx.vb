Imports System.data
Imports System.data.sqlclient
Imports System.Web.Security
'Imports student.Module1

Partial Class Lstandart
    Inherits System.Web.UI.Page
    Dim myConnection As New SqlConnection

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
            Label17.Text = Request("sc")
            Dim tenhim As String = ""
            If myConnection.State = ConnectionState.Closed Then myConnection.Open()
            Dim cmd As New SqlCommand("Select *,isnull(U035QQ,'') as ddd from U035 where U035CC='" & Request("sc") & "'", myConnection)
            Dim dr = cmd.ExecuteReader()
            If dr.Read() Then
                tenhim = Trim(dr(1))
                Label3.Text = Trim(IIf(Not IsDBNull(dr(2)), dr(2), ""))
                Label4.Text = Trim(IIf(Not IsDBNull(dr(3)), dr(3), ""))
                Label5.Text = Trim(IIf(Not IsDBNull(dr(4)), dr(4), ""))
                Label6.Text = Trim(IIf(Not IsDBNull(dr(5)), dr(5), ""))
                Label7.Text = Trim(IIf(Not IsDBNull(dr(6)), dr(6), ""))
                Label8.Text = Trim(IIf(Not IsDBNull(dr(7)), dr(8), ""))
                Label9.Text = Trim(IIf(Not IsDBNull(dr(8)), dr(8), ""))
                Label10.Text = Trim(IIf(Not IsDBNull(dr(9)), dr(9), ""))
                Label11.Text = Trim(IIf(Not IsDBNull(dr(10)), dr(10), "").ToString)
                Label12.Text = Trim(IIf(Not IsDBNull(dr(11)), dr(11), "").ToString)
                Label13.Text = Trim(IIf(Not IsDBNull(dr(12)), dr(12), "").ToString)
                Label14.Text = Trim(IIf(Not IsDBNull(dr(13)), dr(13), "").ToString)
                Label15.Text = Trim(IIf(Not IsDBNull(dr(14)), dr(14), ""))
                Label16.Text = Trim(IIf(Not IsDBNull(dr("ddd")), dr("ddd"), ""))
            End If
            dr.Close()
            cmd = New SqlCommand("Select SSS2 from SUR_L where SSS1='" & Left(Request("sc"), 1) & "'", myConnection)
            dr = cmd.ExecuteReader()
            If dr.Read() Then
                Label1.Text = dr(0)
            End If
            dr.Close()
            cmd = New SqlCommand("Select TTT3 from TEN_L where TTT2='" & tenhim & "'", myConnection)
            dr = cmd.ExecuteReader()
            If dr.Read() Then
                Label2.Text = dr(0)
            End If
            dr.Close()
            myConnection.Close()

            Call Datagrid_1()
            Call Datagrid_2()
            Call Datagrid_3()
            Call Datagrid_4()
            Call Datagrid_5()
        End If
    End Sub
    Sub Datagrid_1()
        Dim sql As String
        sql = "Select U0351.*,U41II From U0351 inner join U41 on U41EE=U0351BB where U0351AA='" & Request("sc") & "'"
        If myConnection.State = ConnectionState.Closed Then myConnection.Open()
        Dim cmd As SqlDataAdapter
        cmd = New SqlDataAdapter(sql, myConnection)
        Dim rs As DataSet = New DataSet
        cmd.Fill(rs)
        DataGrid1.DataSource = rs
        DataGrid1.DataBind()
        myConnection.Close()
    End Sub
    Sub Datagrid_2()
        Dim sql As String
        sql = "Select UN_NER,U0355CC From U0355 INNER JOIN  UN_L ON UN_KOD=U0355BB where U0355AA='" & Request("sc") & "'"
        If myConnection.State = ConnectionState.Closed Then myConnection.Open()
        Dim cmd As SqlDataAdapter
        cmd = New SqlDataAdapter(sql, myConnection)
        Dim rs As DataSet = New DataSet
        cmd.Fill(rs)
        DataGrid2.DataSource = rs
        DataGrid2.DataBind()
        myConnection.Close()
    End Sub
    Sub Datagrid_3()
        Dim sql As String
        sql = "Select * From U0352 where U0352AA='" & Request("sc") & "'"
        If myConnection.State = ConnectionState.Closed Then myConnection.Open()
        Dim cmd As SqlDataAdapter
        cmd = New SqlDataAdapter(sql, myConnection)
        Dim rs As DataSet = New DataSet
        cmd.Fill(rs)
        DataGrid3.DataSource = rs
        DataGrid3.DataBind()
        myConnection.Close()
    End Sub
    Sub Datagrid_4()
        Dim sql As String
        sql = "Select * From U0353 where U0353AA='" & Request("sc") & "'"
        If myConnection.State = ConnectionState.Closed Then myConnection.Open()
        Dim cmd As SqlDataAdapter
        cmd = New SqlDataAdapter(sql, myConnection)
        Dim rs As DataSet = New DataSet
        cmd.Fill(rs)
        DataGrid4.DataSource = rs
        DataGrid4.DataBind()
        myConnection.Close()
    End Sub
    Sub Datagrid_5()
        Dim sql As String
        sql = "Select * From U0354 where U0354AA='" & Request("sc") & "'"
        If myConnection.State = ConnectionState.Closed Then myConnection.Open()
        Dim cmd As SqlDataAdapter
        cmd = New SqlDataAdapter(sql, myConnection)
        Dim rs As DataSet = New DataSet
        cmd.Fill(rs)
        DataGrid5.DataSource = rs
        DataGrid5.DataBind()
        myConnection.Close()
    End Sub
End Class
