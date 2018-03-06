Imports System.data
Imports System.data.sqlclient
Imports System.IO


Namespace teacher

    Partial Class index
        Inherits System.Web.UI.Page
        Public cnt As Integer
        Public paths As String = "blank.ascx"
        Dim UC As UserControl
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
                End If
            End If
            'If (Request("page") = 2) Then
            'paths = "studentlist.ascx"
            'Session("lcode") = Request("lesscode")
            'Session("huvID") = Request("huvaariID")
            'Session("ltype") = Request("ltype")
            'Else
            'paths = "blank.ascx"
            'End If
            'If System.IO.File.Exists(Request.PhysicalApplicationPath & paths) Then
            'UC = CType(LoadControl(paths), UserControl)
            'PlaceHolder1.Controls.Add(UC)
            'Else
            'UC = CType(LoadControl("underCunstruction.ascx"), UserControl)
            'End If

        End Sub
    End Class
End Namespace
