<%@ Control Language="vb" AutoEventWireup="false" Inherits="teacher.tsalin" CodeFile="tsalin.ascx.vb" %>
<link href="web_default.css" type="text/css" rel="stylesheet">
<table style="WIDTH: 199px" cellspacing="0" cellpadding="0" width="199" border="0">
	<tr style="WIDTH: 199px; HEIGHT: 34px">
		<td background="images/teacher_new_08.png"></td>
	</tr>
	<tr style="WIDTH: 199px">
		<td><br/>
			<table style="WIDTH: 199px" cellspacing="0" cellpadding="0" width="199" border="0">
				<tr>
					<td valign="top" width="6" rowSpan="14"><IMG src="images/spacer.gif"></td>
					<td valign="top" align="right" width="125">����������� ������:&nbsp;</td>
					<td width="68">
						<asp:Label id="Label14" runat="server"></asp:Label></td>
				</tr>
				<tr>
					<td valign="top" width="125"><strong>����� ����� �����:</strong>&nbsp;</td>
					<td width="68"><asp:label id="Label1" runat="server" Font-Bold="true">0 �.�</asp:label></td>
				</tr>
				<tr>
					<td valign="top" align="right" width="125">��������� �����:&nbsp;</td>
					<td width="68"><asp:label id="Label2" runat="server">0</asp:label></td>
				</tr>
				<tr>
					<td valign="top" align="right" width="125">Y����� �����:&nbsp;</td>
					<td width="68"><asp:label id="Label3" runat="server">0 �.�</asp:label></td>
				</tr>
				<tr>
					<td valign="top" align="right" width="125">���� ��������:&nbsp;</td>
					<td width="68"><asp:label id="Label4" runat="server">0 �.�</asp:label></td>
				</tr>
				<tr>
					<td valign="top" align="right" width="125">������� �����:&nbsp;</td>
					<td width="68"><asp:label id="Label5" runat="server">0 �.�</asp:label></td>
				</tr>
				<tr>
					<td valign="top" align="right" width="125">���� �������:&nbsp;</td>
					<td width="68">
						<asp:Label id="Label6" runat="server">0 �.�</asp:Label></td>
				</tr>
				<tr>
					<td valign="top" width="125"><strong>����� ������ �����:</strong>&nbsp;</td>
					<td width="68">
						<asp:Label id="Label7" runat="server" Font-Bold="true">0 �.�</asp:Label></td>
				</tr>
				<tr>
					<td valign="top" width="125" align="right" style="height: 12px">��������� �����:&nbsp;</td>
					<td width="68" style="height: 12px">
						<asp:Label id="Label8" runat="server">0</asp:Label></td>
				</tr>
				<tr>
					<td valign="top" width="125" align="right">Y����� �����:&nbsp;</td>
					<td width="68">
						<asp:Label id="Label9" runat="server">0 �.�</asp:Label></td>
				</tr>
				<tr>
					<td valign="top" width="125" align="right">���� ��������:&nbsp;</td>
					<td width="68">
						<asp:Label id="Label10" runat="server">0 �.�</asp:Label></td>
				</tr>
				<tr>
					<td valign="top" width="125" align="right">������� �����:&nbsp;</td>
					<td width="68">
						<asp:Label id="Label11" runat="server">0 �.�</asp:Label></td>
				</tr>
				<tr>
					<td valign="top" width="125" align="right">���� �������:&nbsp;</td>
					<td width="68">
						<asp:Label id="Label12" runat="server">0 �.�</asp:Label></td>
				</tr>
				<tr>
					<td valign="top" width="125"><strong>����� ���� �v�:</strong>&nbsp;</td>
					<td width="68">
						<asp:Label id="Label13" runat="server" Font-Bold="true">0 �.�</asp:Label></td>
				</tr>
			</table>
		</td>
	</tr>
</table>
