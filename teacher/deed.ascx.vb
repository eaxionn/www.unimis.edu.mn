Imports System.data
Imports System.data.sqlclient


Namespace teacher

    Partial Class deed
        Inherits System.Web.UI.UserControl
        Dim myConnection As New SqlConnection
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
        Function zuser(ByVal usr As String, ByVal pwd As String) As Boolean
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
            End If
            If Not Page.IsPostBack Then
                hjilFind()
            End If
        End Sub

        Sub hjilFind()
            Dim sql As String
            myConnection.Close()
            If myConnection.State = ConnectionState.Closed Then myConnection.Open()
            sql = "select * from main"
            Dim cmd = New SqlCommand(sql, myConnection)
            Dim dr As SqlDataReader
            dr = cmd.ExecuteReader()
            If dr.Read() Then
                Session("hichjil") = dr("q1")
                Session("hichses") = dr("q2")
            End If
            dr.Close()
            myConnection.Close()
        End Sub

        Private Sub linkButton1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles LinkButton1.Click
            Session.Clear()
            Session.Abandon()
            Response.Redirect("login.aspx")
        End Sub

        Private Sub linkButton2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles LinkButton2.Click
            Response.Redirect("index.aspx")
        End Sub
    End Class

End Namespace
