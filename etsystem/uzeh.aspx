<%@ Page Language="vb" AutoEventWireup="false" Codebehind="uzeh.aspx.vb" Inherits="e_testweb.uzeh" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>ЭТС - Электрон тестийн систем</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<link href="stylesss.css" rel="stylesheet" type="text/css">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<asp:textbox id="TextBox1" style="Z-INDEX: 110; LEFT: 8px; POSITION: absolute; TOP: 48px" runat="server"
				Width="304px" Height="128px" TextMode="MultiLine"></asp:textbox>
			<asp:label id="Label5" style="Z-INDEX: 100; LEFT: 320px; POSITION: absolute; TOP: 48px" runat="server"
				Width="64px" Height="128px" BorderWidth="1px" BorderStyle="Solid" BorderColor="Silver"
				BackColor="WhiteSmoke"></asp:label>
			<asp:label id="Label4" style="Z-INDEX: 108; LEFT: 336px; POSITION: absolute; TOP: 96px" runat="server"
				Width="32px" Height="8px" BackColor="WhiteSmoke" Font-Size="8pt" Font-Names="Tahoma" ForeColor="#404040">Гарах</asp:label>
			<asp:label id="Label2" style="Z-INDEX: 101; LEFT: 8px; POSITION: absolute; TOP: 8px" runat="server"
				Width="376px" Height="32px" BorderWidth="1px" BorderStyle="Solid" BorderColor="Silver"
				BackColor="WhiteSmoke"></asp:label>
			<asp:label id="Label1" style="Z-INDEX: 103; LEFT: 48px; POSITION: absolute; TOP: 16px" runat="server"
				Width="304px" Height="16px" BackColor="WhiteSmoke" Font-Size="8pt" Font-Names="Tahoma">Багшаас ирсэн мэдээлэл</asp:label>
			<asp:imagebutton id="ImageButton2" style="Z-INDEX: 106; LEFT: 336px; POSITION: absolute; TOP: 56px"
				runat="server" Width="32px" Height="32px" ImageUrl=".\mini\cancel.gif"></asp:imagebutton>
			<asp:image id="Image1" style="Z-INDEX: 109; LEFT: 24px; POSITION: absolute; TOP: 16px" runat="server"
				Width="12px" Height="12px" ImageUrl=".\mini\ok.gif"></asp:image></form>
	</body>
</HTML>
