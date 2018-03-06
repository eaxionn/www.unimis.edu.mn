<%@ Page Language="vb" AutoEventWireup="false" Codebehind="result.aspx.vb" Inherits="e_testweb.result" %>
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
		<SCRIPT>
window.name = "currentWindowName";
var newWin;
var newWin2;

function popUp(page, name, details) {
newWin=window.open(page, name, details);
return false;
}
function popUp2(page, name, details) {
newWin=window.open(page, name, details);
newWin.focus();
return false;
 }
		</SCRIPT>
		<form id="Form1" method="post" runat="server">
			<asp:label id="Label1" style="Z-INDEX: 112; LEFT: 8px; POSITION: absolute; TOP: 8px" runat="server"
				Width="640px" Height="40px" BackColor="WhiteSmoke" BorderWidth="1px" BorderStyle="Solid"
				BorderColor="Silver"></asp:label>
			<asp:label id="Label22" style="Z-INDEX: 126; LEFT: 160px; POSITION: absolute; TOP: 72px" runat="server"
				BackColor="WhiteSmoke" Height="8px" Width="112px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040"
				Font-Bold="True">Шалгалтын vр дvн</asp:label>
			<asp:label id="Label21" style="Z-INDEX: 125; LEFT: 24px; POSITION: absolute; TOP: 64px" runat="server"
				BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" BackColor="WhiteSmoke" Height="32px"
				Width="256px"></asp:label>
			<asp:label id="Label20" style="Z-INDEX: 101; LEFT: 8px; POSITION: absolute; TOP: 56px" runat="server"
				BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" Height="320px" Width="640px"></asp:label>
			<asp:label id="Label19" style="Z-INDEX: 124; LEFT: 152px; POSITION: absolute; TOP: 104px" runat="server"
				Width="88px" Height="8px" ForeColor="#404040" Font-Size="8pt" Font-Names="Tahoma"></asp:label>
			<asp:label id="Label18" style="Z-INDEX: 123; LEFT: 56px; POSITION: absolute; TOP: 104px" runat="server"
				Width="88px" Height="8px" ForeColor="#404040" Font-Size="8pt" Font-Names="Tahoma">Хичээлийн код :</asp:label>
			<asp:label id="Label17" style="Z-INDEX: 122; LEFT: 184px; POSITION: absolute; TOP: 176px" runat="server"
				Width="96px" Height="8px" ForeColor="#404040" Font-Size="8pt" Font-Names="Tahoma"></asp:label>
			<asp:label id="Label16" style="Z-INDEX: 121; LEFT: 184px; POSITION: absolute; TOP: 152px" runat="server"
				Width="96px" Height="8px" ForeColor="#404040" Font-Size="8pt" Font-Names="Tahoma"></asp:label>
			<asp:label id="Label15" style="Z-INDEX: 120; LEFT: 160px; POSITION: absolute; TOP: 128px" runat="server"
				Width="96px" Height="8px" ForeColor="#404040" Font-Size="8pt" Font-Names="Tahoma"></asp:label>
			<asp:label id="Label12" style="Z-INDEX: 119; LEFT: 56px; POSITION: absolute; TOP: 128px" runat="server"
				Width="96px" Height="8px" ForeColor="#404040" Font-Size="8pt" Font-Names="Tahoma">Таны авсан оноо :</asp:label>
			<asp:label id="Label14" style="Z-INDEX: 118; LEFT: 56px; POSITION: absolute; TOP: 176px" runat="server"
				Width="128px" Height="8px" ForeColor="#404040" Font-Size="8pt" Font-Names="Tahoma">Таны vзvvлсэн амжилт :</asp:label>
			<asp:label id="Label13" style="Z-INDEX: 117; LEFT: 56px; POSITION: absolute; TOP: 152px" runat="server"
				Width="120px" Height="8px" ForeColor="#404040" Font-Size="8pt" Font-Names="Tahoma">Шалгалтын дээд оноо :</asp:label><asp:label id="Label6" style="Z-INDEX: 113; LEFT: 24px; POSITION: absolute; TOP: 16px" runat="server"
				Width="72px" Height="16px" ForeColor="#404040" Font-Size="8pt" Font-Names="Tahoma" BackColor="WhiteSmoke">Оюутны нэр :</asp:label><asp:label id="Label3" style="Z-INDEX: 114; LEFT: 104px; POSITION: absolute; TOP: 16px" runat="server"
				Width="88px" Height="16px" ForeColor="#404040" Font-Size="8pt" Font-Names="Tahoma" BackColor="WhiteSmoke"></asp:label><asp:label id="Label5" style="Z-INDEX: 115; LEFT: 224px; POSITION: absolute; TOP: 16px" runat="server"
				Width="72px" Height="16px" ForeColor="#404040" Font-Size="8pt" Font-Names="Tahoma" BackColor="WhiteSmoke">Оюутны код :</asp:label><asp:label id="Label2" style="Z-INDEX: 116; LEFT: 304px; POSITION: absolute; TOP: 16px" runat="server"
				Width="72px" Height="16px" ForeColor="#404040" Font-Size="8pt" Font-Names="Tahoma" BackColor="WhiteSmoke"></asp:label><asp:label id="Label11" style="Z-INDEX: 111; LEFT: 664px; POSITION: absolute; TOP: 352px" runat="server"
				Width="113px" Height="8px" ForeColor="#404040" Font-Size="8pt" Font-Names="Tahoma" BackColor="WhiteSmoke">Санал, хvсэлт илгээх</asp:label><asp:imagebutton id="btn4" style="Z-INDEX: 110; LEFT: 696px; POSITION: absolute; TOP: 296px" runat="server"
				Width="48px" Height="48px" ImageUrl=".\mini\to_admin_msg1.gif"></asp:imagebutton><asp:label id="Label10" style="Z-INDEX: 109; LEFT: 680px; POSITION: absolute; TOP: 264px" runat="server"
				Width="88px" Height="8px" ForeColor="#404040" Font-Size="8pt" Font-Names="Tahoma" BackColor="WhiteSmoke">Цонхноос гарах</asp:label><asp:label id="Label9" style="Z-INDEX: 102; LEFT: 656px; POSITION: absolute; TOP: 208px" runat="server"
				Width="128px" Height="168px" BackColor="WhiteSmoke" BorderWidth="1px" BorderStyle="Solid" BorderColor="Silver"></asp:label><asp:imagebutton id="btn3" style="Z-INDEX: 108; LEFT: 704px; POSITION: absolute; TOP: 224px" runat="server"
				Width="32px" Height="32px" ImageUrl=".\mini\cancel1.gif"></asp:imagebutton><asp:label id="Label8" style="Z-INDEX: 103; LEFT: 656px; POSITION: absolute; TOP: 8px" runat="server"
				Width="128px" Height="192px" BackColor="WhiteSmoke" BorderWidth="1px" BorderStyle="Solid" BorderColor="Silver"></asp:label><asp:imagebutton id="btn1" style="Z-INDEX: 107; LEFT: 696px; POSITION: absolute; TOP: 24px" runat="server"
				Width="48px" Height="48px" ImageUrl=".\mini\result.gif"></asp:imagebutton><asp:label id="Label7" style="Z-INDEX: 106; LEFT: 680px; POSITION: absolute; TOP: 80px" runat="server"
				Width="86px" Height="8px" ForeColor="#404040" Font-Size="8pt" Font-Names="Tahoma" BackColor="WhiteSmoke">Шалгалт дvгнэх</asp:label><asp:imagebutton id="btn2" style="Z-INDEX: 104; LEFT: 696px; POSITION: absolute; TOP: 112px" runat="server"
				Width="48px" Height="48px" ImageUrl=".\mini\to_exam.gif"></asp:imagebutton><asp:label id="Label4" style="Z-INDEX: 105; LEFT: 672px; POSITION: absolute; TOP: 168px" runat="server"
				Width="96px" Height="8px" ForeColor="#404040" Font-Size="8pt" Font-Names="Tahoma" BackColor="WhiteSmoke">Шалгалтруу буцах</asp:label></form>
	</body>
</HTML>
