Imports System.data
Imports System.data.sqlclient


Namespace teacher

    Partial Class myinfo
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
            'myConnection.ConnectionString = ConfigurationManager.AppSettings("ConnectionString")
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
                sql = "SELECT U41.U41AA, U41.U41BB, U41.U41CC, U41.U41EE, U41.U41GG, U41.U41HH, U41.U41II, SUR_L.SSS2, TEN_L.TTT3, ATA_L.ATA_NER,name=left(U41.U41HH,1)+'.'+U41.U41II "
                sql = sql & " FROM U41 LEFT OUTER JOIN "
                sql = sql & " SUR_L ON U41.U41BB = SUR_L.SSS1 LEFT OUTER JOIN "
                sql = sql & " TEN_L ON U41.U41CC = TEN_L.TTT2 LEFT OUTER JOIN "
                sql = sql & " ATA_L ON U41.U41DD = ATA_L.ATA_KOD "
                sql = sql & " WHERE     (U41.U41EE = @tid)   "
                Dim cmd = New SqlCommand(sql, myConnection)
                cmd.Parameters.Add(New SqlParameter("@tid", SqlDbType.VarChar, 25))
                cmd.Parameters("@tid").Value = Session("tcode")
                Dim dr As SqlDataReader
                dr = cmd.ExecuteReader()
                If dr.Read() Then
                    Session("teachName") = IIf(Not IsDBNull(dr("name")), dr("name"), "")
                    Label1.Text = IIf(Not IsDBNull(dr("name")), dr("name"), "") & " /" & IIf(Not IsDBNull(dr(3)), dr(3), "") & "/"
                    Label2.Text = IIf(Not IsDBNull(dr(7)), dr(7), "")
                    Label3.Text = IIf(Not IsDBNull(dr("TTT3")), dr("TTT3"), "")
                    Label4.Text = IIf(Not IsDBNull(dr("ATA_NER")), dr("ATA_NER"), "")
                End If
                dr.Close()
                myConnection.Close()
            End If
        End Sub
    End Class

End Namespace
