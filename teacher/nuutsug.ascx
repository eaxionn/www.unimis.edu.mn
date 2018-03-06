<%@ Control Language="vb" AutoEventWireup="false" Inherits="teacher.nuutsug" CodeFile="nuutsug.ascx.vb" %>
<asp:panel id="Panel1" runat="server" Width="199px">
	<DIV align="center">
		<asp:linkButton id="linkButton1" runat="server">Нууц vг солих</asp:linkButton></DIV>
</asp:panel><asp:panel id="Panel2" runat="server" Visible="False" Width="199px">
	<table id="table1" cellspacing="1" cellpadding="1" width="199" border="0">
		<tr>
			<td width="22" rowSpan="6"></td>
			<td>Хуучин нууц vг
			</td>
		</tr>
		<tr>
			<td>
				<asp:TextBox id="TextBox1" runat="server" TextMode="Password"></asp:TextBox>
				<asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="TextBox1"></asp:RequiredFieldValidator></td>
		</tr>
		<tr>
			<td>Шинэ нууц vг 2 удаа оруул</td>
		</tr>
		<tr>
			<td>
				<asp:TextBox id="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
				<asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="TextBox2"></asp:RequiredFieldValidator></td>
		</tr>
		<tr>
			<td>
				<asp:TextBox id="TextBox3" runat="server" TextMode="Password"></asp:TextBox>
				<asp:RequiredFieldValidator id="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="TextBox3"></asp:RequiredFieldValidator></td>
		</tr>
		<tr>
			<td>
				<asp:Button id="Button1" runat="server" Text="Солих"></asp:Button>
				<asp:Button id="Button2" runat="server" Text="Болих" CausesValidation="False"></asp:Button></td>
		</tr>
	</table>
</asp:panel><asp:label id="Label1" runat="server" ForeColor="Red"></asp:label><br/>
<br/>
