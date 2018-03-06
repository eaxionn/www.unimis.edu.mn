<%@ Page Language="vb" AutoEventWireup="false" Codebehind="addQuestion.aspx.vb" Inherits="e_testweb.addQuestion" %>
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
				BorderWidth="1px" BorderStyle="Solid" BorderColor="Tan" Width="940px" Height="32px" BackColor="PapayaWhip"></asp:label><asp:label id="Label45" style="Z-INDEX: 162; LEFT: 144px; POSITION: absolute; TOP: 632px" runat="server"
				Width="504px" Height="8px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040"></asp:label><asp:label id="Label44" style="Z-INDEX: 161; LEFT: 176px; POSITION: absolute; TOP: 616px" runat="server"
				Width="472px" Height="8px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040"></asp:label><asp:label id="Label43" style="Z-INDEX: 160; LEFT: 240px; POSITION: absolute; TOP: 600px" runat="server"
				Width="408px" Height="8px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040"></asp:label><asp:label id="Label42" style="Z-INDEX: 159; LEFT: 144px; POSITION: absolute; TOP: 584px" runat="server"
				Width="504px" Height="8px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040"></asp:label><asp:label id="Label40" style="Z-INDEX: 156; LEFT: 152px; POSITION: absolute; TOP: 568px" runat="server"
				Width="96px" Height="8px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040"></asp:label><asp:label id="Label37" style="Z-INDEX: 153; LEFT: 48px; POSITION: absolute; TOP: 632px" runat="server"
				Width="88px" Height="8px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="Gray" Font-Italic="True">Асуултын бvлэг :</asp:label><asp:label id="Label36" style="Z-INDEX: 152; LEFT: 48px; POSITION: absolute; TOP: 616px" runat="server"
				Width="120px" Height="8px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="Gray" Font-Italic="True">Асуултын терел, зvйл :</asp:label><asp:label id="Label35" style="Z-INDEX: 151; LEFT: 48px; POSITION: absolute; TOP: 600px" runat="server"
				Width="184px" Height="8px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="Gray" Font-Italic="True">Асуултын хvнд, хенгений тvвшин :</asp:label><asp:label id="Label34" style="Z-INDEX: 150; LEFT: 48px; POSITION: absolute; TOP: 584px" runat="server"
				Width="96px" Height="8px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="Gray" Font-Italic="True">Асуултын сэдэв :</asp:label><asp:label id="Label32" style="Z-INDEX: 148; LEFT: 48px; POSITION: absolute; TOP: 568px" runat="server"
				Width="96px" Height="8px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="Gray" Font-Italic="True">Асуултын дугаар :</asp:label><asp:label id="Label31" style="Z-INDEX: 147; LEFT: 16px; POSITION: absolute; TOP: 536px" runat="server"
				Width="168px" Height="8px" BackColor="PapayaWhip" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040" Font-Bold="True">Асуултын тухай мэдээлэл</asp:label><asp:label id="Label30" style="Z-INDEX: 146; LEFT: 8px; POSITION: absolute; TOP: 528px" runat="server"
				BorderWidth="1px" BorderStyle="Solid" BorderColor="Tan" Width="712px" Height="32px" BackColor="PapayaWhip"></asp:label><asp:label id="Label24" style="Z-INDEX: 145; LEFT: 8px; POSITION: absolute; TOP: 528px" runat="server"
				BorderWidth="1px" BorderStyle="Solid" BorderColor="Tan" Width="712px" Height="136px"></asp:label><asp:linkbutton id="LinkButton2" style="Z-INDEX: 144; LEFT: 744px; POSITION: absolute; TOP: 440px"
				runat="server" Width="112px" Height="16px" Font-Names="Tahoma" Font-Size="7pt" ForeColor="#404040" Visible="False">Асуултын медиаг хасах</asp:linkbutton><asp:imagebutton id="ImageButton6" style="Z-INDEX: 143; LEFT: 728px; POSITION: absolute; TOP: 440px"
				runat="server" Width="12px" Height="12px" Visible="False" ImageUrl=".\mini\error.gif"></asp:imagebutton><asp:linkbutton id="LinkButton1" style="Z-INDEX: 142; LEFT: 744px; POSITION: absolute; TOP: 384px"
				runat="server" Width="112px" Height="16px" Font-Names="Tahoma" Font-Size="7pt" ForeColor="#404040" Visible="False">Асуултын зургийг хасах</asp:linkbutton><asp:imagebutton id="ImageButton5" style="Z-INDEX: 139; LEFT: 728px; POSITION: absolute; TOP: 384px"
				runat="server" Width="12px" Height="12px" Visible="False" ImageUrl=".\mini\error.gif"></asp:imagebutton><asp:imagebutton id="ImageButton4" style="Z-INDEX: 141; LEFT: 568px; POSITION: absolute; TOP: 128px"
				runat="server" Width="79px" Height="23px" ImageUrl=".\mini\cbutton.gif"></asp:imagebutton><asp:label id="Label29" style="Z-INDEX: 140; LEFT: 840px; POSITION: absolute; TOP: 16px" runat="server"
				Width="106px" Height="8px" BackColor="PapayaWhip" Font-Names="Tahoma" Font-Size="10pt" ForeColor="#405566" Font-Bold="True">Асуулт нэмэх</asp:label><asp:label id="Label28" style="Z-INDEX: 138; LEFT: 728px; POSITION: absolute; TOP: 520px" runat="server"
				Width="216px" Height="48px" Font-Names="Tahoma" Font-Size="7pt" ForeColor="#404040"></asp:label><asp:label id="Label27" style="Z-INDEX: 137; LEFT: 728px; POSITION: absolute; TOP: 472px" runat="server"
				Width="216px" Height="48px" Font-Names="Tahoma" Font-Size="7pt" ForeColor="#404040"></asp:label><asp:label id="Label26" style="Z-INDEX: 136; LEFT: 808px; POSITION: absolute; TOP: 416px" runat="server"
				Width="128px" Height="8px" Font-Names="Tahoma" Font-Size="7pt" ForeColor="#404040" Visible="False"></asp:label><asp:label id="Label25" style="Z-INDEX: 134; LEFT: 728px; POSITION: absolute; TOP: 416px" runat="server"
				Width="80px" Height="8px" Font-Names="Tahoma" Font-Size="7pt" ForeColor="#404040" Visible="False">Асуултын медиа</asp:label><asp:label id="Label23" style="Z-INDEX: 135; LEFT: 16px; POSITION: absolute; TOP: 56px" runat="server"
				Width="144px" Height="8px" BackColor="PapayaWhip" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040" Font-Bold="True">Асуулт vvсгэх талбар</asp:label><asp:label id="Label22" style="Z-INDEX: 133; LEFT: 8px; POSITION: absolute; TOP: 48px" runat="server"
				BorderWidth="1px" BorderStyle="Solid" BorderColor="Tan" Width="712px" Height="32px" BackColor="PapayaWhip"></asp:label><INPUT id="UploadMedia" style="Z-INDEX: 132; LEFT: 48px; WIDTH: 448px; POSITION: absolute; TOP: 464px; HEIGHT: 24px"
				tabIndex="7" type="file" size="55" name="UploadMedia" runat="server"><INPUT language="vb" id="UploadPic" dir="ltr" style="Z-INDEX: 131; LEFT: 48px; WIDTH: 448px; POSITION: absolute; TOP: 424px; HEIGHT: 25px; TEXT-DECORATION: none"
				tabIndex="6" type="file" size="55" name="UploadPic" runat="server"><asp:label id="Label21" style="Z-INDEX: 130; LEFT: 728px; POSITION: absolute; TOP: 144px" runat="server"
				Width="224px" Height="8px" Font-Names="Tahoma" Font-Size="7pt" ForeColor="#404040" Visible="False">Асуултын зураг ( жижигрvvлж харуулж байна )</asp:label><asp:label id="Label20" style="Z-INDEX: 128; LEFT: 48px; POSITION: absolute; TOP: 448px" runat="server"
				Width="96px" Height="8px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040">Асуултын медиа :</asp:label>
			<asp:label id="Label19" style="Z-INDEX: 127; LEFT: 48px; POSITION: absolute; TOP: 408px" runat="server"
				Width="88px" Height="8px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040">Асуултын зураг :</asp:label><asp:label id="Label18" style="Z-INDEX: 126; LEFT: 896px; POSITION: absolute; TOP: 96px" runat="server"
				Width="24px" Height="8px" BackColor="PapayaWhip" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040">Буцах</asp:label><asp:imagebutton id="Imagebutton3" style="Z-INDEX: 125; LEFT: 896px; POSITION: absolute; TOP: 64px"
				runat="server" Width="32px" Height="32px" ImageUrl=".\mini\cancel.gif"></asp:imagebutton><asp:dropdownlist id="buleg" style="Z-INDEX: 124; LEFT: 48px; POSITION: absolute; TOP: 384px" tabIndex="1"
				runat="server" Width="600px" Height="56px" Font-Names="Tahoma" Font-Size="9pt" ForeColor="#404040" AutoPostBack="True"></asp:dropdownlist><asp:label id="Label17" style="Z-INDEX: 123; LEFT: 48px; POSITION: absolute; TOP: 368px" runat="server"
				Width="88px" Height="8px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040">Асуултын бvлэг :</asp:label><asp:dropdownlist id="turul" style="Z-INDEX: 122; LEFT: 48px; POSITION: absolute; TOP: 344px" tabIndex="1"
				runat="server" Width="600px" Height="56px" Font-Names="Tahoma" Font-Size="9pt" ForeColor="#404040" AutoPostBack="True"></asp:dropdownlist><asp:label id="Label16" style="Z-INDEX: 121; LEFT: 48px; POSITION: absolute; TOP: 328px" runat="server"
				Width="120px" Height="8px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040">Асуултын терел, зvйл :</asp:label><asp:dropdownlist id="tubshin" style="Z-INDEX: 120; LEFT: 48px; POSITION: absolute; TOP: 304px" tabIndex="1"
				runat="server" Width="600px" Height="56px" Font-Names="Tahoma" Font-Size="9pt" ForeColor="#404040" AutoPostBack="True"></asp:dropdownlist><asp:label id="Label15" style="Z-INDEX: 119; LEFT: 48px; POSITION: absolute; TOP: 288px" runat="server"
				Width="184px" Height="8px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040">Асуултын хvнд, хенгений тvвшин :</asp:label><asp:label id="Label14" style="Z-INDEX: 117; LEFT: 48px; POSITION: absolute; TOP: 248px" runat="server"
				Width="96px" Height="8px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040">Асуултын сэдэв :</asp:label><asp:label id="Label13" style="Z-INDEX: 115; LEFT: 48px; POSITION: absolute; TOP: 136px" runat="server"
				Width="96px" Height="8px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040">Асуулт :</asp:label><asp:label id="Label12" style="Z-INDEX: 114; LEFT: 48px; POSITION: absolute; TOP: 96px" runat="server"
				Width="96px" Height="8px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040">Асуултын дугаар :</asp:label><asp:label id="Label11" style="Z-INDEX: 112; LEFT: 8px; POSITION: absolute; TOP: 48px" runat="server"
				BorderWidth="1px" BorderStyle="Solid" BorderColor="Tan" Width="712px" Height="472px"></asp:label><asp:label id="Label10" style="Z-INDEX: 111; LEFT: 824px; POSITION: absolute; TOP: 96px" runat="server"
				Width="24px" Height="8px" BackColor="PapayaWhip" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040">Хариулт</asp:label><asp:label id="Label8" style="Z-INDEX: 110; LEFT: 744px; POSITION: absolute; TOP: 96px" runat="server"
				Width="48px" Height="8px" BackColor="PapayaWhip" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040">Хадгалах</asp:label><asp:imagebutton id="Imagebutton2" style="Z-INDEX: 109; LEFT: 824px; POSITION: absolute; TOP: 64px"
				runat="server" Width="32px" Height="32px" ImageUrl=".\mini\answers.gif"></asp:imagebutton><asp:imagebutton id="ImageButton1" style="Z-INDEX: 108; LEFT: 752px; POSITION: absolute; TOP: 64px"
				runat="server" Width="32px" Height="32px" ImageUrl=".\mini\save.gif"></asp:imagebutton><asp:label id="Label9" style="Z-INDEX: 100; LEFT: 728px; POSITION: absolute; TOP: 48px" runat="server"
				BorderWidth="1px" BorderStyle="Solid" BorderColor="Tan" Width="220px" Height="72px" BackColor="PapayaWhip"></asp:label><asp:label id="Label7" style="Z-INDEX: 107; LEFT: 496px; POSITION: absolute; TOP: 16px" runat="server"
				Width="72px" Height="8px" BackColor="PapayaWhip" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040"></asp:label><asp:label id="Label6" style="Z-INDEX: 106; LEFT: 408px; POSITION: absolute; TOP: 16px" runat="server"
				Width="88px" Height="8px" BackColor="PapayaWhip" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040">Хичээлийн код :</asp:label><asp:label id="Label5" style="Z-INDEX: 105; LEFT: 296px; POSITION: absolute; TOP: 16px" runat="server"
				Width="72px" Height="8px" BackColor="PapayaWhip" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040"></asp:label><asp:label id="Label4" style="Z-INDEX: 104; LEFT: 216px; POSITION: absolute; TOP: 16px" runat="server"
				Width="72px" Height="8px" BackColor="PapayaWhip" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040">Багшийн код :</asp:label><asp:label id="Label3" style="Z-INDEX: 103; LEFT: 104px; POSITION: absolute; TOP: 16px" runat="server"
				Width="104px" Height="8px" BackColor="PapayaWhip" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040"></asp:label><asp:label id="Label2" style="Z-INDEX: 102; LEFT: 24px; POSITION: absolute; TOP: 16px" runat="server"
				Width="72px" Height="8px" BackColor="PapayaWhip" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040">Багшийн нэр :</asp:label><asp:textbox id="txtDugaar" style="Z-INDEX: 113; LEFT: 48px; POSITION: absolute; TOP: 112px"
				runat="server" Width="104px" Height="24px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040" AutoPostBack="True" Enabled="False"></asp:textbox><asp:textbox id="txtAsuult" style="Z-INDEX: 116; LEFT: 48px; POSITION: absolute; TOP: 152px"
				runat="server" Width="600px" Height="88px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040" AutoPostBack="True" TextMode="MultiLine"></asp:textbox><asp:dropdownlist id="sedeb" style="Z-INDEX: 118; LEFT: 48px; POSITION: absolute; TOP: 264px" tabIndex="1"
				runat="server" Width="600px" Height="152px" Font-Names="Tahoma" Font-Size="9pt" ForeColor="#404040" AutoPostBack="True"></asp:dropdownlist><asp:image id="Image1" style="Z-INDEX: 129; LEFT: 728px; POSITION: absolute; TOP: 160px" runat="server"
				Width="220px" Height="220px" Visible="False"></asp:image></form>
	</body>
</HTML>
