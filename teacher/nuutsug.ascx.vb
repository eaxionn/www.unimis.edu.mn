Imports System.data
Imports System.data.sqlclient


Namespace teacher

    Partial Class nuutsug
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
            End If
        End Sub
        Private Sub linkButton1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles linkButton1.Click
            Panel1.Visible = False
            Panel2.Visible = True
        End Sub
        Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
            Panel1.Visible = True
            Panel2.Visible = False
        End Sub
        Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
            If myConnection.State = ConnectionState.Closed Then myConnection.Open()
            Dim sql As String
            sql = "select * from U31 where U31AA='" & Session("tcode") & "' and U31BB=isnull(@nuutsug,'') "
            Dim cmd = New SqlCommand(sql, myConnection)
            cmd.Parameters.Add(New SqlParameter("@nuutsug", SqlDbType.VarChar, 50))
            cmd.Parameters("@nuutsug").Value = IIf(Replace(TextBox1.Text, "'", "''") = "", "", Replace(TextBox1.Text, "'", "''"))
            'Dim dr As SqlDataReader
            Dim dr = cmd.ExecuteReader()
            If Not dr.Read() Then
                Label1.Text = "Хуучин нууц vг буруу байна !"
                Exit Sub
            End If
            dr.Close()
            If Replace(TextBox2.Text, "'", "''") <> Replace(TextBox3.Text, "'", "''") Then
                Label1.Text = "Шинэ нууц vг давтан зев оруулна уу ! "
                Exit Sub
            End If
            sql = "update U31 set U31BB=@nuutsug where U31AA='" & Session("tcode") & "' "
            cmd = New SqlCommand(sql, myConnection)
            cmd.Parameters.Add(New SqlParameter("@nuutsug", SqlDbType.VarChar, 30))
            cmd.Parameters("@nuutsug").Value = IIf(Replace(TextBox2.Text, "'", "''") = "", "", Replace(TextBox2.Text, "'", "''"))
            cmd.ExecuteNonQuery()
            myConnection.Close()
            Panel1.Visible = True
            Panel2.Visible = False
            Label1.Text = "Амжилттай солигдлооо !"
        End Sub
    End Class

End Namespace
