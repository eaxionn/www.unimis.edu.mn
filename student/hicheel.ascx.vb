Imports System.data
Imports System.data.sqlclient
Imports System.Web.Security
'Imports student.Module1

Partial Class hicheel
    Inherits System.Web.UI.UserControl
    Dim myConnection As New SqlConnection
    Public total As Double

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        myConnection.ConnectionString = ConfigurationManager.AppSettings("ConnectionString")
        Dim sql As String
        If myConnection.State = ConnectionState.Closed Then myConnection.Open()
        'sql = "SELECT U0362DD as lesscode,'/'+U0362DD+'/<br>'+U035DD as lessname FROM U0362 INNER JOIN U035 ON U0362.U0362DD = U035.U035CC INNER JOIN "
        'sql = sql & " main ON U0362.U0362BB = main.q2 AND U0362.U0362YY = main.q1 WHERE     (U0362.U0362GG = '2') and U0362EE='" & Session("tcode") & "'  "
        'sql = sql & " group by U0362DD,U035DD "
        sql = "select U035EE,U035DD as lessname,U0362.* from U0362 " & _
        " inner join main on  U0362BB=q2 and U0362YY=q1  " & _
        " inner join U035 on  U0362DD=U035CC " & _
        " where U0362AA='" & Session("u1000") & "' and U0362GG=2 "
        Dim cmd As SqlDataAdapter
        cmd = New SqlDataAdapter(sql, myConnection)
        'cmd.Parameters.Add(New SqlParameter("@tid", SqlDbType.VarChar, 25))
        'cmd.Parameters("@tid").Value = Session("tcode")
        Dim rs As DataSet = New DataSet
        cmd.Fill(rs)
        DataGrid1.DataSource = rs
        DataGrid1.DataBind()
        myConnection.Close()
    End Sub

    Sub Item_Bound(ByVal sender As Object, ByVal e As DataGridItemEventArgs)
        Select Case e.Item.ItemType
            Case ListItemType.Item, ListItemType.AlternatingItem
                Dim sonoo As Label = CType(e.Item.FindControl("U035EE"), Label)
                total += CType(sonoo.Text, Double)
            Case ListItemType.Footer
                e.Item.Cells(0).Text = "<b>Нийт: </b>"
                e.Item.Cells(1).Text = "<font color='#CC0000'>" & total & "</font>"
        End Select
    End Sub 'Item_Bound 
End Class
