<%@ Page Language="VB" AutoEventWireup="false" CodeFile="st_san.aspx.vb" Inherits="st_san" %>
<%@ Register TagPrefix="uc1" TagName="deed" Src="deed.ascx" %>
<%@ Register TagPrefix="uc1" TagName="dood" Src="dood.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//Dtd XHTML 1.0 transitional//EN" "http://www.w3.org/tr/xhtml1/Dtd/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Оюутан танд зовлож байна</title>
	<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR" />
	<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE" />
	<meta content="JavaScript" name="vs_defaultClientScript" />
	<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema" />
	<link href="stylesss.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="Form1" method="post" runat="server">
			<uc1:deed id="Deed1" runat="server"></uc1:deed>
			<table id="table2" cellspacing="1" cellpadding="1" width="100%" border="0">
				<tr>
					<td style="WIDTH: 417px"><asp:label id="Label1" runat="server"></asp:label></td>
					<td>Оюутан танд зовлож байна</td>
				</tr>
			</table>
			<table id="table1" cellspacing="1" cellpadding="1" width="100%" border="0">
				<tr>
					<td>1А улирал (намар)
					</td>
					<td>1В улирал (хавар)
					</td>
				</tr>
				<tr>
					<td valign="top"><asp:datagrid id="DataGrid1" runat="server" AutoGenerateColumns="False" Width="100%">
							<HeaderStyle BackColor="#F4F2DD"></HeaderStyle>
							<Columns>
								<asp:BoundColumn DataField="U0323EE" HeaderText="Хич.код"></asp:BoundColumn>
								<asp:BoundColumn DataField="U035DD" HeaderText="Нэр"></asp:BoundColumn>
								<asp:BoundColumn DataField="U035EE" HeaderText="Кредит"></asp:BoundColumn>
							</Columns>
						</asp:datagrid></td>
					<td valign="top"><asp:datagrid id="DataGrid2" runat="server" AutoGenerateColumns="False" Width="100%">
							<HeaderStyle BackColor="#F4F2DD"></HeaderStyle>
							<Columns>
								<asp:BoundColumn DataField="U0323EE" HeaderText="Хич.код"></asp:BoundColumn>
								<asp:BoundColumn DataField="U035DD" HeaderText="Нэр"></asp:BoundColumn>
								<asp:BoundColumn DataField="U035EE" HeaderText="Кредит"></asp:BoundColumn>
							</Columns>
						</asp:datagrid></td>
				</tr>
				<tr>
					<td>2А улирал (намар)
					</td>
					<td>2В улирал (хавар)
					</td>
				</tr>
				<tr>
					<td valign="top"><asp:datagrid id="Datagrid3" runat="server" AutoGenerateColumns="False" Width="100%">
							<HeaderStyle BackColor="#F4F2DD"></HeaderStyle>
							<Columns>
								<asp:BoundColumn DataField="U0323EE" HeaderText="Хич.код"></asp:BoundColumn>
								<asp:BoundColumn DataField="U035DD" HeaderText="Нэр"></asp:BoundColumn>
								<asp:BoundColumn DataField="U035EE" HeaderText="Кредит"></asp:BoundColumn>
							</Columns>
						</asp:datagrid></td>
					<td valign="top"><asp:datagrid id="Datagrid4" runat="server" AutoGenerateColumns="False" Width="100%">
							<HeaderStyle BackColor="#F4F2DD"></HeaderStyle>
							<Columns>
								<asp:BoundColumn DataField="U0323EE" HeaderText="Хич.код"></asp:BoundColumn>
								<asp:BoundColumn DataField="U035DD" HeaderText="Нэр"></asp:BoundColumn>
								<asp:BoundColumn DataField="U035EE" HeaderText="Кредит"></asp:BoundColumn>
							</Columns>
						</asp:datagrid></td>
				</tr>
				<tr>
					<td>3А улирал (намар)
					</td>
					<td>3В улирал (хавар)
					</td>
				</tr>
				<tr>
					<td valign="top"><asp:datagrid id="Datagrid5" runat="server" AutoGenerateColumns="False" Width="100%">
							<HeaderStyle BackColor="#F4F2DD"></HeaderStyle>
							<Columns>
								<asp:BoundColumn DataField="U0323EE" HeaderText="Хич.код"></asp:BoundColumn>
								<asp:BoundColumn DataField="U035DD" HeaderText="Нэр"></asp:BoundColumn>
								<asp:BoundColumn DataField="U035EE" HeaderText="Кредит"></asp:BoundColumn>
							</Columns>
						</asp:datagrid></td>
					<td valign="top">
						<asp:datagrid id="Datagrid6" runat="server" AutoGenerateColumns="False" Width="100%">
							<HeaderStyle BackColor="#F4F2DD"></HeaderStyle>
							<Columns>
								<asp:BoundColumn DataField="U0323EE" HeaderText="Хич.код"></asp:BoundColumn>
								<asp:BoundColumn DataField="U035DD" HeaderText="Нэр"></asp:BoundColumn>
								<asp:BoundColumn DataField="U035EE" HeaderText="Кредит"></asp:BoundColumn>
							</Columns>
						</asp:datagrid></td>
				</tr>
				<tr>
					<td>4А улирал (намар)
					</td>
					<td>4В улирал (хавар)
					</td>
				</tr>
				<tr>
					<td valign="top">
						<asp:datagrid id="Datagrid7" runat="server" AutoGenerateColumns="False" Width="100%">
							<HeaderStyle BackColor="#F4F2DD"></HeaderStyle>
							<Columns>
								<asp:BoundColumn DataField="U0323EE" HeaderText="Хич.код"></asp:BoundColumn>
								<asp:BoundColumn DataField="U035DD" HeaderText="Нэр"></asp:BoundColumn>
								<asp:BoundColumn DataField="U035EE" HeaderText="Кредит"></asp:BoundColumn>
							</Columns>
						</asp:datagrid></td>
					<td valign="top">
						<asp:datagrid id="Datagrid8" runat="server" AutoGenerateColumns="False" Width="100%">
							<HeaderStyle BackColor="#F4F2DD"></HeaderStyle>
							<Columns>
								<asp:BoundColumn DataField="U0323EE" HeaderText="Хич.код"></asp:BoundColumn>
								<asp:BoundColumn DataField="U035DD" HeaderText="Нэр"></asp:BoundColumn>
								<asp:BoundColumn DataField="U035EE" HeaderText="Кредит"></asp:BoundColumn>
							</Columns>
						</asp:datagrid></td>
				</tr>
				<tr>
					<td>5А улирал (намар)
					</td>
					<td>5В улирал (хавар)
					</td>
				</tr>
				<tr>
					<td valign="top">
						<asp:datagrid id="Datagrid9" runat="server" AutoGenerateColumns="False" Width="100%">
							<HeaderStyle BackColor="#F4F2DD"></HeaderStyle>
							<Columns>
								<asp:BoundColumn DataField="U0323EE" HeaderText="Хич.код"></asp:BoundColumn>
								<asp:BoundColumn DataField="U035DD" HeaderText="Нэр"></asp:BoundColumn>
								<asp:BoundColumn DataField="U035EE" HeaderText="Кредит"></asp:BoundColumn>
							</Columns>
						</asp:datagrid></td>
					<td valign="top">
						<asp:datagrid id="Datagrid10" runat="server" AutoGenerateColumns="False" Width="100%">
							<HeaderStyle BackColor="#F4F2DD"></HeaderStyle>
							<Columns>
								<asp:BoundColumn DataField="U0323EE" HeaderText="Хич.код"></asp:BoundColumn>
								<asp:BoundColumn DataField="U035DD" HeaderText="Нэр"></asp:BoundColumn>
								<asp:BoundColumn DataField="U035EE" HeaderText="Кредит"></asp:BoundColumn>
							</Columns>
						</asp:datagrid></td>
				</tr>
			</table>
			<table id="table3" cellspacing="1" cellpadding="1" width="100%" border="0">
				<tr>
					<td></td>
					<td align="center"><a href='javascript:history.go(-1)'>буцах</a></td>
					<td></td>
				</tr>
			</table>
			<uc1:dood id="Dood1" runat="server"></uc1:dood>
		</form>
</body>
</html>
