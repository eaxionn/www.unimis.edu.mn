<%@ Page Language="vb" AutoEventWireup="false" Codebehind="adminexamreport.aspx.vb" Inherits="e_testweb.adminExamReport"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>adminExamReport</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TR>
					<TD style="HEIGHT: 17px" align="right"><asp:dropdownlist id="exams" runat="server" Width="150px" Height="24px"></asp:dropdownlist>&nbsp;<asp:button id="Button1" runat="server" Width="60px" Height="24px" Font-Names="Tahoma" Font-Size="8pt"
							Text="Гаргах"></asp:button>
						<asp:button id="Button2" runat="server" Width="60px" Height="24px" Font-Names="Tahoma" Font-Size="8pt"
							Text="Буцах"></asp:button></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 12px"><br>
						<br>
					</TD>
				</TR>
				<TR>
					<TD style="FONT-WEIGHT: bold; FONT-SIZE: 14pt; HEIGHT: 20px" align="center">Шалгалтын 
						онооны хуудас<br>
						<br>
					</TD>
				</TR>
				<TR>
					<TD style="HEIGHT: 37px">
						<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
							<TR>
								<TD width="20%" style="HEIGHT: 19px"></TD>
								<TD style="WIDTH: 425px; HEIGHT: 19px" vAlign="top" align="left" width="425"><asp:label id="Label2" runat="server"></asp:label></TD>
								<TD vAlign="top" align="left" width="40%" style="HEIGHT: 19px"><asp:label id="Label1" runat="server"></asp:label></TD>
							</TR>
						</TABLE>
					</TD>
				</TR>
				<TR>
					<TD align="center"><asp:datagrid id="DataGrid1" runat="server" Width="823px" Height="8px" AutoGenerateColumns="False"
							CellPadding="4" BorderColor="DimGray" BorderWidth="1px">
							<ItemStyle Font-Size="Smaller"></ItemStyle>
							<HeaderStyle Font-Size="X-Small" Font-Names="Times New Roman"></HeaderStyle>
							<Columns>
								<asp:TemplateColumn HeaderText="Дугаар">
									<ItemTemplate>
										<asp:Label id="cnt" runat="server" Font-Size="8" Text='<%# cnt%>' OnDataBinding="Increaser"/>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:BoundColumn DataField="T013B" HeaderText="Оюутны код">
									<HeaderStyle Width="15%"></HeaderStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="nm" HeaderText="Овог нэр">
									<HeaderStyle Width="30%"></HeaderStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="T013D" HeaderText="Шалгалтын оноо">
									<HeaderStyle Width="15%"></HeaderStyle>
								</asp:BoundColumn>
								<asp:BoundColumn HeaderText="Тайлбар">
									<HeaderStyle Width="30%"></HeaderStyle>
								</asp:BoundColumn>
							</Columns>
							<PagerStyle Visible="False"></PagerStyle>
						</asp:datagrid></TD>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>
