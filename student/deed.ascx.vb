Imports System.data
Imports System.data.sqlclient
Imports System.Web.Security
'Imports student.Module1

Partial Class deed
    Inherits System.Web.UI.UserControl
    Dim myConnection As New SqlConnection

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        myConnection.ConnectionString = ConfigurationManager.AppSettings("ConnectionString")
        If Not zuser(Session("u1000"), Session("psss")) Then
            Response.Redirect("login.aspx")
        Else
            Call student_inf()
            Call Golch_inf()
            Call Sumkr_inf()
            Call Stud_UL()
        End If
    End Sub
    'Protected Sub page_()

    Function zuser(ByVal usr As String, ByVal pwd As String) As Boolean
        myConnection.ConnectionString = ConfigurationManager.AppSettings("ConnectionString")
        Dim sql As String
        If myConnection.State = ConnectionState.Closed Then myConnection.Open()
        sql = "select * from U25 where U25AA='" & usr & "' and U25BB='" & pwd & "'"
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

    Sub student_inf()
        Dim sql As String
        If myConnection.State = ConnectionState.Closed Then myConnection.Open()
        sql = "SELECT now=(select q1+' /'+UL_NER+'/' from main inner join UL_L on UL_KOD=q2)," & _
                "U021EE AS StKod, Left(U021GG,1)+'.'+U021HH AS StName, U021AA AS StReg, MZER_TYPE+U021DD AS StProf, U021WW AS StUl, SUL_NER as StUlName " & _
                " FROM  U021 left JOIN SUL_L ON Convert(int,U021WW)=Convert(int,SUL_KOD) " & _
                " INNER JOIN MZER_L on MZER_KOD=U021AE" & _
                " WHERE     U021EE = '" & Session("u1000") & "'"
        Dim cmd = New SqlCommand(sql, myConnection)
        Dim dr As SqlDataReader
        dr = cmd.ExecuteReader()
        If dr.Read() Then
            Label1.Text = dr("StKod")
            Label2.Text = dr("StName") '& "/" & dr("StReg") & "/"
            Session("oner") = dr("StName")
            Label5.Text = dr("StProf")
            Label7.Text = dr("now") 'IIf(Not IsDBNull(dr("StUl")), dr("StUl"), "")
        End If
        dr.Close()
        myConnection.Close()
    End Sub
    Sub Golch_inf()
        If myConnection.State = ConnectionState.Closed Then myConnection.Open()
        Dim cmd = New SqlCommand("select gpa=isnull(unimis_tis.dbo.func_GPA_all('" & Session("u1000") & "'),0)", myConnection)
        Dim dr As SqlDataReader
        dr = cmd.ExecuteReader()
        If dr.Read() Then
            Label4.Text = Format(dr(0), "###0.00")
        End If
        dr.Close()
        myConnection.Close()
    End Sub
    Sub Sumkr_inf()
        If myConnection.State = ConnectionState.Closed Then myConnection.Open()
        Dim cmd = New SqlCommand("select gpa=isnull(unimis_tis.dbo.func_CRED_all('" & Session("u1000") & "'),0)", myConnection)
        Dim dr As SqlDataReader
        dr = cmd.ExecuteReader()
        If dr.Read() Then
            Label3.Text = dr(0)
        End If
        dr.Close()
        myConnection.Close()
    End Sub

    Sub Stud_UL()
        If myConnection.State = ConnectionState.Closed Then myConnection.Open()
        Dim cmd = New SqlCommand("select gpa=isnull(unimis_tis.dbo.func_Stud_UL('" & Session("u1000") & "'),0)", myConnection)
        Dim dr As SqlDataReader
        dr = cmd.ExecuteReader()
        If dr.Read() Then
            Label8.Text = dr(0)
        End If
        dr.Close()
        myConnection.Close()
    End Sub

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton1.Click
        Session.Clear()
        Session.RemoveAll()
        Response.Redirect("login.aspx")
    End Sub

End Class
