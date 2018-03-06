Imports System.data
Imports System.data.sqlclient


Namespace teacher

    Partial Class Standart
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
                    'Dim sql As String
                    If myConnection.State = ConnectionState.Closed Then myConnection.Open()
                    Dim cmd = New SqlCommand("select * from U035 where U035CC='" & Request("lesscode") & "'", myConnection)
                    Dim dr = cmd.ExecuteReader()
                    If dr.Read() Then
                        If Not IsDBNull(dr("U035DD")) Then Label1.Text = Trim(dr("U035DD"))
                        If Not IsDBNull(dr("U035EE")) Then Label2.Text = Trim(Request("lesscode")) & "    /кредит " & dr("U035EE") & "/"
                        If Not IsDBNull(dr("U035KK")) Then TextBox1.Text = Trim(dr("U035KK"))
                        If Not IsDBNull(dr("U035LL")) Then TextBox2.Text = Trim(dr("U035LL"))
                        If Not IsDBNull(dr("U035MM")) Then TextBox3.Text = Trim(dr("U035MM"))
                        If Not IsDBNull(dr("U035NN")) Then TextBox4.Text = Trim(dr("U035NN"))
                    End If
                    dr.Close()
                    myConnection.Close()
                End If
            End If
        End Sub

        Private Sub Button6_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button6.Click
            Dim strUpdateStmt As String
            strUpdateStmt = "UPDATE U035 SET " & _
         "U035KK = N'" & Replace(TextBox1.Text, "'", "''") & "', " & _
         "U035LL = N'" & Replace(TextBox2.Text, "'", "''") & "', " & _
         "U035MM = N'" & Replace(TextBox3.Text, "'", "''") & "', " & _
         "U035NN = N'" & Replace(TextBox4.Text, "'", "''") & "' " & _
         "WHERE U035CC = '" & Request("lesscode") & "'"
            If myConnection.State = ConnectionState.Closed Then myConnection.Open()
            Dim cmd = New SqlCommand(strUpdateStmt, myConnection)
            cmd.ExecuteNonQuery()
            myConnection.Close()
            Label3.Text = "Амжилттай бvртгэлээ!"
            'Label3.Text = strUpdateStmt
        End Sub
        Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
            Response.Redirect("sbichig.aspx?lesscode=" & Request("lesscode") & "")
        End Sub
        Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
            Response.Redirect("biedaalt.aspx?lesscode=" & Request("lesscode") & "")
        End Sub
        Private Sub Button3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button3.Click
            Response.Redirect("lecture.aspx?lesscode=" & Request("lesscode") & "")
        End Sub
        Private Sub Button4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button4.Click
            Response.Redirect("seminar.aspx?lesscode=" & Request("lesscode") & "")
        End Sub
        Private Sub Button5_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button5.Click
            Response.Redirect("laboratory.aspx?lesscode=" & Request("lesscode") & "")
        End Sub
    End Class

End Namespace
