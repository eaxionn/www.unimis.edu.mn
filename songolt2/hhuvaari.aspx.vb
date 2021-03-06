Imports System.data
Imports System.data.sqlclient
Imports System.Web.Security

Partial Class hhuvaari
    Inherits System.Web.UI.Page
    Dim myConnection As New SqlConnection
    Public cnt As Integer = 0
    Dim dsGroup As DataTable
    'Dim sqlCommand As SqlCommand
    Dim daGroup As SqlDataAdapter

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        myConnection.ConnectionString = ConfigurationManager.AppSettings("ConnectionString")
        If Not Page.IsPostBack Then
            Label2.Text = Session("oner") + " " + Session("u1000")
            Label1.Text = Session("on") + " оны хичээлийн жил. "
            If Session("ul") = 1 Then
                Label1.Text += "Намрын улирал. Хичээлийн хуваарь"
            Else
                Label1.Text += "Хаврын улирал. Хичээлийн хуваарь"
            End If
            cnt = 1

            Dim sql As String = "select LDAY,case when LDAY=1 then 'Даваа' when LDAY=2 then 'Мягмар' when LDAY=3 " & _
            "then 'Лхагва' when LDAY=4 then 'Пvрэв' when LDAY=5 then 'Баасан' else '' end as garig " & _
            ",LTIME,LESSON_KOD,U035DD,LESSON_TYPE, " & _
            "case when LESSON_TYPE=1 then 'Лк' when LESSON_TYPE=2 then 'Сем' else 'Лаб' end + " & _
            "case when TEGSH_SONDGOI=1 then ' (тэгш)' when TEGSH_SONDGOI=0 then ' (сондгой)' else '' end as helber " & _
            ",case when BAIR=1 then 'БЛОК-' when BAIR=2 then '1-' when BAIR=3 then '2-' when BAIR=4 then '3-' " & _
            "when BAIR=5 then 'T-' when BAIR=6 then 'E-' when BAIR=7 then '4-' when BAIR=8 then '5-' " & _
            "when BAIR=9 then '6-' when BAIR=10 then '7-' when BAIR=11 then 'Спорт заал-' when BAIR=12 then 'ТВ заал-' " & _
            "when BAIR=13 then 'Нэхмэл-' when BAIR=14 then 'Хvрээлэн-' when BAIR=15 then 'ТЭЦ-' " & _
            "when BAIR=16 then 'МонЗим-' when BAIR=17 then 'Vйлдвэр-' else '' end +ROOM as room " & _
            ",LTEACHER,left(U41HH,1)+'.'+U41II as tname,LDESC " & _
            "from NTIMETABLE left outer join U0362 on U0362DD=LESSON_KOD and LYEAR=U0362YY and SEMESTER=U0362BB " & _
            "inner join U035 on U035CC=U0362DD inner join U41 on U41EE=U0362EE where LESSON_TYPE=1 and  U0362AA='" & Session("u1000") & "' and U0362KK<>0 and U0362YY='" & Session("on") & "' " & _
            "and U0362BB=" & Session("ul") & " and U0362EE is not null and U0362GG=2 " & _
            "and LGROUP in (select LGROUP from NTIMETABLE where id=U0362KK and U0362DD=LESSON_KOD  and LYEAR=U0362YY and SEMESTER=U0362BB) " & _
            "and POTOK in (select POTOK from NTIMETABLE where id=U0362KK and U0362DD=LESSON_KOD  and LYEAR=U0362YY and SEMESTER=U0362BB) " & _
            "union select LDAY,case when LDAY=1 then 'Даваа' when LDAY=2 then 'Мягмар' when LDAY=3 " & _
            "then 'Лхагва' when LDAY=4 then 'Пvрэв' when LDAY=5 then 'Баасан' else '' end as garig " & _
            ",LTIME,LESSON_KOD,U035DD,LESSON_TYPE," & _
            "case when LESSON_TYPE=1 then 'Лк' when LESSON_TYPE=2 then 'Сем' else 'Лаб' end + " & _
            "case when TEGSH_SONDGOI=1 then ' (тэгш)' when TEGSH_SONDGOI=0 then ' (сондгой)' else '' end as helber" & _
            ",case when BAIR=1 then 'БЛОК-' when BAIR=2 then '1-' when BAIR=3 then '2-' when BAIR=4 then '3-' " & _
            "when BAIR=5 then 'T-' when BAIR=6 then 'E-' when BAIR=7 then '4-' when BAIR=8 then '5-' " & _
            "when BAIR=9 then '6-' when BAIR=10 then '7-' when BAIR=11 then 'Спорт заал-' when BAIR=12 then 'ТВ заал-' " & _
            "when BAIR=13 then 'Нэхмэл-' when BAIR=14 then 'Хvрээлэн-' when BAIR=15 then 'ТЭЦ-' " & _
            "when BAIR=16 then 'МонЗим-' when BAIR=17 then 'Vйлдвэр-' else '' end +ROOM as room " & _
            ",LTEACHER,left(U41HH,1)+'.'+U41II as tname,LDESC " & _
            "from NTIMETABLE left join U0362  on U0362DD=LESSON_KOD  and LYEAR=U0362YY and SEMESTER=U0362BB " & _
            "inner join U035 on U035CC=U0362DD inner join U41 on U41EE=U0362EE where LESSON_TYPE=2 and  U0362AA='" & Session("u1000") & "' and U0362LL<>0 and " & _
            "LYEAR='" & Session("on") & "' and SEMESTER=" & Session("ul") & " and U0362EE is not null and U0362GG=2 " & _
            " and LGROUP in (select LGROUP from NTIMETABLE where id=U0362LL and U0362DD=LESSON_KOD  and LYEAR=U0362YY and SEMESTER=U0362BB) " & _
            " and POTOK in (select POTOK from NTIMETABLE where id=U0362LL and U0362DD=LESSON_KOD  and LYEAR=U0362YY and SEMESTER=U0362BB) " & _
            " union select LDAY,case when LDAY=1 then 'Даваа' when LDAY=2 then 'Мягмар' when LDAY=3 " & _
            "then 'Лхагва' when LDAY=4 then 'Пvрэв' when LDAY=5 then 'Баасан' else '' end as garig " & _
            ",LTIME,LESSON_KOD,U035DD,LESSON_TYPE," & _
            "case when LESSON_TYPE=1 then 'Лк' when LESSON_TYPE=2 then 'Сем' else 'Лаб' end +" & _
            "case when TEGSH_SONDGOI=1 then ' (тэгш)' when TEGSH_SONDGOI=0 then ' (сондгой)' else '' end as helber " & _
            ",case when BAIR=1 then 'БЛОК-' when BAIR=2 then '1-' when BAIR=3 then '2-' when BAIR=4 then '3-' " & _
            "when BAIR=5 then 'T-' when BAIR=6 then 'E-' when BAIR=7 then '4-' when BAIR=8 then '5-' " & _
            "when BAIR=9 then '6-' when BAIR=10 then '7-' when BAIR=11 then 'Спорт заал-' when BAIR=12 then 'ТВ заал-' " & _
            "when BAIR=13 then 'Нэхмэл-' when BAIR=14 then 'Хvрээлэн-' when BAIR=15 then 'ТЭЦ-' " & _
            "when BAIR=16 then 'МонЗим-' when BAIR=17 then 'Vйлдвэр-' else '' end +ROOM as room " & _
            ",LTEACHER,left(U41HH,1)+'.'+U41II as tname,LDESC " & _
            "from NTIMETABLE left outer join U0362 on U0362DD=LESSON_KOD  and LYEAR=U0362YY and SEMESTER=U0362BB " & _
            "inner join U035 on U035CC=U0362DD inner join U41 on U41EE=U0362EE where LESSON_TYPE=3 and " & _
            "U0362AA='" & Session("u1000") & "' and U0362MM<>0 and U0362YY='" & Session("on") & "' and U0362BB=" & Session("ul") & " and U0362EE is not null and U0362GG=2 " & _
            " and LGROUP in (select LGROUP from NTIMETABLE where id=U0362MM and U0362DD=LESSON_KOD  and LYEAR=U0362YY and SEMESTER=U0362BB) " & _
            " and POTOK in (select POTOK from NTIMETABLE where id=U0362MM and U0362DD=LESSON_KOD  and LYEAR=U0362YY and SEMESTER=U0362BB) " & _
            "order by LDAY,LTIME,LESSON_KOD,LESSON_TYPE"

            Dim cmd As SqlDataAdapter
            Try
                If myConnection.State = ConnectionState.Closed Then myConnection.Open()
                cmd = New SqlDataAdapter(sql, myConnection)
                Dim rs As DataSet = New DataSet
                cmd.Fill(rs)
                DataGrid1.DataSource = rs
                DataGrid1.DataBind()
                sql = "select sum(U035EE) from U0362 " & _
                "left join U035 on U0362DD=U035CC " & _
                "where U0362AA='" & Session("u1000") & "' and U0362GG=2 and " & _
                "U0362KK is not null and U0362LL is not null and U0362MM is not null " & _
                "group by U0362GG "
                Dim cmd1 = New SqlCommand(sql, myConnection)
                Dim dr As SqlDataReader
                dr = cmd1.ExecuteReader()
                If dr.Read() Then
                    Label6.Text = "Нийт кредит: " & IIf(Not IsDBNull(dr(0)), dr(0), "")
                End If
                dr.Close()

                sql = "select U0362DD,U035DD from U0362 " & _
                "left join U035 on U0362DD=U035CC " & _
                "where U0362EE is null and " & _
                "U0362KK=0 and U0362LL=0 and U0362MM=0 and U0362AA='" & Session("u1000") & "'"
                cmd1 = New SqlCommand(sql, myConnection)
                'Dim dr As SqlDataReader
                dr = cmd1.ExecuteReader()
                While dr.Read()
                    Label7.Text += IIf(Not IsDBNull(dr(0)), dr(0), "") & " - " & IIf(Not IsDBNull(dr(1)), dr(1), "") & "<br />"
                End While
                dr.Close()

            Catch ex As Exception
                '
            Finally
                myConnection.Close()
            End Try
        End If
    End Sub
    Sub Increaser(ByVal sender As Object, ByVal e As EventArgs)
        cnt = cnt + 1
    End Sub
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        'Response.Redirect("songolt1.aspx")
        Response.Redirect("songolt1.aspx")
    End Sub
End Class
