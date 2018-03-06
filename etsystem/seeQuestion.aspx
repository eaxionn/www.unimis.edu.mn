<%@ Page Language="vb" AutoEventWireup="false" Codebehind="seeQuestion.aspx.vb" Inherits="e_testweb.seeQuestion" %>
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
			<asp:label id="Label1" style="Z-INDEX: 105; LEFT: 8px; POSITION: absolute; TOP: 8px" runat="server"
				BackColor="PapayaWhip" Height="32px" Width="940px" BorderColor="Tan" BorderStyle="Solid"
				BorderWidth="1px"></asp:label><asp:label id="Label28" style="Z-INDEX: 151; LEFT: 840px; POSITION: absolute; TOP: 472px" runat="server"
				Height="8px" Width="72px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040">Асуулт хайлт</asp:label><asp:imagebutton id="Imagebutton5" style="Z-INDEX: 150; LEFT: 848px; POSITION: absolute; TOP: 424px"
				runat="server" Height="48px" Width="48px" ImageUrl=".\mini\search_ques.gif"></asp:imagebutton><asp:radiobutton id="rb4" style="Z-INDEX: 148; LEFT: 808px; POSITION: absolute; TOP: 680px" runat="server"
				BackColor="WhiteSmoke" Height="16px" Width="88px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040" GroupName="groups" Text="Терлеер :" AutoPostBack="True"></asp:radiobutton><asp:radiobutton id="rb3" style="Z-INDEX: 147; LEFT: 808px; POSITION: absolute; TOP: 632px" runat="server"
				BackColor="WhiteSmoke" Height="16px" Width="88px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040" GroupName="groups" Text="Тvвшинеер :" AutoPostBack="True"></asp:radiobutton><asp:radiobutton id="rb2" style="Z-INDEX: 145; LEFT: 808px; POSITION: absolute; TOP: 584px" runat="server"
				BackColor="WhiteSmoke" Height="16px" Width="88px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040" GroupName="groups" Text="Бvлгээр :" AutoPostBack="True"></asp:radiobutton><asp:label id="Label34" style="Z-INDEX: 101; LEFT: 800px; POSITION: absolute; TOP: 736px" runat="server"
				BackColor="PapayaWhip" Height="56px" Width="148px" BorderColor="Tan" BorderStyle="Solid" BorderWidth="1px"></asp:label><asp:label id="Label33" style="Z-INDEX: 143; LEFT: 880px; POSITION: absolute; TOP: 776px" runat="server"
				BackColor="PapayaWhip" Height="8px" Width="24px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040">Цэвэрлэх</asp:label><asp:label id="Label32" style="Z-INDEX: 142; LEFT: 832px; POSITION: absolute; TOP: 776px" runat="server"
				BackColor="PapayaWhip" Height="8px" Width="24px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040">Хай</asp:label><asp:imagebutton id="Imagebutton9" style="Z-INDEX: 141; LEFT: 888px; POSITION: absolute; TOP: 744px"
				runat="server" Height="32px" Width="32px" ImageUrl=".\mini\clear.gif"></asp:imagebutton><asp:imagebutton id="Imagebutton8" style="Z-INDEX: 140; LEFT: 824px; POSITION: absolute; TOP: 744px"
				runat="server" Height="32px" Width="32px" ImageUrl=".\mini\search_go.gif"></asp:imagebutton><asp:dropdownlist id="turluur" style="Z-INDEX: 139; LEFT: 816px; POSITION: absolute; TOP: 704px" runat="server"
				Height="24px" Width="118px" AutoPostBack="True"></asp:dropdownlist><asp:dropdownlist id="tubshinuur" style="Z-INDEX: 138; LEFT: 816px; POSITION: absolute; TOP: 656px"
				runat="server" Height="24px" Width="118px" AutoPostBack="True"></asp:dropdownlist><asp:label id="Label27" style="Z-INDEX: 136; LEFT: 808px; POSITION: absolute; TOP: 512px" runat="server"
				BackColor="PapayaWhip" Height="8px" Width="112px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040" Font-Bold="True">Асуултын хайлт</asp:label><asp:label id="Label26" style="Z-INDEX: 135; LEFT: 800px; POSITION: absolute; TOP: 504px" runat="server"
				BackColor="PapayaWhip" Height="32px" Width="148px" BorderColor="Tan" BorderStyle="Solid" BorderWidth="1px"></asp:label><asp:label id="Label25" style="Z-INDEX: 100; LEFT: 800px; POSITION: absolute; TOP: 504px" runat="server"
				BackColor="WhiteSmoke" Height="288px" Width="148px" BorderColor="Tan" BorderStyle="Solid" BorderWidth="1px"></asp:label><asp:label id="Label24" style="Z-INDEX: 134; LEFT: 696px; POSITION: absolute; TOP: 88px" runat="server"
				BackColor="PapayaWhip" Height="32px" Width="248px" Font-Names="Tahoma" Font-Size="20pt" ForeColor="#405566">Асуултын жагсаалт</asp:label><asp:label id="Label23" style="Z-INDEX: 133; LEFT: 840px; POSITION: absolute; TOP: 312px" runat="server"
				Height="8px" Width="64px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040">Бvлэг vvсгэх</asp:label><asp:imagebutton id="Imagebutton7" style="Z-INDEX: 132; LEFT: 848px; POSITION: absolute; TOP: 264px"
				runat="server" Height="48px" Width="48px" ImageUrl=".\mini\creat_group.gif"></asp:imagebutton><asp:label id="Label21" style="Z-INDEX: 131; LEFT: 712px; POSITION: absolute; TOP: 152px" runat="server"
				BackColor="PapayaWhip" Height="8px" Width="32px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040" Font-Bold="True">Засах</asp:label><asp:label id="Label20" style="Z-INDEX: 130; LEFT: 640px; POSITION: absolute; TOP: 152px" runat="server"
				BackColor="PapayaWhip" Height="8px" Width="32px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040" Font-Bold="True">Оноо</asp:label><asp:label id="Label22" style="Z-INDEX: 129; LEFT: 96px; POSITION: absolute; TOP: 152px" runat="server"
				BackColor="PapayaWhip" Height="8px" Width="72px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040" Font-Bold="True">Асуултууд</asp:label><asp:label id="Label19" style="Z-INDEX: 128; LEFT: 40px; POSITION: absolute; TOP: 152px" runat="server"
				BackColor="PapayaWhip" Height="8px" Width="32px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040" Font-Bold="True">Гарчиг</asp:label><asp:label id="Label18" style="Z-INDEX: 126; LEFT: 8px; POSITION: absolute; TOP: 144px" runat="server"
				BackColor="PapayaWhip" Height="32px" Width="784px" BorderColor="Tan" BorderStyle="Solid" BorderWidth="1px"></asp:label><asp:panel id="Panel1" style="Z-INDEX: 102; LEFT: 8px; POSITION: absolute; TOP: 144px" runat="server"
				Height="352px" Width="784px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040">
				<P>&nbsp;</P>
			</asp:panel><asp:label id="Label17" style="Z-INDEX: 124; LEFT: 832px; POSITION: absolute; TOP: 392px" runat="server"
				Height="8px" Width="88px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040">Асуултыг устгах</asp:label><asp:imagebutton id="Imagebutton6" style="Z-INDEX: 123; LEFT: 848px; POSITION: absolute; TOP: 344px"
				runat="server" Height="48px" Width="48px" ImageUrl=".\mini\delete_ques.gif"></asp:imagebutton><asp:label id="Label15" style="Z-INDEX: 122; LEFT: 840px; POSITION: absolute; TOP: 232px" runat="server"
				Height="8px" Width="72px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040">Асуулт нэмэх</asp:label><asp:imagebutton id="Imagebutton4" style="Z-INDEX: 121; LEFT: 848px; POSITION: absolute; TOP: 184px"
				runat="server" Height="48px" Width="48px" ImageUrl=".\mini\addQues.gif"></asp:imagebutton><asp:label id="Label14" style="Z-INDEX: 103; LEFT: 800px; POSITION: absolute; TOP: 168px" runat="server"
				Height="328px" Width="148px" BorderColor="Tan" BorderStyle="Solid" BorderWidth="1px"></asp:label><asp:label id="Label13" style="Z-INDEX: 120; LEFT: 808px; POSITION: absolute; TOP: 152px" runat="server"
				BackColor="PapayaWhip" Height="8px" Width="80px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040" Font-Bold="True">Удирдлага</asp:label><asp:label id="Label12" style="Z-INDEX: 119; LEFT: 800px; POSITION: absolute; TOP: 144px" runat="server"
				BackColor="PapayaWhip" Height="32px" Width="148px" BorderColor="Tan" BorderStyle="Solid" BorderWidth="1px"></asp:label><asp:label id="Label11" style="Z-INDEX: 118; LEFT: 248px; POSITION: absolute; TOP: 104px" runat="server"
				BackColor="PapayaWhip" Height="8px" Width="56px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040">Хогийн сав</asp:label><asp:imagebutton id="ImageButton3" style="Z-INDEX: 117; LEFT: 256px; POSITION: absolute; TOP: 48px"
				runat="server" Height="48px" Width="48px" ImageUrl=".\mini\trash.gif"></asp:imagebutton><asp:label id="Label10" style="Z-INDEX: 116; LEFT: 136px; POSITION: absolute; TOP: 104px" runat="server"
				BackColor="PapayaWhip" Height="8px" Width="88px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040">Захианы хайрцаг</asp:label><asp:imagebutton id="ImageButton2" style="Z-INDEX: 115; LEFT: 152px; POSITION: absolute; TOP: 48px"
				runat="server" Height="48px" Width="48px" ImageUrl=".\mini\to_admin_msg.gif"></asp:imagebutton><asp:label id="Label8" style="Z-INDEX: 114; LEFT: 40px; POSITION: absolute; TOP: 104px" runat="server"
				BackColor="PapayaWhip" Height="8px" Width="64px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040">Захиа бичих</asp:label><asp:imagebutton id="ImageButton1" style="Z-INDEX: 113; LEFT: 48px; POSITION: absolute; TOP: 48px"
				runat="server" Height="48px" Width="48px" ImageUrl=".\mini\composer.gif"></asp:imagebutton><asp:linkbutton id="LinkButton1" style="Z-INDEX: 112; LEFT: 904px; POSITION: absolute; TOP: 16px"
				runat="server" BackColor="PapayaWhip" Height="16px" Width="32px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040">Буцах</asp:linkbutton><asp:label id="Label9" style="Z-INDEX: 104; LEFT: 8px; POSITION: absolute; TOP: 8px" runat="server"
				BackColor="PapayaWhip" Height="120px" Width="940px" BorderColor="Tan" BorderStyle="Solid" BorderWidth="1px"></asp:label><asp:label id="Label7" style="Z-INDEX: 111; LEFT: 496px; POSITION: absolute; TOP: 16px" runat="server"
				BackColor="PapayaWhip" Height="8px" Width="72px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040"></asp:label><asp:label id="Label6" style="Z-INDEX: 110; LEFT: 408px; POSITION: absolute; TOP: 16px" runat="server"
				BackColor="PapayaWhip" Height="8px" Width="88px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040">Хичээлийн код :</asp:label><asp:label id="Label5" style="Z-INDEX: 109; LEFT: 296px; POSITION: absolute; TOP: 16px" runat="server"
				BackColor="PapayaWhip" Height="8px" Width="72px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040"></asp:label><asp:label id="Label4" style="Z-INDEX: 108; LEFT: 216px; POSITION: absolute; TOP: 16px" runat="server"
				BackColor="PapayaWhip" Height="8px" Width="72px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040">Багшийн код :</asp:label><asp:label id="Label3" style="Z-INDEX: 107; LEFT: 104px; POSITION: absolute; TOP: 16px" runat="server"
				BackColor="PapayaWhip" Height="8px" Width="104px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040"></asp:label><asp:label id="Label2" style="Z-INDEX: 106; LEFT: 24px; POSITION: absolute; TOP: 16px" runat="server"
				BackColor="PapayaWhip" Height="8px" Width="72px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040">Багшийн нэр :</asp:label><asp:checkbox id="CheckBox1" style="Z-INDEX: 127; LEFT: 16px; POSITION: absolute; TOP: 152px"
				runat="server" BackColor="PapayaWhip" Height="16px" Width="104px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040" AutoPostBack="True" Font-Bold="True"></asp:checkbox><asp:textbox id="TextBox1" style="Z-INDEX: 146; LEFT: 816px; POSITION: absolute; TOP: 560px"
				runat="server" Height="24px" Width="118px" AutoPostBack="True"></asp:textbox><asp:dropdownlist id="bulgeer" style="Z-INDEX: 137; LEFT: 816px; POSITION: absolute; TOP: 608px" runat="server"
				Height="24px" Width="118px" AutoPostBack="True"></asp:dropdownlist><asp:radiobutton id="rb1" style="Z-INDEX: 144; LEFT: 808px; POSITION: absolute; TOP: 536px" runat="server"
				BackColor="WhiteSmoke" Height="16px" Width="88px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040" GroupName="groups" Text="Сэдвээр :" AutoPostBack="True" Checked="True"></asp:radiobutton></form>
	</body>
</HTML>
