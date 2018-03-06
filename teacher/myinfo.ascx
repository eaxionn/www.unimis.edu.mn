<%@ Control Language="vb" AutoEventWireup="false" Inherits="teacher.myinfo" CodeFile="myinfo.ascx.vb" %>
<link href="web_default.css" rel="stylesheet" type="text/css">
<table style="WIDTH: 199px" cellspacing="0" cellpadding="0" width="199" border="0">
	<tr style="WIDTH: 199px; HEIGHT: 34px">
		<td background="images/teacher_new_05.png"></td>
	</tr>
	<tr style="WIDTH: 199px">
		<td><br/>
			<table style="WIDTH: 199px" cellspacing="0" cellpadding="0" width="199" border="0">
				<tr>
					<td rowspan="4" valign="top" width="6"><IMG src="images/spacer.gif"></td>
					<td width="78" valign="top" style="height: 12px"><strong>Нэр:</strong>&nbsp;</td>
					<td width="115" style="height: 12px">
						<asp:Label id="Label1" runat="server"></asp:Label></td>
				</tr>
				<tr>
					<td width="78" valign="top"><strong>Сургууль:</strong>&nbsp;</td>
					<td width="115">
						<asp:Label id="Label2" runat="server"></asp:Label></td>
				</tr>
				<tr>
					<td width="78" valign="top"><strong>Салбар:</strong>&nbsp;</td>
					<td width="115">
						<asp:Label id="Label3" runat="server"></asp:Label></td>
				</tr>
				<tr>
					<td width="78" valign="top"><strong>Зэрэг:</strong>&nbsp;</td>
					<td width="115">
						<asp:Label id="Label4" runat="server"></asp:Label></td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<br/>
