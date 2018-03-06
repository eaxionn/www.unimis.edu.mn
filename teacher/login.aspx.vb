Imports System.data
Imports System.data.sqlclient
Imports System.Web.Security


Namespace teacher

    Partial Class WebForm1
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
        Dim myConnection As New SqlConnection

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
            If Not Request("tcode") = "" Then
                TextBox1.Text = Request("tcode")
                TextBox2.Text = Request("tpass")
            End If
        End Sub
        Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
            Call users()
        End Sub
        Private Sub users()
            TextBox1.Text = Replace(TextBox1.Text, "'", "")
            TextBox2.Text = Replace(TextBox2.Text, "'", "")
            If zuser(TextBox1.Text, TextBox2.Text) Then
                Session("tcode") = TextBox1.Text
                Session("tpsss") = TextBox2.Text
                Dim tkt As FormsAuthenticationTicket
                Dim cookiestr As String
                Dim ck As HttpCookie

                tkt = New FormsAuthenticationTicket(1, TextBox1.Text, DateTime.Now(), _
                DateTime.Now.AddDays(7), CheckBox1.Checked, "your custom data")
                cookiestr = FormsAuthentication.Encrypt(tkt)
                ck = New HttpCookie(FormsAuthentication.FormsCookieName(), cookiestr)
                If (CheckBox1.Checked) Then ck.Expires = tkt.Expiration
                ck.Path = FormsAuthentication.FormsCookiePath()
                Response.Cookies.Add(ck)
                'End If
                Response.Redirect("index.aspx")
            Else
                Label1.Text = "Нууц vг буруу байна!"
            End If
        End Sub
    End Class

End Namespace
