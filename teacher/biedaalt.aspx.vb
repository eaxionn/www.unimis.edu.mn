Imports System.data
Imports System.data.sqlclient


Namespace teacher

    Partial Class biedaalt
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
        Public cnt As Integer
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
                Response.Expires = -1
                If Session("tcode") = "" Then
                    Response.Redirect("login.aspx")
                End If
                If Not IsPostBack Then
                    Label2.Text = Request("lesscode") & " хичээлийн бие даалт"
                    Hyperlink1.NavigateUrl = "Standart.aspx?lesscode=" & Request("lesscode")
                    Dim sql As String
                    Dim i As Integer = 1
                    If myConnection.State = ConnectionState.Closed Then myConnection.Open()
                    sql = "select * from U0353 where U0353AA='" & Request("lesscode") & "' order by convert(int,U0353BB)"
                    Dim cmd = New SqlCommand(sql, myConnection)
                    Dim dr = cmd.ExecuteReader()
                    While dr.Read()
                        If Not IsDBNull(dr("U0353CC")) Then CType(Me.FindControl("TextBox" & i), TextBox).Text = dr("U0353CC")
                        If Not IsDBNull(dr("U0353DD")) Then CType(Me.FindControl("onoo" & i), TextBox).Text = dr("U0353DD")
                        i = i + 1
                        If i = 16 Then Exit While
                    End While
                    dr.Close()
                    myConnection.Close()
                End If
            End If
        End Sub
        Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
            Dim i As Integer
            'Dim strUpdateStmt As String
            If myConnection.State = ConnectionState.Closed Then myConnection.Open()
            For i = 1 To 12
                Dim sedev As TextBox = CType(Me.FindControl("TextBox" & i), TextBox)
                Dim onoo As TextBox = CType(Me.FindControl("onoo" & i), TextBox)
                onoo.Text = IIf(IsDBNull(onoo.Text), "", onoo.Text)
                sedev.Text = Left(IIf(IsDBNull(sedev.Text), "", sedev.Text), 200)
                'Call Biedaaltadd(Request("lesscode"), i, sedev.Text.Replace("'", "''"), onoo.Text.Replace("'", "''"), Session("tcode"))

                Dim strUpdateStmt As String
                strUpdateStmt = "if not exists (select * from U0353 where U0353AA='" & Request("lesscode") & "' and U0353BB=" & i & ")" & _
                " insert into U0353 values('" & Request("lesscode") & "'," & i & ",N'" & sedev.Text.Replace("'", "''") & "','" & onoo.Text.Replace("'", "''") & "',N'" & Session("tcode") & "') " & _
                " else " & _
                "update U0353 set U0353CC=N'" & sedev.Text.Replace("'", "''") & "',U0353DD='" & onoo.Text.Replace("'", "''") & "',U0353GG=N'" & Session("tcode") & "' where U0353AA=N'" & Request("lesscode") & "' and U0353BB=" & i

                Dim cmd = New SqlCommand(strUpdateStmt, myConnection)
                cmd.ExecuteNonQuery()

            Next
            myConnection.Close()
            Label1.Text = "Амжилттай бvртгэлээ!"
        End Sub

        Public Function Biedaaltadd(ByVal lessid As String, ByVal dhonog As Int16, ByVal sedev As String, ByVal onoo As String, ByVal tcode As String) As String
            Dim myCommand As New SqlCommand("BiedaaltAdd", myConnection)
            myCommand.CommandType = CommandType.StoredProcedure

            myCommand.Parameters.Add("@tcode", SqlDbType.VarChar, 25)
            myCommand.Parameters("@tcode").Value = tcode

            myCommand.Parameters.Add("@lcode", SqlDbType.VarChar, 25)
            myCommand.Parameters("@lcode").Value = lessid

            myCommand.Parameters.Add("@onoo", SqlDbType.VarChar, 2)
            myCommand.Parameters("@onoo").Value = onoo

            myCommand.Parameters.Add("@sedev", SqlDbType.VarChar, 1500)
            myCommand.Parameters("@sedev").Value = sedev

            myCommand.Parameters.Add("@dhonog", SqlDbType.Int)
            myCommand.Parameters("@dhonog").Value = dhonog

            'myCommand.Parameters.Add("@RetValue", SqlDbType.SmallInt)
            'myCommand.Parameters("@RetValue").Direction = ParameterDirection.ReturnValue

            If myConnection.State = ConnectionState.Closed Then myConnection.Open()
            myCommand.ExecuteNonQuery()
            'AddDun = myCommand.Parameters("@RetValue").Value
            myConnection.Close()
            Biedaaltadd = ""
        End Function

    End Class
End Namespace
