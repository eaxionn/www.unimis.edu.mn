Imports System.data
Imports System.data.sqlclient


Namespace teacher

    Partial Class huvaari1
        Inherits System.Web.UI.UserControl
        Public odor As Int16
        Public ltypes As Integer
        Public cnt As Integer
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
                cnt = 1
                If myConnection.State = ConnectionState.Closed Then myConnection.Open()
                sql = "select LESSON_KOD,LESSON_TYPE from NTIMETABLE where LTEACHER='" & Session("tcode") & "' group by LESSON_KOD,LESSON_TYPE"
                Dim cmd As SqlDataAdapter
                cmd = New SqlDataAdapter(sql, myConnection)
                Dim rs As DataSet = New DataSet
                cmd.Fill(rs)
                DataGrid1.DataSource = rs
                DataGrid1.DataBind()
                myConnection.Close()
            End If
        End Sub
        Sub Increaser(ByVal sender As Object, ByVal e As EventArgs)
            cnt = cnt + 1
        End Sub

        Private Sub DataGrid1_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles DataGrid1.SelectedIndexChanged

        End Sub
    End Class

End Namespace
