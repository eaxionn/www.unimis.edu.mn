<%@ Control Language="VB" AutoEventWireup="false" CodeFile="tolbor.ascx.vb" Inherits="tolbor" %>
<p align="center">
	<img alt="" src="images/tolbor.gif">
	<asp:Panel id="Panel1" runat="server">
		<table cellspacing="1" cellpadding="0" width="165" align="center" style="background-color:#819fc0" border="0">
			<tr>
				<td style="background-image:url(images/r_back_1.jpg)" >
					<table id="table1" cellspacing="1" cellpadding="1" width="150" align="center" border="0">
						<tr>
							<td>
								<div align="left">����� ������</div>
							</td>
						</tr>
						<tr>
							<td>
								<div align="left">
									<asp:Label id="Label9" runat="server"></asp:Label></div>
							</td>
						</tr>
						<tr>
							<td>
								<div align="left">������ ������</div>
							</td>
						</tr>
						<tr>
							<td>
								<div align="left">
									<asp:Label id="Label10" runat="server"></asp:Label></div>
							</td>
						</tr>
						<tr>
							<td>
								<div align="left">��������� �����</div>
							</td>
						</tr>
						<tr>
							<td>
								<div align="left">
									<asp:Label id="Label11" runat="server"></asp:Label></div>
							</td>
						</tr>
						<tr>
							<td>
								<div align="left">��������� ��vv</div>
							</td>
						</tr>
						<tr>
							<td>
								<div align="left">
									<asp:Label id="Label20" runat="server"></asp:Label></div>
							</td>
						</tr>
						<tr>
							<td align="center">
								<div align="left">
									<asp:LinkButton id="LinkButton1" runat="server">���������v�</asp:LinkButton></div>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</asp:Panel>
</P>
<asp:Panel id="Panel2" runat="server" Visible="False">
	<table id="table2" cellspacing="1" cellpadding="1" border="0">
		<tr>
			<td><strong>������</strong></td>
		</tr>
		<tr>
			<td>���� ������</td>
		</tr>
		<tr>
			<td>
				<asp:Label id="Label1" runat="server"></asp:Label></td>
		</tr>
		<tr>
			<td>����� ������</td>
		</tr>
		<tr>
			<td>
				<asp:Label id="Label2" runat="server"></asp:Label></td>
		</tr>
		<tr>
			<td>����� v�������</td>
		</tr>
		<tr>
			<td>
				<asp:Label id="Label3" runat="server"></asp:Label></td>
		</tr>
		<tr>
			<td><strong>�����</strong></td>
		</tr>
		<tr>
			<td>������� ���</td>
		</tr>
		<tr>
			<td>
				<asp:Label id="Label4" runat="server"></asp:Label></td>
		</tr>
		<tr>
			<td>���������</td>
		</tr>
		<tr>
			<td>
				<asp:Label id="Label5" runat="server"></asp:Label></td>
		</tr>
		<tr>
			<td>������</td>
		</tr>
		<tr>
			<td>
				<asp:Label id="Label6" runat="server"></asp:Label></td>
		</tr>
		<tr>
			<td>��������</td>
		</tr>
		<tr>
			<td>
				<asp:Label id="Label7" runat="server"></asp:Label></td>
		</tr>
		<tr>
			<td>��vv</td>
		</tr>
		<tr>
			<td>
				<asp:Label id="Label8" runat="server"></asp:Label></td>
		</tr>
		<tr>
			<td align="center">
				<asp:LinkButton id="LinkButton2" runat="server">����</asp:LinkButton></td>
		</tr>
	</table>
</asp:Panel>
