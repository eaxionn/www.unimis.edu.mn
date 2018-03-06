Imports System.data
Imports System.data.sqlclient
Imports System.IO


Namespace teacher

    Partial Class PhotoView
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
            If Not zuser(Session("tcode"), Session("tpsss")) Then
                Response.Redirect("login.aspx")
            Else
                Dim sql As String = ""
                'Dim myConnection As New SqlConnection
                myConnection.ConnectionString = ConfigurationManager.AppSettings("ConnectionString")
                If Request("torol") = 1 Then
                    sql = "SELECT images FROM news where id=" & Request("id")
                ElseIf Request("torol") = 2 Then
                    sql = "SELECT images FROM Mend where id=" & Request("id")
                ElseIf Request("torol") = 3 Then
                    sql = "SELECT images FROM sanal_0 where id=" & Request("id")
                ElseIf Request("torol") = 4 Then
                    sql = "SELECT images FROM ab_header "
                ElseIf Request("torol") = 5 Then
                    sql = "SELECT images FROM security where id=" & Request("id")
                ElseIf Request("torol") = 6 Then
                    sql = "SELECT image as images FROM gallery where id=" & Request("id")
                End If
                Dim MyCommand As SqlCommand = New SqlCommand(sql, myConnection)
                If myConnection.State = ConnectionState.Closed Then myConnection.Open()
                Dim dr As SqlDataReader = MyCommand.ExecuteReader()
                If dr.Read() Then
                    Response.BinaryWrite(dr("images"))
                End If
                myConnection.Close()
            End If
        End Sub

    End Class

End Namespace
