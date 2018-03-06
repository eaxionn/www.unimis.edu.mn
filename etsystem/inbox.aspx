<%@ Page Language="vb" AutoEventWireup="false" Codebehind="inbox.aspx.vb" Inherits="e_testweb.inbox" %>
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
			<asp:label id="Label1" style="Z-INDEX: 103; LEFT: 8px; POSITION: absolute; TOP: 8px" runat="server"
				BackColor="PapayaWhip" Height="32px" Width="940px" BorderColor="Tan" BorderStyle="Solid"
				BorderWidth="1px"></asp:label>
			<asp:label id="Label24" style="Z-INDEX: 134; LEFT: 728px; POSITION: absolute; TOP: 88px" runat="server"
				Width="217px" Height="32px" BackColor="PapayaWhip" Font-Names="Tahoma" Font-Size="20pt"
				ForeColor="#405566">Захианы хайрцаг</asp:label><asp:label id="Label13" style="Z-INDEX: 126; LEFT: 16px; POSITION: absolute; TOP: 184px" runat="server"
				Height="40px" Width="104px" ForeColor="#404040" Font-Size="8pt" Font-Names="Tahoma"></asp:label><asp:imagebutton id="Imagebutton4" style="Z-INDEX: 125; LEFT: 40px; POSITION: absolute; TOP: 240px"
				runat="server" Height="48px" Width="48px" ImageUrl=".\mini\delete_ques.gif"></asp:imagebutton><asp:label id="Label17" style="Z-INDEX: 119; LEFT: 32px; POSITION: absolute; TOP: 288px" runat="server"
				Height="8px" Width="80px" ForeColor="#404040" Font-Size="8pt" Font-Names="Tahoma">Захиаг устгах</asp:label><asp:label id="Label12" style="Z-INDEX: 118; LEFT: 16px; POSITION: absolute; TOP: 152px" runat="server"
				BackColor="PapayaWhip" Height="8px" Width="32px" ForeColor="#404040" Font-Size="8pt" Font-Names="Tahoma" Font-Bold="True">Удирлага</asp:label><asp:label id="Label11" style="Z-INDEX: 117; LEFT: 8px; POSITION: absolute; TOP: 144px" runat="server"
				BackColor="PapayaWhip" Height="32px" Width="120px" BorderColor="Tan" BorderStyle="Solid" BorderWidth="1px"></asp:label><asp:label id="Label10" style="Z-INDEX: 116; LEFT: 8px; POSITION: absolute; TOP: 144px" runat="server"
				Height="168px" Width="120px" BorderColor="Tan" BorderStyle="Solid" BorderWidth="1px"></asp:label><asp:linkbutton id="LinkButton1" style="Z-INDEX: 115; LEFT: 872px; POSITION: absolute; TOP: 16px"
				runat="server" BackColor="PapayaWhip" Height="16px" Width="64px" ForeColor="#404040" Font-Size="8pt" Font-Names="Tahoma">Нvvр хуудас</asp:linkbutton><asp:imagebutton id="Imagebutton6" style="Z-INDEX: 114; LEFT: 856px; POSITION: absolute; TOP: 16px"
				runat="server" Height="12px" Width="12px" ImageUrl=".\mini\home.gif"></asp:imagebutton><asp:label id="Label9" style="Z-INDEX: 102; LEFT: 8px; POSITION: absolute; TOP: 8px" runat="server"
				BackColor="PapayaWhip" Height="120px" Width="940px" BorderColor="Tan" BorderStyle="Solid" BorderWidth="1px"></asp:label><asp:label id="Label8" style="Z-INDEX: 113; LEFT: 248px; POSITION: absolute; TOP: 104px" runat="server"
				BackColor="PapayaWhip" Height="8px" Width="56px" ForeColor="#404040" Font-Size="8pt" Font-Names="Tahoma">Хогийн сав</asp:label><asp:label id="Label7" style="Z-INDEX: 112; LEFT: 136px; POSITION: absolute; TOP: 104px" runat="server"
				BackColor="PapayaWhip" Height="8px" Width="88px" ForeColor="#404040" Font-Size="8pt" Font-Names="Tahoma">Захианы хайрцаг</asp:label><asp:label id="Label6" style="Z-INDEX: 111; LEFT: 40px; POSITION: absolute; TOP: 104px" runat="server"
				BackColor="PapayaWhip" Height="8px" Width="64px" ForeColor="#404040" Font-Size="8pt" Font-Names="Tahoma">Захиа бичих</asp:label><asp:imagebutton id="ImageButton3" style="Z-INDEX: 110; LEFT: 256px; POSITION: absolute; TOP: 48px"
				runat="server" Height="48px" Width="48px" ImageUrl=".\mini\trash.gif"></asp:imagebutton><asp:imagebutton id="ImageButton2" style="Z-INDEX: 109; LEFT: 152px; POSITION: absolute; TOP: 48px"
				runat="server" Height="48px" Width="48px" ImageUrl=".\mini\to_admin_msg.gif"></asp:imagebutton><asp:label id="Label5" style="Z-INDEX: 107; LEFT: 296px; POSITION: absolute; TOP: 16px" runat="server"
				BackColor="PapayaWhip" Height="8px" Width="72px" ForeColor="#404040" Font-Size="8pt" Font-Names="Tahoma"></asp:label><asp:label id="Label4" style="Z-INDEX: 106; LEFT: 216px; POSITION: absolute; TOP: 16px" runat="server"
				BackColor="PapayaWhip" Height="8px" Width="72px" ForeColor="#404040" Font-Size="8pt" Font-Names="Tahoma">Багшийн код :</asp:label><asp:label id="Label3" style="Z-INDEX: 105; LEFT: 104px; POSITION: absolute; TOP: 16px" runat="server"
				BackColor="PapayaWhip" Height="8px" Width="104px" ForeColor="#404040" Font-Size="8pt" Font-Names="Tahoma"></asp:label><asp:label id="Label2" style="Z-INDEX: 104; LEFT: 24px; POSITION: absolute; TOP: 16px" runat="server"
				BackColor="PapayaWhip" Height="8px" Width="72px" ForeColor="#404040" Font-Size="8pt" Font-Names="Tahoma">Багшийн нэр :</asp:label><asp:imagebutton id="ImageButton1" style="Z-INDEX: 108; LEFT: 48px; POSITION: absolute; TOP: 48px"
				runat="server" Height="48px" Width="48px" ImageUrl=".\mini\composer.gif"></asp:imagebutton><asp:label id="Label20" style="Z-INDEX: 124; LEFT: 744px; POSITION: absolute; TOP: 152px" runat="server"
				BackColor="PapayaWhip" Height="8px" Width="32px" ForeColor="#404040" Font-Size="8pt" Font-Names="Tahoma" Font-Bold="True">Огноо</asp:label><asp:label id="Label22" style="Z-INDEX: 123; LEFT: 264px; POSITION: absolute; TOP: 152px" runat="server"
				BackColor="PapayaWhip" Height="8px" Width="120px" ForeColor="#404040" Font-Size="8pt" Font-Names="Tahoma" Font-Bold="True">Захианы гарчиг</asp:label><asp:label id="Label19" style="Z-INDEX: 122; LEFT: 168px; POSITION: absolute; TOP: 152px" runat="server"
				BackColor="PapayaWhip" Height="8px" Width="32px" ForeColor="#404040" Font-Size="8pt" Font-Names="Tahoma" Font-Bold="True">Хэнээс</asp:label><asp:label id="Label18" style="Z-INDEX: 101; LEFT: 136px; POSITION: absolute; TOP: 144px" runat="server"
				BackColor="PapayaWhip" Height="32px" Width="812px" BorderColor="Tan" BorderStyle="Solid" BorderWidth="1px"></asp:label><asp:panel id="Panel1" style="Z-INDEX: 100; LEFT: 136px; POSITION: absolute; TOP: 144px" runat="server"
				Height="168px" Width="812px" ForeColor="#404040" Font-Size="8pt" Font-Names="Tahoma">
				<P>&nbsp;</P>
			</asp:panel><asp:checkbox id="CheckBox1" style="Z-INDEX: 121; LEFT: 144px; POSITION: absolute; TOP: 152px"
				runat="server" BackColor="PapayaWhip" Height="16px" Width="104px" ForeColor="#404040" Font-Size="8pt"
				Font-Names="Tahoma" Font-Bold="True" AutoPostBack="True"></asp:checkbox></form>
	</body>
</HTML>
