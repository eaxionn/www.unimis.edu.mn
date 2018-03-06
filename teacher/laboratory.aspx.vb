Imports System.data
Imports System.data.sqlclient


Namespace teacher

    Partial Class laboratory
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
                    Label2.Text = Request("lesscode") & " хичээлийн лабораторын сэдэвчилсэн телевлегее"
                    Hyperlink1.NavigateUrl = "Standart.aspx?lesscode=" & Request("lesscode")
                    Dim sql As String
                    Dim i As Integer = 1
                    If myConnection.State = ConnectionState.Closed Then myConnection.Open()
                    sql = "select * from U0354_2 where U0354AA='" & Request("lesscode") & "' order by convert(int,U0354BB)"
                    Dim cmd = New SqlCommand(sql, myConnection)
                    Dim dr = cmd.ExecuteReader()
                    While dr.Read()
                        If Not IsDBNull(dr("U0354CC")) Then CType(Me.FindControl("sedev" & i), TextBox).Text = dr("U0354CC")
                        If Not IsDBNull(dr("U0354DD")) Then CType(Me.FindControl("temdeglel" & i), TextBox).Text = dr("U0354DD")
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
            If myConnection.State = ConnectionState.Closed Then myConnection.Open()
            For i = 1 To 16
                Dim sedev As TextBox = CType(Me.FindControl("sedev" & i), TextBox)
                Dim temdeglel As TextBox = CType(Me.FindControl("temdeglel" & i), TextBox)
                temdeglel.Text = Left(IIf(IsDBNull(temdeglel.Text), "", temdeglel.Text), 340)
                sedev.Text = Left(IIf(IsDBNull(sedev.Text), "", sedev.Text), 250)
                'Call Labadd(Request("lesscode"), i, sedev.Text.Replace("'", "''"), temdeglel.Text.Replace("'", "''"), Session("tcode"))

                Dim strUpdateStmt As String
                strUpdateStmt = "if not exists (select * from U0354_2 where U0354AA='" & Request("lesscode") & "' and U0354BB=" & i & ")" & _
                " insert into U0354_2 values('" & Request("lesscode") & "'," & i & ",N'" & sedev.Text.Replace("'", "''") & "',N'" & temdeglel.Text.Replace("'", "''") & "',N'" & Session("tcode") & "') " & _
                " else " & _
                "update U0354_2 set U0354CC=N'" & sedev.Text.Replace("'", "''") & "',U0354DD=N'" & temdeglel.Text.Replace("'", "''") & "',U0354GG=N'" & Session("tcode") & "' where U0354AA=N'" & Request("lesscode") & "' and U0354BB=" & i

                Dim cmd = New SqlCommand(strUpdateStmt, myConnection)
                cmd.ExecuteNonQuery()

            Next
            myConnection.Close()
            Label1.Text = "Амжилттай бvртгэлээ!"
        End Sub

        Public Function Labadd(ByVal lessid As String, ByVal dhonog As Int16, ByVal sedev As String, ByVal temdeglel As String, ByVal tcode As String) As String
            Dim myCommand As New SqlCommand("LabAdd", myConnection)
            myCommand.CommandType = CommandType.StoredProcedure

            myCommand.Parameters.Add("@tcode", SqlDbType.VarChar, 25)
            myCommand.Parameters("@tcode").Value = tcode

            myCommand.Parameters.Add("@lcode", SqlDbType.VarChar, 25)
            myCommand.Parameters("@lcode").Value = lessid

            myCommand.Parameters.Add("@temdeglel", SqlDbType.VarChar, 500)
            myCommand.Parameters("@temdeglel").Value = temdeglel

            myCommand.Parameters.Add("@sedev", SqlDbType.VarChar, 500)
            myCommand.Parameters("@sedev").Value = sedev

            myCommand.Parameters.Add("@dhonog", SqlDbType.Int)
            myCommand.Parameters("@dhonog").Value = dhonog

            If myConnection.State = ConnectionState.Closed Then myConnection.Open()
            myCommand.ExecuteNonQuery()
            myConnection.Close()
            Labadd = ""
        End Function

    End Class
End Namespace
