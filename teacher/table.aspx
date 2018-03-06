<%@ Import Namespace="System.Drawing" %>
<%@ Page language="VB" AutoEventWireup="true" %>
<html>
	<head>
		<script runat="server">
            Private Sub Page_Load(sender As Object, e As System.EventArgs)
                ' Create a tableItemStyle object that can be
                ' set as the default style for all cells
                ' in the table.
                Dim tableStyle As New tableItemStyle()
                tableStyle.HorizontalAlign = HorizontalAlign.Center
                tableStyle.VerticalAlign = VerticalAlign.Middle
                tableStyle.Width = Unit.Pixel(150)
                ' Create more rows for the table.
                Dim i As Integer
                For i = 2 To 9
                    Dim tempRow As New tableRow()
                    Dim j As Integer
                    For j = 0 To 2
                        Dim tempCell As New tableCell()
                        tempCell.Text = "(" & i & "," & j & ")"
                        tempRow.Cells.Add(tempCell)
                    Next j
                    table1.Rows.Add(tempRow)
                Next i

                ' Apply the tableItemStyle to all rows in the table.
                Dim r As tableRow
                For Each r In  table1.Rows
                    Dim c As tableCell
                    For Each c In  r.Cells
                        c.ApplyStyle(tableStyle)
                    Next c 
                Next r

                ' Create a header for the table.
                
                Dim header As New tableheaderCell()
                header.RowSpan = 1
                header.ColumnSpan = 2
                header.Text = "table of (x,y) Values"
                header.Font.Bold = true
                header.BackColor = Color.green
                header.HorizontalAlign = HorizontalAlign.Center
                header.VerticalAlign = VerticalAlign.Middle

                ' Add the header to a new row.
                
                Dim headerRow As New tableRow()
                headerRow.Cells.Add(header)

                ' Add the header row to the table.
                
                table1.Rows.AddAt(0, headerRow) 
                
                
                Dim header1 As New tableheaderCell()
                header1.RowSpan = 1
                header1.ColumnSpan = 3
                header1.Text = "table of (x,y) Values"
                header1.Font.Bold = true
                header1.BackColor = Color.green
                header1.HorizontalAlign = HorizontalAlign.Center
                header1.VerticalAlign = VerticalAlign.Middle
                ' Add the header to a new row.
                Dim headerRow1 As New tableRow()
                headerRow1.Cells.Add(header1)
                ' Add the header row to the table.
                table1.Rows.AddAt(5, headerRow1) 
                
                
            End Sub
		</script>
	</head>
	<body>
		<form runat="server" ID="Form1">
			<h1>tableCell Example</h1>
			<asp:table id="table1" runat="server" cellpadding="3" cellspacing="3" GridLines="Both">
				<asp:tableRow>
					<asp:tableCell Text="(0,0)"></asp:tableCell>
					<asp:tableCell Text="(0,1)"></asp:tableCell>
					<asp:tableCell Text="(0,2)"></asp:tableCell>
				</asp:tableRow>
				<asp:tableRow>
					<asp:tableCell Text="(1,0)"></asp:tableCell>
					<asp:tableCell Text="(1,1)"></asp:tableCell>
					<asp:tableCell Text="(1,2)"></asp:tableCell>
				</asp:tableRow>
			</asp:table>
		</form>
	</body>
</html>
