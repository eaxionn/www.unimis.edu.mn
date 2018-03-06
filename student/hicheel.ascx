<%@ Control Language="VB" AutoEventWireup="false" CodeFile="hicheel.ascx.vb" Inherits="hicheel" %>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1251" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" type="text/JavaScript" />
<script>
function showimage1(val)
{  window.open('Lstandart.aspx?sc='+val, 'batkhuu', 'width=700, height=700, menubar=no, resizable=yes,scrollbars=yes');
}
</script>
<body bgcolor="#ffffff" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
	<TABLE id="Table1" style="WIDTH: 208px; HEIGHT: 60px" cellSpacing="1" cellPadding="1" width="208"
		border="0">
		<TR>
			<TD>
				<asp:Image id="Image1" runat="server" ImageUrl="images/less.gif"></asp:Image></TD>
		</TR>
		<TR>
			<TD>
				<DIV align="center">
					<asp:DataGrid id="DataGrid1" OnItemDataBound="Item_Bound" ShowFooter="True" runat="server" GridLines="None"
						AutoGenerateColumns="False" Width="160px">
						<Columns>
							<asp:TemplateColumn HeaderText="Хичээл">
								<HeaderStyle CssClass="whtSM"></HeaderStyle>
								<ItemTemplate>
									<a href='#' onclick='showimage1("<%# DataBinder.Eval(Container.DataItem, "U0362DD")%>")'>
										<asp:Label ID="Label1" runat="server" CssClass="link" Text='<%# DataBinder.Eval(Container, "DataItem.U0362DD") %>' >
										</asp:Label>
									</a>
								</ItemTemplate>
							</asp:TemplateColumn>
							<asp:TemplateColumn HeaderText="Багш">
								<HeaderStyle CssClass="whtSM"></HeaderStyle>
								<ItemTemplate>
									<asp:Label runat="server" ID="Label20" Text='<%# DataBinder.Eval(Container, "DataItem.U0362EE") %>'>
									</asp:Label>
								</ItemTemplate>
							</asp:TemplateColumn>
							<asp:TemplateColumn HeaderText="Кр">
								<HeaderStyle CssClass="whtSM"></HeaderStyle>
								<ItemTemplate>
									<asp:Label runat="server" ID="U035EE" Text='<%# DataBinder.Eval(Container, "DataItem.U035EE") %>'>
									</asp:Label>
								</ItemTemplate>
							</asp:TemplateColumn>
							<asp:TemplateColumn>
								<ItemTemplate>
									<a href='dun.aspx?lcode=<%# DataBinder.Eval(Container, "DataItem.U0362DD") %>'>
										<asp:Label ID="Label2" runat="server" Text='дvн хар'></asp:Label>
									</a>
								</ItemTemplate>
							</asp:TemplateColumn>
						</Columns>
					</asp:DataGrid></DIV>
			</TD>
		</TR>
		<TR>
			<TD></TD>
		</TR>
	</TABLE>
</body>
