Imports System.data
Imports System.data.sqlclient


Namespace teacher

    Partial Class zaahlesson
        Inherits System.Web.UI.UserControl
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
                Dim sql As String
                If myConnection.State = ConnectionState.Closed Then myConnection.Open()
                sql = " SELECT U0362DD as lesscode,'<strong>'+U0362DD+'</strong> '+U035DD as lessname, count( U0362.U0362AA) as scount  FROM U0362 INNER JOIN U035 ON U0362.U0362DD = U035.U035CC INNER JOIN " & _
                    " main ON U0362.U0362BB = main.q2 AND U0362.U0362YY = main.q1 WHERE  U0362.U0362AA in (select U021EE from U021 ) and   (U0362.U0362GG = '2') and U0362EE='" & Session("tcode") & "' " & _
                    " group by U0362DD,U035DD"
                Dim cmd As SqlDataAdapter
                cmd = New SqlDataAdapter(sql, myConnection)
                'cmd.Parameters.Add(New SqlParameter("@tid", SqlDbType.VarChar, 25))
                'cmd.Parameters("@tid").Value = Session("tcode")
                Dim rs As DataSet = New DataSet
                cmd.Fill(rs)
                DataGrid1.DataSource = rs
                DataGrid1.DataBind()
                myConnection.Close()
            End If
        End Sub
    End Class

End Namespace
