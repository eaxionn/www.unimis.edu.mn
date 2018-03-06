Imports System.data
Imports System.data.sqlclient


Namespace teacher

    Partial Class tsagiintootsoo
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
                Try

                    Call teach_inf()
                Catch ex As Exception
                    Response.Write("error")
                End Try

                Dim tableStyle As New TableItemStyle
                tableStyle.HorizontalAlign = HorizontalAlign.Center
                tableStyle.VerticalAlign = VerticalAlign.Middle
                'tableStyle.Width = Unit.Pixel(150)

                If myConnection.State = ConnectionState.Closed Then If myConnection.State = ConnectionState.Closed Then myConnection.Open()
                Dim cmd = New SqlCommand("exec Bagshiin_kr_tootsoo '" & Session("tcode") & "'", myConnection)
                Dim dr = cmd.ExecuteReader()
                Dim i As Integer = 1
                While dr.Read()
                    Dim tempRow As New TableRow

                    Dim j As Integer
                    For j = 0 To 31
                        Dim tempCell As New TableCell
                        Select Case j
                            'Case 0 : tempCell.Text = "намар"
                            Case 0 : tempCell.Text = i
                            Case 1 : tempCell.Text = dr("lcode")
                            Case 2 : tempCell.Text = dr("lname")
                            Case 3 : tempCell.Text = Format(dr("koef"), "0.00")
                            Case 4 : tempCell.Text = Format(dr("kredit"), "0.00")
                            Case 5 : tempCell.Text = dr("oyut_too")
                            Case 6 : tempCell.Text = dr("le_sar8")
                            Case 7 : tempCell.Text = dr("le_sar9")
                            Case 8 : tempCell.Text = dr("le_sar10")
                            Case 9 : tempCell.Text = dr("le_sar11")
                            Case 10 : tempCell.Text = dr("le_sar12")
                            Case 11 : tempCell.Text = dr("le_sumtsag")
                            Case 12 : tempCell.Text = Format(dr("le_sumkr"), "0.00")

                            Case 13 : tempCell.Text = dr("se_sar8")
                            Case 14 : tempCell.Text = dr("se_sar9")
                            Case 15 : tempCell.Text = dr("se_sar10")
                            Case 16 : tempCell.Text = dr("se_sar11")
                            Case 17 : tempCell.Text = dr("se_sar12")
                            Case 18 : tempCell.Text = dr("se_sumtsag")
                            Case 19 : tempCell.Text = Format(dr("se_sumkr"), "0.00")

                            Case 20 : tempCell.Text = dr("la_sar8")
                            Case 21 : tempCell.Text = dr("la_sar9")
                            Case 22 : tempCell.Text = dr("la_sar10")
                            Case 23 : tempCell.Text = dr("la_sar11")
                            Case 24 : tempCell.Text = dr("la_sar12")
                            Case 25 : tempCell.Text = dr("la_sumtsag")
                            Case 26 : tempCell.Text = Format(dr("la_sumkr"), "0.00")

                            Case 27 : tempCell.Text = dr("t_oyut_too")
                            Case 28 : tempCell.Text = Format(dr("zoruu30"), "0.00")
                            Case 29 : tempCell.Text = Format(dr("sur_kr"), "0.00")
                            Case 30 : tempCell.Text = dr("tailbar")

                        End Select

                        tempRow.Cells.Add(tempCell)
                    Next j
                    i += 1
                    table1.Rows.Add(tempRow)
                End While
                dr.Close()
                myConnection.Close()

                Dim ii As Integer
                For ii = 0 To 0
                    Dim tempRow As New TableRow
                    Dim j As Integer
                    Dim kk As Integer
                    Dim sum As Double = 0
                    For j = 0 To 30
                        Dim tempCell As New TableCell
                        If j = 5 And 0 = ii Then
                            tempCell.Text = "Бvгд"
                            '******************* lecture ******************
                        ElseIf j = 6 And 0 = ii Then '******* sum lect 8 sar
                            For kk = 3 To i + 1
                                sum = sum + table1.Rows(kk).Cells(6).Text
                            Next
                            tempCell.Text = sum
                            sum = 0
                        ElseIf j = 7 And 0 = ii Then '******* sum lect 9 sar
                            For kk = 3 To i + 1
                                sum = sum + table1.Rows(kk).Cells(7).Text
                            Next
                            tempCell.Text = sum
                            sum = 0
                        ElseIf j = 8 And 0 = ii Then '******* sum lect 10 sar
                            For kk = 3 To i + 1
                                sum = sum + table1.Rows(kk).Cells(8).Text
                            Next
                            tempCell.Text = sum
                            sum = 0
                        ElseIf j = 9 And 0 = ii Then '******* sum lect 11 sar
                            For kk = 3 To i + 1
                                sum = sum + table1.Rows(kk).Cells(9).Text
                            Next
                            tempCell.Text = sum
                            sum = 0
                        ElseIf j = 10 And 0 = ii Then '******* sum lect 12 sar
                            For kk = 3 To i + 1
                                sum = sum + table1.Rows(kk).Cells(10).Text
                            Next
                            tempCell.Text = sum
                            sum = 0
                        ElseIf j = 11 And 0 = ii Then '******* sum lect 
                            For kk = 3 To i + 1
                                sum = sum + table1.Rows(kk).Cells(11).Text
                            Next
                            tempCell.Text = sum
                            sum = 0
                        ElseIf j = 12 And 0 = ii Then '******* sum lect kredit
                            For kk = 3 To i + 1
                                sum = sum + table1.Rows(kk).Cells(12).Text
                            Next
                            tempCell.Text = sum
                            sum = 0
                            '******************* seminar ******************
                        ElseIf j = 13 And 0 = ii Then '******* sum sem 8 sar
                            For kk = 3 To i + 1
                                sum = sum + table1.Rows(kk).Cells(13).Text
                            Next
                            tempCell.Text = sum
                            sum = 0
                        ElseIf j = 14 And 0 = ii Then '******* sum sem 9 sar
                            For kk = 3 To i + 1
                                sum = sum + table1.Rows(kk).Cells(14).Text
                            Next
                            tempCell.Text = sum
                            sum = 0
                        ElseIf j = 15 And 0 = ii Then '******* sum sem 10 sar
                            For kk = 3 To i + 1
                                sum = sum + table1.Rows(kk).Cells(15).Text
                            Next
                            tempCell.Text = sum
                            sum = 0
                        ElseIf j = 16 And 0 = ii Then '******* sum sem 11 sar
                            For kk = 3 To i + 1
                                sum = sum + table1.Rows(kk).Cells(16).Text
                            Next
                            tempCell.Text = sum
                            sum = 0
                        ElseIf j = 17 And 0 = ii Then '******* sum sem 12 sar
                            For kk = 3 To i + 1
                                sum = sum + table1.Rows(kk).Cells(17).Text
                            Next
                            tempCell.Text = sum
                            sum = 0
                        ElseIf j = 18 And 0 = ii Then '******* sum sem 
                            For kk = 3 To i + 1
                                sum = sum + table1.Rows(kk).Cells(18).Text
                            Next
                            tempCell.Text = sum
                            sum = 0
                        ElseIf j = 19 And 0 = ii Then '******* sum sem kredit
                            For kk = 3 To i + 1
                                sum = sum + table1.Rows(kk).Cells(19).Text
                            Next
                            tempCell.Text = sum
                            sum = 0

                            '******************* lab ******************
                        ElseIf j = 20 And 0 = ii Then '******* sum lab 8 sar
                            For kk = 3 To i + 1
                                sum = sum + table1.Rows(kk).Cells(20).Text
                            Next
                            tempCell.Text = sum
                            sum = 0
                        ElseIf j = 21 And 0 = ii Then '******* sum lab 9 sar
                            For kk = 3 To i + 1
                                sum = sum + table1.Rows(kk).Cells(21).Text
                            Next
                            tempCell.Text = sum
                            sum = 0
                        ElseIf j = 22 And 0 = ii Then '******* sum lab 10 sar
                            For kk = 3 To i + 1
                                sum = sum + table1.Rows(kk).Cells(22).Text
                            Next
                            tempCell.Text = sum
                            sum = 0
                        ElseIf j = 23 And 0 = ii Then '******* sum lab 11 sar
                            For kk = 3 To i + 1
                                sum = sum + table1.Rows(kk).Cells(23).Text
                            Next
                            tempCell.Text = sum
                            sum = 0
                        ElseIf j = 24 And 0 = ii Then '******* sum lab 12 sar
                            For kk = 3 To i + 1
                                sum = sum + table1.Rows(kk).Cells(24).Text
                            Next
                            tempCell.Text = sum
                            sum = 0
                        ElseIf j = 25 And 0 = ii Then '******* sum lab 
                            For kk = 3 To i + 1
                                sum = sum + table1.Rows(kk).Cells(25).Text
                            Next
                            tempCell.Text = sum
                            sum = 0
                        ElseIf j = 26 And 0 = ii Then '******* sum lab kredit
                            For kk = 3 To i + 1
                                sum = sum + table1.Rows(kk).Cells(26).Text
                            Next
                            tempCell.Text = sum
                            sum = 0
                        ElseIf j = 27 And 0 = ii Then '******* tsootsoh oyutan
                            For kk = 3 To i + 1
                                sum = sum + table1.Rows(kk).Cells(27).Text
                            Next
                            tempCell.Text = sum
                            sum = 0
                        ElseIf j = 28 And 0 = ii Then '******* sum 30 as ih kredit
                            For kk = 3 To i + 1
                                sum = sum + table1.Rows(kk).Cells(28).Text
                            Next
                            tempCell.Text = sum
                            sum = 0
                        ElseIf j = 29 And 0 = ii Then '******* sum  kredit
                            For kk = 3 To i + 1
                                sum = sum + table1.Rows(kk).Cells(29).Text
                            Next
                            tempCell.Text = "<b>" & sum & "</b>"
                            sum = 0
                            '   ElseIf j = 5 And 1 = ii Then
                            '       tempCell.Text = "Телевлегее ёсоор"
                        Else
                            tempCell.Text = ""
                        End If
                        tempRow.Cells.Add(tempCell)
                    Next j
                    table1.Rows.Add(tempRow)
                Next ii

                Dim r As TableRow
                For Each r In table1.Rows
                    Dim c As TableCell
                    For Each c In r.Cells
                        c.ApplyStyle(tableStyle)
                    Next c
                Next r
            End If
        End Sub
        Sub teach_inf()
            Dim sql As String
            If myConnection.State = ConnectionState.Closed Then myConnection.Open()
            sql = "SELECT uliral=case q2 when 2 then 'хавар' when 1 then 'намар' else 'зун' end,U41.U41AA, U41.U41BB, U41.U41CC, U41.U41EE, U41.U41GG, U41.U41HH, U41.U41II, SUR_L.SSS2, TEN_L.TTT3, ATA_L.ATA_NER "
            sql = sql & " FROM main,U41 LEFT OUTER JOIN "
            sql = sql & " SUR_L ON U41.U41BB = SUR_L.SSS1 LEFT OUTER JOIN "
            sql = sql & " TEN_L ON U41.U41CC = TEN_L.TTT2 LEFT OUTER JOIN "
            sql = sql & " ATA_L ON U41.U41DD = ATA_L.ATA_KOD "
            sql = sql & " WHERE     (U41.U41EE = @tid)   "
            'Response.Write(sql)
            Dim cmd = New SqlCommand(sql, myConnection)
            cmd.Parameters.Add(New SqlParameter("@tid", SqlDbType.VarChar, 25))
            cmd.Parameters("@tid").Value = Session("tcode")
            Dim dr As SqlDataReader
            dr = cmd.ExecuteReader()
            If dr.Read() Then
                Label1.Text = IIf(Not IsDBNull(dr("U41II")), Left(dr("U41HH"), 1) & "." & dr("U41II"), "")
                Label2.Text = Session("tcode")
                Label3.Text = IIf(Not IsDBNull(dr("ATA_NER")), dr("ATA_NER"), "")
                Label4.Text = IIf(Not IsDBNull(dr(8)), dr(8), "")
                Label5.Text = IIf(Not IsDBNull(dr("TTT3")), dr("TTT3"), "")
                Label6.Text = dr("uliral")
            End If
            dr.Close()
            myConnection.Close()
        End Sub
    End Class

End Namespace
