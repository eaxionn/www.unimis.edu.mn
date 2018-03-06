Imports System.data
Imports System.data.sqlclient


Namespace teacher
    Partial Class huvaari
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
        Public cnt As Integer

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
                cnt = 1
                sql = "select id,LESSON_TYPE,LESSON_KOD,CASE LESSON_TYPE WHEN 1 THEN 'лекц'  WHEN 2 THEN 'семинар' WHEN 3 THEN 'лаборатор' else 'Бие даалт' END as LTYPE, " & _
                 "LDAY+'-'+LTIME+'-пар '+ case when TEGSH_SONDGOI=1 then '(тэгш)' when TEGSH_SONDGOI=0 then '(сондгой)' else '' end +rtrim(LDESC)+' '+" & _
                 " case when BAIR=1 then 'БЛОК-' when BAIR=2 then '1-' when BAIR=3 then '2-' when BAIR=4 then '3-' " & _
                 " when BAIR=5 then 'T-' when BAIR=6 then 'E-' when BAIR=7 then '4-' when BAIR=8 then '5-' " & _
                 " when BAIR=9 then '6-' when BAIR=10 then '7-' when BAIR=11 then 'Спорт заал-' when BAIR=12 then 'ТВ заал-' " & _
                 " when BAIR=13 then 'Нэхмэл-' when BAIR=14 then 'Хvрээлэн-' when BAIR=15 then 'ТЭЦ-' " & _
                 " when BAIR=16 then 'МонЗим-' when BAIR=17 then 'Vйлдвэр-' else '' end +" & _
                 " rtrim(ROOM) as LTIME" & _
                 " from NTIMETABLE where LTEACHER='" & Session("tcode") & "' order by LESSON_KOD,POTOK,LESSON_TYPE,LGROUP"
                If myConnection.State = ConnectionState.Closed Then myConnection.Open()
                Dim cmd As SqlDataAdapter
                cmd = New SqlDataAdapter(sql, myConnection)
                Dim rs As DataSet = New DataSet
                cmd.Fill(rs)
                Datagrid1.DataSource = rs
                Datagrid1.DataBind()
                myConnection.Close()
            End If
        End Sub
        Sub Increaser(ByVal sender As Object, ByVal e As EventArgs)
            cnt = cnt + 1
        End Sub
    End Class
End Namespace
