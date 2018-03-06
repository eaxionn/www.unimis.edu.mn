Imports System.data
Imports System.data.sqlclient


Namespace teacher

    Partial Class tsalin
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
        Dim myConnection2 As New SqlConnection

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
            'myConnection2.ConnectionString = ConfigurationManager.AppSettings("ConnectionString2")
            If Not zuser(Session("tcode"), Session("tpsss")) Then
                Response.Redirect("login.aspx")
            Else
                Dim sql As String
                Dim regs As String = ""

                If myConnection.State = ConnectionState.Closed Then myConnection.Open()
                sql = "select upper(U41AA)from U41 where U41EE='" & Session("tcode") & "'"
                Dim cmd = New SqlCommand(sql, myConnection)
                Dim dr As SqlDataReader
                dr = cmd.ExecuteReader()
                If dr.Read() Then
                    regs = dr(0)
                    Label14.Text = regs
                End If
                dr.Close()
                myConnection.Close()

                If Session("tcode") <> "M.EC09" And (Left(Session("tcode"), 1) = "M" Or Left(Session("tcode"), 1) = "A" Or Left(Session("tcode"), 1) = "H") Then
                    myConnection2.ConnectionString = ConfigurationManager.AppSettings("ConnectionString3")
                Else
                    myConnection2.ConnectionString = ConfigurationManager.AppSettings("ConnectionString2")
                End If
                If myConnection2.State = ConnectionState.Closed Then myConnection2.Open()
                sql = "exec chuk_tsalinview1 '" & regs & "'"
                Dim cmd2 = New SqlCommand(sql, myConnection2)
                Dim dr2 As SqlDataReader
                dr2 = cmd2.ExecuteReader()
                If dr2.Read() Then
                    Label1.Text = Val(dr2(10)) & " ò.í"
                    Label2.Text = Val(dr2(5))
                    Label3.Text = Val(dr2(6)) & " ò.í"
                    Label4.Text = Val(dr2(7)) & " ò.í"
                    Label5.Text = Val(dr2(8)) & " ò.í"
                    Label6.Text = Val(dr2(9)) & " ò.í"
                End If
                dr2.Close()
                'myConnection2.Close()
                'If myConnection2.State = ConnectionState.Closed Then myConnection2.Open()
                sql = "exec chuk_tsalinview2 '" & regs & "'"
                Dim cmd3 = New SqlCommand(sql, myConnection2)
                Dim dr3 As SqlDataReader
                dr3 = cmd3.ExecuteReader()
                If dr3.Read() Then
                    Label7.Text = Val(dr3(10)) & " ò.í"
                    Label8.Text = Val(dr3(5))
                    Label9.Text = Val(dr3(6)) & " ò.í"
                    Label10.Text = Val(dr3(7)) & " ò.í"
                    Label11.Text = Val(dr3(8)) & " ò.í"
                    Label12.Text = Val(dr3(9)) & " ò.í"
                End If
                dr3.Close()
                myConnection2.Close()
                Label13.Text = (Val(Label1.Text) + Val(Label7.Text)) & " ò.í"
            End If
        End Sub
    End Class

End Namespace
