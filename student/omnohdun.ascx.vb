Imports System.data
Imports System.data.sqlclient
Imports System.Web.Security
'Imports student.Module1

Partial Class omnohdun
    Inherits System.Web.UI.UserControl
    Public cnt, ltypes As Integer
    Public SUMCR, SUMCH, SUMONOO As Double
    Public jil As String
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
            Dim sql As String
            If myConnection.State = ConnectionState.Closed Then myConnection.Open()
            'sql = "select U0364CC, U0364FF, U0364GG, U035CC, U035DD, U035EE=Convert(float,U035EE), U0364KK, U0364LL, U0364MM, POINT=isnull(Convert(float,POINT),0) , U0351BB, U0351CC from " & _
            '" U0364A  INNER JOIN U035 on U035CC=U0364EE " & _
            '" LEFT JOIN GPA_L on ALPHA=U0364CC " & _
            '" LEFT JOIN U0351 on U0351AA=U0364EE and U0351BB=U0364HH " & _
            '" where U0364DD='" & Session("u1000") & "'  " & _
            '" and U0364FF='" & Left(jil, 9) & "' and U0364GG='" & Right(jil, 1) & "' " & _
            '"   union " & _
            '" select U0364CC, U0364FF, U0364GG, U035CC, U035DD, U035EE=Convert(float,U035EE), U0364KK, U0364LL, U0364MM, POINT=isnull(Convert(float,POINT),0) , U0351BB, U0351CC from " & _
            '" U0364   INNER JOIN U035 on U035CC=U0364EE " & _
            '" LEFT JOIN GPA_L on ALPHA=U0364CC " & _
            '" LEFT JOIN U0351 on U0351AA=U0364EE and U0351BB=U0364HH " & _
            '" where U0364DD='" & Session("u1000") & " '  and U0364FF='" & Left(jil, 9) & "' and U0364GG='" & Right(jil, 1) & "' "

            sql = "exec rp_st_dvn '" & Session("u1000") & " ','" & Left(Session("u1000"), 1) & "','" & Left(jil, 9) & "'," & Right(jil, 1) & ",0"
            'Label1.Text = sql
            'Exit Sub
            Dim cmd As SqlDataAdapter
            cmd = New SqlDataAdapter(sql, myConnection)
            Dim rs As DataSet = New DataSet
            cmd.Fill(rs)
            DataGrid1.DataSource = rs
            DataGrid1.DataBind()
            myConnection.Close()
        End If
    End Sub

    Sub Item_Bound(ByVal sender As Object, ByVal e As DataGridItemEventArgs)
        Select Case e.Item.ItemType
            Case ListItemType.Item, ListItemType.AlternatingItem
                'Dim sonoo As Label = CType(e.Item.FindControl("dun"), Label)
                'If e.Item.Cells(6).Text <> "R" Then
                Dim kredit As Double = CType(e.Item.Cells(10).Text, Double)
                Dim golch As Double = CType(e.Item.Cells(11).Text, Double)
                'Dim onoo As Double = CType(e.Item.Cells(3).Text, Double) + CType(e.Item.Cells(4).Text, Double)
                SUMCR = kredit
                SUMCH = golch
                'e.Item.Cells(5).Text = onoo
                'End If
            Case ListItemType.Footer
                e.Item.Cells(1).Text = "<b>Нийт кредит :</b>"
                e.Item.Cells(2).Text = "<b><font color='#CC0000'>" & Format(SUMCH, "###0.0") & "</font></b>"
                e.Item.Cells(6).Text = "<b>Vн.Голч :</b>"
                e.Item.Cells(7).Text = "<b><font color='#CC0000'>" & Format(SUMCR, "###0.0") & "</font></b>"

        End Select
    End Sub 'Item_Bound 
End Class
