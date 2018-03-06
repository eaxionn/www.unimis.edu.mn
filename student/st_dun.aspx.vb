Imports System.data
Imports System.data.sqlclient
Imports System.Web.Security
'Imports student.Module1

Partial Class st_dun
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
            Hicheeliinjil()
        End If
    End Sub
    Sub Hicheeliinjil()
        Dim sql As String
        If myConnection.State = ConnectionState.Closed Then myConnection.Open()
        Dim cmd As SqlDataAdapter
        sql = "SELECT U0364FF+convert(varchar(1),U0364GG) aa, UL_NER from U0364A LEFT JOIN UL_L on UL_KOD=U0364GG " & _
        " where U0364DD='" & Session("u1000") & "' group BY U0364FF, U0364GG, UL_NER " & _
        " union all " & _
        " SELECT U0364FF+convert(varchar(1),U0364GG) aa, UL_NER from U0364 LEFT JOIN UL_L on UL_KOD=U0364GG " & _
        " where U0364DD='" & Session("u1000") & "' group BY U0364FF, U0364GG, UL_NER order by U0364FF+convert(varchar(1),U0364GG)"
        cmd = New SqlDataAdapter(sql, myConnection)
        'Label1.Text = sql
        'Exit Sub
        Dim rs As DataSet = New DataSet
        cmd.Fill(rs)
        DataGrid1.DataSource = rs
        DataGrid1.DataBind()
        myConnection.Close()
    End Sub
End Class
