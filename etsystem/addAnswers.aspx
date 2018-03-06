<%@ Page Language="vb" autoeventwireup="false" codebehind="addAnswers.aspx.vb" Inherits="e_testweb.addAnswers" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>ЭТС - Электрон тестийн систем</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
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
			<asp:label id="Label1" style="Z-INDEX: 104; LEFT: 8px; POSITION: absolute; TOP: 8px" runat="server"
				BackColor="PapayaWhip" Height="32px" Width="940px" BorderColor="Tan" BorderStyle="Solid"
				BorderWidth="1px"></asp:label>
			<asp:label id="Label26" style="Z-INDEX: 144; LEFT: 656px; POSITION: absolute; TOP: 376px" runat="server"
				Width="32px" Height="8px" BackColor="PapayaWhip" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040"
				Font-Bold="True">Устгах</asp:label>
			<asp:LinkButton id="LinkButton2" style="Z-INDEX: 143; LEFT: 744px; POSITION: absolute; TOP: 544px"
				runat="server" Width="112px" Height="16px" ForeColor="#404040" Font-Size="7pt" Font-Names="Tahoma"
				Visible="False">Хариултын томъёог хасах</asp:LinkButton>
			<asp:ImageButton id="ImageButton6" style="Z-INDEX: 142; LEFT: 728px; POSITION: absolute; TOP: 544px"
				runat="server" Width="12px" Height="12px" ImageUrl=".\mini\error.gif" Visible="False"></asp:ImageButton><asp:label id="Label29" style="Z-INDEX: 138; LEFT: 832px; POSITION: absolute; TOP: 16px" runat="server"
				BackColor="PapayaWhip" Height="8px" Width="115px" Font-Bold="True" Font-Names="Tahoma" Font-Size="10pt" ForeColor="#405566"> Хариулт нэмэх </asp:label><asp:image id="Image2" style="Z-INDEX: 137; LEFT: 728px; POSITION: absolute; TOP: 416px" runat="server"
				Height="124px" Width="220px" Visible="False"></asp:image><asp:imagebutton id="Imagebutton3" style="Z-INDEX: 136; LEFT: 896px; POSITION: absolute; TOP: 64px"
				runat="server" Height="32px" Width="32px" ImageUrl=".\mini\cancel.gif"></asp:imagebutton><asp:imagebutton id="Imagebutton2" style="Z-INDEX: 135; LEFT: 824px; POSITION: absolute; TOP: 64px"
				runat="server" Height="32px" Width="32px" ImageUrl=".\mini\clear.gif"></asp:imagebutton><asp:imagebutton id="ImageButton1" style="Z-INDEX: 134; LEFT: 752px; POSITION: absolute; TOP: 64px"
				runat="server" Height="32px" Width="32px" ImageUrl=".\mini\save.gif"></asp:imagebutton><INPUT id="UploadMedia" style="Z-INDEX: 133; LEFT: 48px; WIDTH: 448px; POSITION: absolute; TOP: 304px; HEIGHT: 24px"
				tabIndex="7" type="file" size="55" name="UploadMedia" runat="server"><INPUT language="vb" id="UploadPic" dir="ltr" style="Z-INDEX: 132; LEFT: 48px; WIDTH: 448px; POSITION: absolute; TOP: 264px; HEIGHT: 25px; TEXT-DECORATION: none"
				tabIndex="6" type="file" size="55" name="UploadPic" runat="server">
			<asp:textbox id="txtHariult" style="Z-INDEX: 131; LEFT: 48px; POSITION: absolute; TOP: 112px"
				runat="server" Height="88px" Width="600px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040"
				TextMode="MultiLine"></asp:textbox><asp:textbox id="txtOnoo" style="Z-INDEX: 130; LEFT: 48px; POSITION: absolute; TOP: 216px" runat="server"
				Height="24px" Width="144px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040">0</asp:textbox><asp:label id="Label28" style="Z-INDEX: 105; LEFT: 728px; POSITION: absolute; TOP: 616px" runat="server"
				Height="48px" Width="216px" Font-Names="Tahoma" Font-Size="7pt" ForeColor="#404040"></asp:label><asp:label id="Label27" style="Z-INDEX: 106; LEFT: 728px; POSITION: absolute; TOP: 568px" runat="server"
				Height="48px" Width="216px" Font-Names="Tahoma" Font-Size="7pt" ForeColor="#404040"></asp:label><asp:label id="Label25" style="Z-INDEX: 107; LEFT: 728px; POSITION: absolute; TOP: 400px" runat="server"
				Height="8px" Width="232px" Font-Names="Tahoma" Font-Size="7pt" ForeColor="#404040" Visible="False">  Хариултын томъёо ( жижигрvvлж харуулж байна   )</asp:label><asp:label id="Label24" style="Z-INDEX: 108; LEFT: 816px; POSITION: absolute; TOP: 96px" runat="server"
				BackColor="PapayaWhip" Height="8px" Width="48px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040">Цэвэрлэх</asp:label>
			<asp:label id="Label17" style="Z-INDEX: 109; LEFT: 592px; POSITION: absolute; TOP: 376px" runat="server"
				Width="32px" Height="8px" BackColor="PapayaWhip" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040"
				Font-Bold="True">Засах</asp:label>
			<asp:label id="Label16" style="Z-INDEX: 111; LEFT: 528px; POSITION: absolute; TOP: 376px" runat="server"
				Width="40px" Height="8px" BackColor="PapayaWhip" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040"
				Font-Bold="True">Оноо</asp:label><asp:label id="Label15" style="Z-INDEX: 112; LEFT: 88px; POSITION: absolute; TOP: 376px" runat="server"
				BackColor="PapayaWhip" Height="8px" Width="144px" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040">Хариулт</asp:label><asp:label id="Label14" style="Z-INDEX: 113; LEFT: 16px; POSITION: absolute; TOP: 376px" runat="server"
				BackColor="PapayaWhip" Height="8px" Width="32px" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040">Дугаар</asp:label><asp:label id="Label13" style="Z-INDEX: 102; LEFT: 8px; POSITION: absolute; TOP: 368px" runat="server"
				BackColor="PapayaWhip" Height="32px" Width="712px" BorderColor="Tan" BorderStyle="Solid" BorderWidth="1px"></asp:label><asp:panel id="Panel1" style="Z-INDEX: 103; LEFT: 8px; POSITION: absolute; TOP: 368px" runat="server"
				Height="136px" Width="712px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040">
				<P>&nbsp;</P>
			</asp:panel><asp:label id="Label21" style="Z-INDEX: 114; LEFT: 728px; POSITION: absolute; TOP: 136px" runat="server"
				Height="8px" Width="224px" Font-Names="Tahoma" Font-Size="7pt" ForeColor="#404040" Visible="False">  Хариултын зураг ( жижигрvvлж харуулж байна   )</asp:label><asp:image id="Image1" style="Z-INDEX: 115; LEFT: 728px; POSITION: absolute; TOP: 152px" runat="server"
				Height="220px" Width="220px" Visible="False"></asp:image><asp:label id="Label18" style="Z-INDEX: 116; LEFT: 896px; POSITION: absolute; TOP: 96px" runat="server"
				BackColor="PapayaWhip" Height="8px" Width="24px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040">Буцах</asp:label><asp:label id="Label10" style="Z-INDEX: 117; LEFT: 744px; POSITION: absolute; TOP: 96px" runat="server"
				BackColor="PapayaWhip" Height="8px" Width="48px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040">Хадгалах</asp:label><asp:label id="Label8" style="Z-INDEX: 118; LEFT: 48px; POSITION: absolute; TOP: 96px" runat="server"
				Height="8px" Width="128px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040">   Хариулт бичих талбар   :</asp:label><asp:label id="Label12" style="Z-INDEX: 119; LEFT: 48px; POSITION: absolute; TOP: 200px" runat="server"
				Height="8px" Width="152px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040">   Хариултад харгалзах оноо   :</asp:label><asp:label id="Label20" style="Z-INDEX: 120; LEFT: 48px; POSITION: absolute; TOP: 288px" runat="server"
				Height="8px" Width="104px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040">  Хариултын томъёо  :</asp:label><asp:label id="Label19" style="Z-INDEX: 121; LEFT: 48px; POSITION: absolute; TOP: 248px" runat="server"
				Height="8px" Width="96px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040">  Хариултын зураг  :</asp:label><asp:label id="Label9" style="Z-INDEX: 101; LEFT: 728px; POSITION: absolute; TOP: 48px" runat="server"
				BackColor="PapayaWhip" Height="72px" Width="220px" BorderColor="Tan" BorderStyle="Solid" BorderWidth="1px"></asp:label><asp:label id="Label11" style="Z-INDEX: 100; LEFT: 8px; POSITION: absolute; TOP: 48px" runat="server"
				Height="312px" Width="712px" BorderColor="Tan" BorderStyle="Solid" BorderWidth="1px"></asp:label><asp:label id="Label22" style="Z-INDEX: 122; LEFT: 8px; POSITION: absolute; TOP: 48px" runat="server"
				BackColor="PapayaWhip" Height="32px" Width="712px" BorderColor="Tan" BorderStyle="Solid" BorderWidth="1px"></asp:label><asp:label id="Label23" style="Z-INDEX: 123; LEFT: 16px; POSITION: absolute; TOP: 56px" runat="server"
				BackColor="PapayaWhip" Height="8px" Width="144px" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040"> Хариулт vvсгэх талбар </asp:label><asp:label id="Label7" style="Z-INDEX: 124; LEFT: 496px; POSITION: absolute; TOP: 16px" runat="server"
				BackColor="PapayaWhip" Height="8px" Width="72px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040"></asp:label><asp:label id="Label6" style="Z-INDEX: 125; LEFT: 408px; POSITION: absolute; TOP: 16px" runat="server"
				BackColor="PapayaWhip" Height="8px" Width="88px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040">  Хичээлийн код  :</asp:label><asp:label id="Label5" style="Z-INDEX: 126; LEFT: 296px; POSITION: absolute; TOP: 16px" runat="server"
				BackColor="PapayaWhip" Height="8px" Width="72px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040"></asp:label><asp:label id="Label4" style="Z-INDEX: 127; LEFT: 216px; POSITION: absolute; TOP: 16px" runat="server"
				BackColor="PapayaWhip" Height="8px" Width="72px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040">  Багшийн код  :</asp:label><asp:label id="Label3" style="Z-INDEX: 128; LEFT: 104px; POSITION: absolute; TOP: 16px" runat="server"
				BackColor="PapayaWhip" Height="8px" Width="104px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040"></asp:label>
			<asp:label id="Label2" style="Z-INDEX: 129; LEFT: 24px; POSITION: absolute; TOP: 16px" runat="server"
				Width="72px" Height="8px" BackColor="PapayaWhip" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040">  Багшийн нэр  :</asp:label>
			<asp:ImageButton id="ImageButton4" style="Z-INDEX: 139; LEFT: 568px; POSITION: absolute; TOP: 88px"
				runat="server" Width="79px" Height="23px" ImageUrl=".\mini\cbutton.gif"></asp:ImageButton>
			<asp:ImageButton id="ImageButton5" style="Z-INDEX: 140; LEFT: 728px; POSITION: absolute; TOP: 376px"
				runat="server" Width="12px" Height="12px" ImageUrl=".\mini\error.gif" Visible="False"></asp:ImageButton>
			<asp:LinkButton id="LinkButton1" style="Z-INDEX: 141; LEFT: 744px; POSITION: absolute; TOP: 376px"
				runat="server" Width="112px" Height="16px" ForeColor="#404040" Font-Size="7pt" Font-Names="Tahoma"
				Visible="False">Хариултын зургийг хасах</asp:LinkButton></form>
	</body>
</HTML>
