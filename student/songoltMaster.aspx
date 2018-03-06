<%@ Register TagPrefix="uc1" TagName="hichjil" Src="hichjil.ascx" %>
<%@ Register TagPrefix="uc1" TagName="deed" Src="deed.ascx" %>
<%@ Register TagPrefix="uc1" TagName="hicheel" Src="hicheel.ascx" %>
<%@ Register TagPrefix="uc1" TagName="omnohdun" Src="omnohdun.ascx" %>
<%@ Register TagPrefix="uc1" TagName="dood" Src="dood.ascx" %>

<%@ Page Language="VB" AutoEventWireup="false" CodeFile="songoltMaster.aspx.vb" Inherits="songoltMaster" %>

<!DOCTYPE html PUBLIC "-//W3C//Dtd XHTML 1.0 transitional//EN" "http://www.w3.org/tr/xhtml1/Dtd/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>student</title>
	<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR" />
	<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE" />
	<meta content="JavaScript" name="vs_defaultClientScript" />
	<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema" />
	<link href="stylesss.css" rel="stylesheet" type="text/css" />
</head>
<body topmargin="0" MS_POSITIONING="GridLayout">
	<form id="Form1" method="post" runat="server">
		<uc1:deed id="Deed1" runat="server"></uc1:deed>
		<table id="table1" cellspacing="1" cellpadding="1" width="100%" border="0">
			<tr>
				<td valign="top">
					<table id="table3" cellspacing="1" cellpadding="1" width="100%" border="0">
						<tr>
							<td align="center"><asp:hyperlink id="HyperLink1" runat="server">Оюутанд санал болгох толовлогоо харах</asp:hyperlink></td>
						</tr>
						<tr>
							<td></td>
						</tr>
					</table>
					<asp:panel id="Panel1" runat="server">
						<table id="table2" cellspacing="1" cellpadding="1" width="100%" border="0">
							<tr>
								<td align="center">
									<asp:Label id="Label1" runat="server"></asp:Label></td>
							</tr>
							<tr>
								<td align="center">
									<asp:datagrid id="DataGrid1" runat="server" OnItemDataBound="Item_Bound1" AutoGenerateColumns="False"
										Width="100%" ShowFooter="true">
										<HeaderStyle BackColor="#B3D8FD"></HeaderStyle>
										<Columns>
											<asp:TemplateColumn HeaderText="№">
												<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
												<ItemTemplate>
													<div align="center">
														<asp:Label id="cnt" runat="server" Text='<%# cnt%>' OnDataBinding="Increaser"/>
													</div>
												</ItemTemplate>
											</asp:TemplateColumn>
											<asp:BoundColumn DataField="U0362DD" HeaderText="Хич.код"></asp:BoundColumn>
											<asp:BoundColumn DataField="U035DD" HeaderText="Нэр">
												<FooterStyle HorizontalAlign="Right"></FooterStyle>
											</asp:BoundColumn>
											<asp:TemplateColumn HeaderText="Багш">
												<ItemTemplate>
													<asp:DropDownList id="DropDownList1" runat="server" Width="200px"></asp:DropDownList>
												</ItemTemplate>
											</asp:TemplateColumn>
											<asp:BoundColumn DataField="U035EE" HeaderText="Кредит">
												<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
												<ItemStyle HorizontalAlign="Center"></ItemStyle>
												<FooterStyle HorizontalAlign="Center"></FooterStyle>
											</asp:BoundColumn>
											<asp:TemplateColumn HeaderText="хасах">
												<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
												<ItemStyle HorizontalAlign="Center"></ItemStyle>
												<ItemTemplate>
													<asp:CheckBox id="CheckBox1" runat="server"></asp:CheckBox>
												</ItemTemplate>
											</asp:TemplateColumn>
											<asp:BoundColumn Visible="False" DataField="U0362EE" HeaderText="tcode"></asp:BoundColumn>
										</Columns>
									</asp:datagrid>
									<asp:label id="Label2" runat="server" ForeColor="Red"></asp:label></td>
							</tr>
							<tr>
								<td align="center">
									<table id="table4" cellspacing="1" cellpadding="1" width="100%" border="0">
										<tr>
											<td style="WIDTH: 401px">
												<asp:Button id="Button2" runat="server" Text="Буцах"></asp:Button>
												<asp:Button id="Button1" runat="server" Width="166px" Text="Шинээр сонголт оруулах"></asp:Button></td>
											<td align="left">
												<asp:Button id="Button3" runat="server" Width="118px" Text="Сонголт хадгалах"></asp:Button></td>
											<td align="right">
												<asp:Button id="Button4" runat="server" Width="48px" Text="хасах"></asp:Button></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</asp:panel></td>
			</tr>
		</table>
		<uc1:dood id="Dood1" runat="server"></uc1:dood></form>
</body>
</html>
