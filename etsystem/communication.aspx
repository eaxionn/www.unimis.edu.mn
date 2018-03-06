<%@ Page Language="vb" AutoEventWireup="false" Codebehind="communication.aspx.vb" Inherits="e_testweb.communication" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>Багшид мэдээлэл илгээх</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<link href="stylesss.css" rel="stylesheet" type="text/css">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<asp:textbox id="TextBox1" style="Z-INDEX: 104; LEFT: 8px; POSITION: absolute; TOP: 48px" runat="server"
				Height="128px" Width="304px" TextMode="MultiLine"></asp:textbox><asp:label id="Label5" style="Z-INDEX: 100; LEFT: 320px; POSITION: absolute; TOP: 48px" runat="server"
				Height="128px" Width="64px" BorderWidth="1px" BorderStyle="Solid" BorderColor="Silver" BackColor="WhiteSmoke"></asp:label><asp:label id="Label4" style="Z-INDEX: 108; LEFT: 336px; POSITION: absolute; TOP: 160px" runat="server"
				Height="8px" Width="32px" Font-Size="8pt" Font-Names="Tahoma" BackColor="WhiteSmoke" ForeColor="#404040">Гарах</asp:label><asp:label id="Label3" style="Z-INDEX: 107; LEFT: 336px; POSITION: absolute; TOP: 96px" runat="server"
				Height="8px" Width="40px" Font-Size="8pt" Font-Names="Tahoma" BackColor="WhiteSmoke" ForeColor="#404040">Илгээх</asp:label><asp:label id="Label2" style="Z-INDEX: 101; LEFT: 8px; POSITION: absolute; TOP: 8px" runat="server"
				Height="32px" Width="376px" BorderWidth="1px" BorderStyle="Solid" BorderColor="Silver" BackColor="WhiteSmoke"></asp:label><asp:label id="Label1" style="Z-INDEX: 103; LEFT: 48px; POSITION: absolute; TOP: 16px" runat="server"
				Height="16px" Width="304px" Font-Size="8pt" Font-Names="Tahoma" BackColor="WhiteSmoke">Багшид егех мэдээллээ бич нvv!</asp:label><asp:imagebutton id="ImageButton1" style="Z-INDEX: 105; LEFT: 336px; POSITION: absolute; TOP: 56px"
				runat="server" Height="32px" Width="32px" ImageUrl=".\mini\sent_msg.gif"></asp:imagebutton><asp:imagebutton id="ImageButton2" style="Z-INDEX: 106; LEFT: 336px; POSITION: absolute; TOP: 120px"
				runat="server" Height="32px" Width="32px" ImageUrl=".\mini\cancel.gif"></asp:imagebutton><asp:image id="Image1" style="Z-INDEX: 109; LEFT: 24px; POSITION: absolute; TOP: 16px" runat="server"
				Height="12px" Width="12px" ImageUrl=".\mini\ok.gif" Visible="False"></asp:image></form>
	</body>
</HTML>
