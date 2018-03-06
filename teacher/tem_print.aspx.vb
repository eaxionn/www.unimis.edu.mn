Imports System.data
Imports System.data.sqlclient
Imports teacher.Module1

Partial Class tem_print
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
    Public Total, Total1, Total2 As Integer
    Public cnt As Integer = 0
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
                cnt = 1
                Call teach_inf()
                Call Datagrid()
                Call Datagrid_sum()
                'Label7.Text = Now.Year & " оны " & Now.Month & " сар"
            End If
        End If
    End Sub
    Sub Datagrid()
        Dim sql As String = "select temdeglel.*,lessname from temdeglel inner join lesstype on ltype=[id]  where lesscode='" & Request("lesscode") & "' and tcode='" & Session("tcode") & "' and ognoo between '" & Request("ognoo1") & "' and '" & Request("ognoo2") & "' order by ognoo"
        'Label7.Text = sql
        'Exit Sub
        If myConnection.State = ConnectionState.Closed Then myConnection.Open()
        Dim cmd As SqlDataAdapter
        cmd = New SqlDataAdapter(sql, myConnection)
        Dim rs As DataSet = New DataSet
        cmd.Fill(rs)
        DataGrid1.DataSource = rs
        DataGrid1.DataBind()
        myConnection.Close()
    End Sub
    Sub Datagrid_sum()
        Dim sql As String = "exec tsagiin_negtgel '" & Request("lesscode") & "','" & Session("tcode") & "','" & Request("ognoo1") & "','" & Request("ognoo2") & "'"
        If myConnection.State = ConnectionState.Closed Then myConnection.Open()
        Dim cmd As SqlDataAdapter
        cmd = New SqlDataAdapter(sql, myConnection)
        Dim rs As DataSet = New DataSet
        cmd.Fill(rs)
        DataGrid2.DataSource = rs
        DataGrid2.DataBind()
        myConnection.Close()
    End Sub
    Sub Increaser(ByVal sender As Object, ByVal e As EventArgs)
        cnt = cnt + 1
    End Sub
    Sub Item_Bound(ByVal sender As Object, ByVal e As DataGridItemEventArgs)
        Select Case e.Item.ItemType
            Case ListItemType.Item, ListItemType.AlternatingItem
                Total += CType(e.Item.Cells(5).Text, Double)
                '-------- sumo too ------
            Case ListItemType.Footer
                e.Item.Cells(4).Text = "<b>БVГД : </b>"
                e.Item.Cells(5).Text = Total
        End Select
    End Sub 'Item_Bound 
    Sub Item_Bound1(ByVal sender As Object, ByVal e As DataGridItemEventArgs)
        Select Case e.Item.ItemType
            Case ListItemType.Item, ListItemType.AlternatingItem
                Total1 += CType(e.Item.Cells(2).Text, Double)
                Total2 += CType(e.Item.Cells(3).Text, Double)
                '-------- sumo too ------
            Case ListItemType.Footer
                e.Item.Cells(1).Text = "<b>Бvгд цаг</b>"
                e.Item.Cells(2).Text = Total1
                e.Item.Cells(3).Text = Total2
        End Select
    End Sub 'Item_Bound 
    Sub teach_inf()
        Dim sql As String
        sql = "SELECT U41.U41AA, U41.U41BB, U41.U41CC, U41.U41EE, U41.U41GG, U41.U41HH, U41.U41II, SUR_L.SSS2, TEN_L.TTT3,  " & _
                      " ATA_L.ATA_NER,isnull(EZ_L.EZ_NER,'')EZ_NER, isnull(EC_L.EC_NER,'')EC_NER " & _
                      " FROM EC_L INNER JOIN " & _
                      " U415 ON EC_L.EC_KOD = U415.U415EE INNER JOIN " & _
                      " EZ_L ON U415.U415FF = EZ_L.EZ_KOD RIGHT OUTER JOIN " & _
                      " U41 LEFT OUTER JOIN " & _
                      " SUR_L ON U41.U41BB = SUR_L.SSS1 LEFT OUTER JOIN " & _
                      " TEN_L ON U41.U41CC = TEN_L.TTT2 LEFT OUTER JOIN " & _
                      " ATA_L ON U41.U41DD = ATA_L.ATA_KOD ON U415.U415AA = U41.U41AA " & _
                      " WHERE     (U41.U41EE = @tid)"
        'sql = "SELECT U41.U41AA, U41.U41BB, U41.U41CC, U41.U41EE, U41.U41GG, U41.U41HH, U41.U41II, SUR_L.SSS2, TEN_L.TTT3, ATA_L.ATA_NER "
        'sql = sql & " FROM U41 LEFT OUTER JOIN "
        'sql = sql & " SUR_L ON U41.U41BB = SUR_L.SSS1 LEFT OUTER JOIN "
        'sql = sql & " TEN_L ON U41.U41CC = TEN_L.TTT2 LEFT OUTER JOIN "
        'sql = sql & " ATA_L ON U41.U41DD = ATA_L.ATA_KOD "
        'sql = sql & " WHERE     (U41.U41EE = @tid)   "
        'Response.Write(sql)
        'Exit Sub
        If myConnection.State = ConnectionState.Closed Then myConnection.Open()
        Try
            Dim cmd = New SqlCommand(sql, myConnection)
            cmd.Parameters.Add(New SqlParameter("@tid", SqlDbType.VarChar, 25))
            cmd.Parameters("@tid").Value = Session("tcode")
            Dim dr As SqlDataReader
            dr = cmd.ExecuteReader()
            If dr.Read() Then
                Label1.Text = IIf(Not IsDBNull(dr(7)), dr(7), "")
                Label2.Text = IIf(Not IsDBNull(dr("TTT3")), dr("TTT3"), "")
                Label3.Text = IIf(Not IsDBNull(dr("ATA_NER")), dr("ATA_NER"), "")
                Label4.Text = IIf(Not IsDBNull(dr("U41II")), Left(dr("U41HH"), 1) & "." & dr("U41II"), "") & " /" & Session("tcode") & "/"
                Label5.Text = dr("EZ_NER") & " " & dr("EC_NER")
                Label6.Text = Request("lesscode")
            End If
            dr.Close()
        Catch ex As Exception

        End Try

        myConnection.Close()

    End Sub
End Class


