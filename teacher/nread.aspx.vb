Imports System.data
Imports System.data.sqlclient


Namespace teacher

    Partial Class nread
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
                    Dim sql
                    If myConnection.State = ConnectionState.Closed Then myConnection.Open()
                    sql = "SELECT * FROM news where id=@newsid "
                    Dim cmd = New SqlCommand(sql, myConnection)
                    cmd.Parameters.Add(New SqlParameter("@newsid", SqlDbType.Int))
                    cmd.Parameters("@newsid").Value = Request("id")

                    Dim dr As SqlDataReader
                    dr = cmd.ExecuteReader()
                    If dr.Read() Then
                        subject.Text = dr("subject")
                        descrebtion.Text = dr("descreb1")
                        If Trim(dr("img")) = 1 Then
                            Image1.ImageUrl = "PhotoView.aspx?torol=1&id=" & dr("id")
                            Image1.Visible = True
                        End If
                        henees.Text = "ìýäýýëýã÷: " & Session("tcode")
                        ognoo.Text = "oãíoo: " & dr("ognoo")
                    End If
                    dr.Close()
                End If
            End If
        End Sub

    End Class

End Namespace
