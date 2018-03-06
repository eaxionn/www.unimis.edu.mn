<%@ Page Language="vb" autoeventwireup="false" codebehind="composer.aspx.vb" Inherits="e_testweb.composer" %>
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
			<asp:label id="Label1" style="Z-INDEX: 102; LEFT: 8px; POSITION: absolute; TOP: 8px" runat="server"
				BackColor="PapayaWhip" Height="32px" Width="940px" BorderColor="Tan" BorderStyle="Solid"
				BorderWidth="1px"></asp:label>
			<asp:label id="Label24" style="Z-INDEX: 134; LEFT: 784px; POSITION: absolute; TOP: 88px" runat="server"
				Width="161px" Height="32px" BackColor="PapayaWhip" Font-Names="Tahoma" Font-Size="20pt"
				ForeColor="#405566"> Захиа бичих </asp:label><asp:imagebutton id="Imagebutton6" style="Z-INDEX: 128; LEFT: 856px; POSITION: absolute; TOP: 16px"
				runat="server" Height="12px" Width="12px" ImageUrl=".\mini\home.gif"></asp:imagebutton><asp:label id="Label16" style="Z-INDEX: 127; LEFT: 656px; POSITION: absolute; TOP: 384px" runat="server"
				Height="32px" Width="264px" ForeColor="#404040" Font-Size="8pt" Font-Names="Tahoma" Visible="False"></asp:label><asp:imagebutton id="Imagebutton5" style="Z-INDEX: 125; LEFT: 640px; POSITION: absolute; TOP: 384px"
				runat="server" Height="12px" Width="12px" ImageUrl=".\mini\ok.gif" Visible="False"></asp:imagebutton><asp:label id="Label15" style="Z-INDEX: 124; LEFT: 648px; POSITION: absolute; TOP: 496px" runat="server"
				Height="32px" Width="288px" ForeColor="#404040" Font-Size="8pt" Font-Names="Tahoma">           Энд бичигдсэн захианууд нь зевхен багшийн кодоор илгээгдэх учир сургуулийн дотоод сvлжээнд дотор ашиглагдахыг           сануулж    байна.</asp:label><asp:label id="Label14" style="Z-INDEX: 123; LEFT: 840px; POSITION: absolute; TOP: 280px" runat="server"
				Height="8px" Width="82px" ForeColor="#404040" Font-Size="8pt" Font-Names="Tahoma"> Цонхноос гарах </asp:label><asp:label id="Label13" style="Z-INDEX: 122; LEFT: 848px; POSITION: absolute; TOP: 216px" runat="server"
				Height="8px" Width="72px" ForeColor="#404040" Font-Size="8pt" Font-Names="Tahoma"> Захиаг илгээ </asp:label><asp:imagebutton id="Imagebutton4" style="Z-INDEX: 121; LEFT: 864px; POSITION: absolute; TOP: 248px"
				runat="server" Height="32px" Width="32px" ImageUrl=".\mini\cancel.gif"></asp:imagebutton><asp:imagebutton id="Imagebutton1" style="Z-INDEX: 120; LEFT: 864px; POSITION: absolute; TOP: 184px"
				runat="server" Height="32px" Width="32px" ImageUrl=".\mini\sent_msg.gif"></asp:imagebutton><asp:label id="Label22" style="Z-INDEX: 118; LEFT: 8px; POSITION: absolute; TOP: 136px" runat="server"
				BackColor="PapayaWhip" Height="32px" Width="940px" BorderColor="Tan" BorderStyle="Solid" BorderWidth="1px"></asp:label><asp:label id="Label23" style="Z-INDEX: 119; LEFT: 16px; POSITION: absolute; TOP: 144px" runat="server"
				BackColor="PapayaWhip" Height="8px" Width="144px" ForeColor="#404040" Font-Size="8pt" Font-Names="Tahoma" Font-Bold="True">  Захиа бичих талбар  </asp:label><asp:label id="Label12" style="Z-INDEX: 100; LEFT: 8px; POSITION: absolute; TOP: 136px" runat="server"
				Height="416px" Width="940px" BorderColor="Tan" BorderStyle="Solid" BorderWidth="1px"></asp:label><asp:label id="Label11" style="Z-INDEX: 116; LEFT: 24px; POSITION: absolute; TOP: 280px" runat="server"
				Height="8px" Width="88px" ForeColor="#404040" Font-Size="8pt" Font-Names="Tahoma"> Захиа :</asp:label><asp:textbox id="txt_subject" style="Z-INDEX: 115; LEFT: 24px; POSITION: absolute; TOP: 248px"
				runat="server" Height="24px" Width="408px" ForeColor="#404040" Font-Size="8pt" Font-Names="Tahoma"></asp:textbox><asp:label id="Label10" style="Z-INDEX: 114; LEFT: 24px; POSITION: absolute; TOP: 232px" runat="server"
				Height="8px" Width="88px" ForeColor="#404040" Font-Size="8pt" Font-Names="Tahoma">  Захианы гарчиг  :</asp:label><asp:label id="Label6" style="Z-INDEX: 112; LEFT: 24px; POSITION: absolute; TOP: 184px" runat="server"
				Height="8px" Width="152px" ForeColor="#404040" Font-Size="8pt" Font-Names="Tahoma"> Хэнээс ( багшийн код   ) :</asp:label><asp:label id="Label9" style="Z-INDEX: 101; LEFT: 8px; POSITION: absolute; TOP: 8px" runat="server"
				BackColor="PapayaWhip" Height="120px" Width="940px" BorderColor="Tan" BorderStyle="Solid" BorderWidth="1px"></asp:label><asp:label id="Label8" style="Z-INDEX: 111; LEFT: 144px; POSITION: absolute; TOP: 104px" runat="server"
				BackColor="PapayaWhip" Height="8px" Width="56px" ForeColor="#404040" Font-Size="8pt" Font-Names="Tahoma"> Хогийн сав </asp:label><asp:label id="Label7" style="Z-INDEX: 110; LEFT: 32px; POSITION: absolute; TOP: 104px" runat="server"
				BackColor="PapayaWhip" Height="8px" Width="88px" ForeColor="#404040" Font-Size="8pt" Font-Names="Tahoma"> Захианы хайрцаг </asp:label><asp:imagebutton id="ImageButton3" style="Z-INDEX: 109; LEFT: 152px; POSITION: absolute; TOP: 48px"
				runat="server" Height="48px" Width="48px" ImageUrl=".\mini\trash.gif"></asp:imagebutton><asp:imagebutton id="ImageButton2" style="Z-INDEX: 108; LEFT: 48px; POSITION: absolute; TOP: 48px"
				runat="server" Height="48px" Width="48px" ImageUrl=".\mini\to_admin_msg.gif"></asp:imagebutton><asp:label id="Label5" style="Z-INDEX: 106; LEFT: 296px; POSITION: absolute; TOP: 16px" runat="server"
				BackColor="PapayaWhip" Height="8px" Width="72px" ForeColor="#404040" Font-Size="8pt" Font-Names="Tahoma"></asp:label><asp:label id="Label4" style="Z-INDEX: 105; LEFT: 216px; POSITION: absolute; TOP: 16px" runat="server"
				BackColor="PapayaWhip" Height="8px" Width="72px" ForeColor="#404040" Font-Size="8pt" Font-Names="Tahoma">  Багшийн код  :</asp:label><asp:label id="Label3" style="Z-INDEX: 104; LEFT: 104px; POSITION: absolute; TOP: 16px" runat="server"
				BackColor="PapayaWhip" Height="8px" Width="104px" ForeColor="#404040" Font-Size="8pt" Font-Names="Tahoma"></asp:label><asp:label id="Label2" style="Z-INDEX: 103; LEFT: 24px; POSITION: absolute; TOP: 16px" runat="server"
				BackColor="PapayaWhip" Height="8px" Width="72px" ForeColor="#404040" Font-Size="8pt" Font-Names="Tahoma">  Багшийн нэр  :</asp:label><asp:linkbutton id="LinkButton1" style="Z-INDEX: 107; LEFT: 872px; POSITION: absolute; TOP: 16px"
				runat="server" BackColor="PapayaWhip" Height="16px" Width="64px" ForeColor="#404040" Font-Size="8pt" Font-Names="Tahoma">Нvvр хуудас </asp:linkbutton><asp:textbox id="txt_to" style="Z-INDEX: 113; LEFT: 24px; POSITION: absolute; TOP: 200px" runat="server"
				Height="24px" Width="408px" ForeColor="#404040" Font-Size="8pt" Font-Names="Tahoma"></asp:textbox><asp:textbox id="txt_msg" style="Z-INDEX: 117; LEFT: 24px; POSITION: absolute; TOP: 296px" runat="server"
				Height="240px" Width="600px" TextMode="MultiLine" ForeColor="#404040" Font-Size="8pt" Font-Names="Tahoma"></asp:textbox></form>
	</body>
</HTML>
