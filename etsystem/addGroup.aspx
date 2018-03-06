<%@ Page Language="vb" AutoEventWireup="false" Codebehind="addGroup.aspx.vb" Inherits="e_testweb.addGroup" %>
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
function popUp(page, name, details) {
newWin=window.open(page, name, details);
return false;
}
		</SCRIPT>
		<form id="Form1" method="post" runat="server">
			<asp:label id="Label1" style="Z-INDEX: 101; LEFT: 8px; POSITION: absolute; TOP: 8px" runat="server"
				BackColor="PapayaWhip" Height="32px" Width="940px" BorderColor="Tan" BorderStyle="Solid"
				BorderWidth="1px"></asp:label>
			<asp:label id="Label30" style="Z-INDEX: 144; LEFT: 656px; POSITION: absolute; TOP: 376px" runat="server"
				Width="32px" Height="8px" BackColor="PapayaWhip" ForeColor="#404040" Font-Size="8pt" Font-Names="Tahoma"
				Font-Bold="True">Устгах</asp:label><asp:imagebutton id="ImageButton6" style="Z-INDEX: 143; LEFT: 728px; POSITION: absolute; TOP: 464px"
				runat="server" Height="12px" Width="12px" Visible="False" ImageUrl=".\mini\error.gif"></asp:imagebutton><asp:linkbutton id="LinkButton2" style="Z-INDEX: 142; LEFT: 744px; POSITION: absolute; TOP: 464px"
				runat="server" Height="16px" Width="112px" Visible="False" Font-Names="Tahoma" Font-Size="7pt" ForeColor="#404040">Бvлгийн медиаг хасах</asp:linkbutton><asp:imagebutton id="ImageButton5" style="Z-INDEX: 141; LEFT: 728px; POSITION: absolute; TOP: 408px"
				runat="server" Height="12px" Width="12px" Visible="False" ImageUrl=".\mini\error.gif"></asp:imagebutton><asp:linkbutton id="LinkButton1" style="Z-INDEX: 140; LEFT: 744px; POSITION: absolute; TOP: 408px"
				runat="server" Height="16px" Width="112px" Visible="False" Font-Names="Tahoma" Font-Size="7pt" ForeColor="#404040">Бvлгийн зургийг хасах</asp:linkbutton><asp:imagebutton id="ImageButton4" style="Z-INDEX: 139; LEFT: 568px; POSITION: absolute; TOP: 88px"
				runat="server" Height="23px" Width="79px" ImageUrl=".\mini\cbutton.gif"></asp:imagebutton><asp:label id="Label29" style="Z-INDEX: 138; LEFT: 856px; POSITION: absolute; TOP: 16px" runat="server"
				BackColor="PapayaWhip" Height="8px" Width="91px" Font-Names="Tahoma" Font-Size="10pt" ForeColor="#405566" Font-Bold="True">Бvлэг нэмэх</asp:label><asp:textbox id="txtBuleg" style="Z-INDEX: 137; LEFT: 48px; POSITION: absolute; TOP: 152px" runat="server"
				Height="88px" Width="600px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040" TextMode="MultiLine"></asp:textbox><asp:textbox id="txtBulegNer" style="Z-INDEX: 136; LEFT: 48px; POSITION: absolute; TOP: 112px"
				runat="server" Height="24px" Width="600px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040"></asp:textbox><asp:label id="Label28" style="Z-INDEX: 135; LEFT: 728px; POSITION: absolute; TOP: 552px" runat="server"
				Height="48px" Width="216px" Font-Names="Tahoma" Font-Size="7pt" ForeColor="#404040"></asp:label><asp:label id="Label27" style="Z-INDEX: 134; LEFT: 728px; POSITION: absolute; TOP: 496px" runat="server"
				Height="48px" Width="216px" Font-Names="Tahoma" Font-Size="7pt" ForeColor="#404040"></asp:label><asp:label id="Label26" style="Z-INDEX: 133; LEFT: 800px; POSITION: absolute; TOP: 440px" runat="server"
				Height="8px" Width="144px" Visible="False" Font-Names="Tahoma" Font-Size="7pt" ForeColor="#404040"></asp:label><asp:label id="Label25" style="Z-INDEX: 132; LEFT: 728px; POSITION: absolute; TOP: 440px" runat="server"
				Height="8px" Width="64px" Visible="False" Font-Names="Tahoma" Font-Size="7pt" ForeColor="#404040">Бvлгийн медиа</asp:label><asp:label id="Label24" style="Z-INDEX: 131; LEFT: 816px; POSITION: absolute; TOP: 96px" runat="server"
				BackColor="PapayaWhip" Height="8px" Width="48px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040">Цэвэрлэх</asp:label><asp:imagebutton id="Imagebutton2" style="Z-INDEX: 130; LEFT: 824px; POSITION: absolute; TOP: 64px"
				runat="server" Height="32px" Width="32px" ImageUrl=".\mini\clear.gif"></asp:imagebutton><asp:label id="Label17" style="Z-INDEX: 129; LEFT: 592px; POSITION: absolute; TOP: 376px" runat="server"
				BackColor="PapayaWhip" Height="8px" Width="32px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040" Font-Bold="True">Засах</asp:label><asp:label id="Label16" style="Z-INDEX: 127; LEFT: 296px; POSITION: absolute; TOP: 376px" runat="server"
				BackColor="PapayaWhip" Height="8px" Width="104px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040" Font-Bold="True">Бvлгийн тайлбар</asp:label><asp:label id="Label15" style="Z-INDEX: 126; LEFT: 88px; POSITION: absolute; TOP: 376px" runat="server"
				BackColor="PapayaWhip" Height="8px" Width="144px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040" Font-Bold="True">Бvлгийн нэр</asp:label><asp:label id="Label14" style="Z-INDEX: 125; LEFT: 16px; POSITION: absolute; TOP: 376px" runat="server"
				BackColor="PapayaWhip" Height="8px" Width="32px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040" Font-Bold="True">Дугаар</asp:label><asp:label id="Label13" style="Z-INDEX: 124; LEFT: 8px; POSITION: absolute; TOP: 368px" runat="server"
				BackColor="PapayaWhip" Height="32px" Width="712px" BorderColor="Tan" BorderStyle="Solid" BorderWidth="1px"></asp:label><asp:panel id="Panel1" style="Z-INDEX: 123; LEFT: 8px; POSITION: absolute; TOP: 368px" runat="server"
				Height="120px" Width="712px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040">
				<P>&nbsp;</P>
			</asp:panel><asp:label id="Label21" style="Z-INDEX: 122; LEFT: 728px; POSITION: absolute; TOP: 168px" runat="server"
				Height="8px" Width="208px" Visible="False" Font-Names="Tahoma" Font-Size="7pt" ForeColor="#404040">Бvлгийн зураг ( жижигрvvлж харуулж байна )</asp:label><asp:image id="Image1" style="Z-INDEX: 121; LEFT: 728px; POSITION: absolute; TOP: 184px" runat="server"
				Height="220px" Width="220px" Visible="False"></asp:image><asp:label id="Label18" style="Z-INDEX: 120; LEFT: 896px; POSITION: absolute; TOP: 96px" runat="server"
				BackColor="PapayaWhip" Height="8px" Width="24px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040">Буцах</asp:label><asp:label id="Label10" style="Z-INDEX: 119; LEFT: 744px; POSITION: absolute; TOP: 96px" runat="server"
				BackColor="PapayaWhip" Height="8px" Width="48px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040">Хадгалах</asp:label><asp:imagebutton id="Imagebutton3" style="Z-INDEX: 118; LEFT: 896px; POSITION: absolute; TOP: 64px"
				runat="server" Height="32px" Width="32px" ImageUrl=".\mini\cancel.gif"></asp:imagebutton><asp:imagebutton id="ImageButton1" style="Z-INDEX: 117; LEFT: 752px; POSITION: absolute; TOP: 64px"
				runat="server" Height="32px" Width="32px" ImageUrl=".\mini\save.gif"></asp:imagebutton><asp:label id="Label8" style="Z-INDEX: 116; LEFT: 48px; POSITION: absolute; TOP: 136px" runat="server"
				Height="8px" Width="96px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040">Бvлгийн тайлбар :</asp:label><asp:label id="Label12" style="Z-INDEX: 115; LEFT: 48px; POSITION: absolute; TOP: 96px" runat="server"
				Height="8px" Width="96px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040">Бvлгийн нэр :</asp:label><asp:label id="Label20" style="Z-INDEX: 114; LEFT: 48px; POSITION: absolute; TOP: 288px" runat="server"
				Height="8px" Width="96px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040">Бvлгийн медиа :</asp:label><INPUT id="UploadMedia" style="Z-INDEX: 113; LEFT: 48px; WIDTH: 448px; POSITION: absolute; TOP: 304px; HEIGHT: 24px"
				tabIndex="7" type="file" size="55" name="UploadMedia" runat="server"><INPUT language="vb" id="UploadPic" dir="ltr" style="Z-INDEX: 112; LEFT: 48px; WIDTH: 448px; POSITION: absolute; TOP: 264px; HEIGHT: 25px; TEXT-DECORATION: none"
				tabIndex="6" type="file" size="55" name="UploadPic" runat="server">
			<asp:label id="Label19" style="Z-INDEX: 111; LEFT: 48px; POSITION: absolute; TOP: 248px" runat="server"
				Height="8px" Width="88px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040">Бvлгийн зураг :</asp:label><asp:label id="Label9" style="Z-INDEX: 110; LEFT: 728px; POSITION: absolute; TOP: 48px" runat="server"
				BackColor="PapayaWhip" Height="72px" Width="220px" BorderColor="Tan" BorderStyle="Solid" BorderWidth="1px"></asp:label><asp:label id="Label11" style="Z-INDEX: 100; LEFT: 8px; POSITION: absolute; TOP: 48px" runat="server"
				Height="312px" Width="712px" BorderColor="Tan" BorderStyle="Solid" BorderWidth="1px"></asp:label><asp:label id="Label22" style="Z-INDEX: 108; LEFT: 8px; POSITION: absolute; TOP: 48px" runat="server"
				BackColor="PapayaWhip" Height="32px" Width="712px" BorderColor="Tan" BorderStyle="Solid" BorderWidth="1px"></asp:label><asp:label id="Label23" style="Z-INDEX: 109; LEFT: 16px; POSITION: absolute; TOP: 56px" runat="server"
				BackColor="PapayaWhip" Height="8px" Width="144px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040" Font-Bold="True">Бvлэг vvсгэх талбар</asp:label><asp:label id="Label7" style="Z-INDEX: 107; LEFT: 496px; POSITION: absolute; TOP: 16px" runat="server"
				BackColor="PapayaWhip" Height="8px" Width="72px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040"></asp:label><asp:label id="Label6" style="Z-INDEX: 106; LEFT: 408px; POSITION: absolute; TOP: 16px" runat="server"
				BackColor="PapayaWhip" Height="8px" Width="88px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040">Хичээлийн код :</asp:label><asp:label id="Label5" style="Z-INDEX: 105; LEFT: 296px; POSITION: absolute; TOP: 16px" runat="server"
				BackColor="PapayaWhip" Height="8px" Width="72px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040"></asp:label><asp:label id="Label4" style="Z-INDEX: 104; LEFT: 216px; POSITION: absolute; TOP: 16px" runat="server"
				BackColor="PapayaWhip" Height="8px" Width="72px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040">Багшийн код :</asp:label><asp:label id="Label3" style="Z-INDEX: 103; LEFT: 104px; POSITION: absolute; TOP: 16px" runat="server"
				BackColor="PapayaWhip" Height="8px" Width="104px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040"></asp:label><asp:label id="Label2" style="Z-INDEX: 102; LEFT: 24px; POSITION: absolute; TOP: 16px" runat="server"
				BackColor="PapayaWhip" Height="8px" Width="72px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040">Багшийн нэр :</asp:label></form>
	</body>
</HTML>
