Imports System.data
Imports System.data.sqlclient
Imports System.Web.Security
'Imports student.Module1

Partial Class dun
    Inherits System.Web.UI.Page
    Dim myConnection As New SqlConnection
    Public total As Double
    Public cnt As Integer

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
            Dim sql As String
            If myConnection.State = ConnectionState.Closed Then myConnection.Open()
            cnt = 1
            'sql = "select U035EE,U035DD as lessname,U0362.* from U0362 " & _
            '" inner join main on  U0362BB=q2 and U0362YY=q1  " & _
            '" inner join U035 on  U0362DD=U035CC " & _
            '" where U0362AA='" & Session("u1000") & "' and U0362GG=2 "

            sql = "select U503.*,hname from U503 " & _
            " inner join (select UN_KOD,UN_NER+' /'+convert(varchar(5),U0355CC)+'/' as hname from U0355 " & _
            " inner join UN_L on U0355BB=UN_KOD " & _
            " where U0355AA='" & Request("lcode") & "') as aa  on U503DD=UN_KOD" & _
            " inner join main on U503NN=q1 and U503GG=q2" & _
            " where U503CC='" & Session("u1000") & "' and U503BB='" & Request("lcode") & "' order by U503DD"

            Dim cmd As SqlDataAdapter
            cmd = New SqlDataAdapter(sql, myConnection)
            Dim rs As DataSet = New DataSet
            cmd.Fill(rs)
            DataGrid1.DataSource = rs
            DataGrid1.DataBind()
            myConnection.Close()
        End If
    End Sub
    Sub Increaser(ByVal sender As Object, ByVal e As EventArgs)
        cnt = cnt + 1
    End Sub
    Sub Item_Bound(ByVal sender As Object, ByVal e As DataGridItemEventArgs)
        Select Case e.Item.ItemType
            Case ListItemType.Item, ListItemType.AlternatingItem
                Dim sonoo As Label = CType(e.Item.FindControl("dun"), Label)
                total += CType(sonoo.Text, Double)
            Case ListItemType.Footer
                e.Item.Cells(1).Text = "<b>Нийт: </b>"
                e.Item.Cells(2).Text = "<font color='#CC0000'>" & total & "</font>"
        End Select
    End Sub 'Item_Bound 
End Class
