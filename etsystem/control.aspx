<%@ Page Language="vb" AutoEventWireup="false" Codebehind="control.aspx.vb" Inherits="e_testweb.control"%>
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
		<script language="JavaScript" type="text/JavaScript">

function fullScreen(theURL) {
window.open(theURL, '', 'fullscreen=yes, scrollbars=auto');
}
var newWin;
function popUp(page, name, details) {
newWin=window.open(page, name, details);
return false;
 }
		</script>
		<form id="Form1" method="post" runat="server">
			<asp:label id="Label6" style="Z-INDEX: 105; LEFT: 24px; POSITION: absolute; TOP: 16px" runat="server"
				ForeColor="#404040" Width="72px" Height="16px" Font-Size="8pt" Font-Names="Tahoma" BackColor="WhiteSmoke">Оюутны нэр :</asp:label><asp:label id="Label13" style="Z-INDEX: 119; LEFT: 744px; POSITION: absolute; TOP: 320px" runat="server"
				ForeColor="Chocolate" Width="192px" Height="16px" Font-Size="8pt" Font-Names="Tahoma" BackColor="WhiteSmoke" Visible="False" Font-Bold="True">Эхлээд шалгалтаа ачааллана уу</asp:label><asp:label id="Label12" style="Z-INDEX: 116; LEFT: 608px; POSITION: absolute; TOP: 320px" runat="server"
				ForeColor="#404040" Width="72px" Height="16px" Font-Size="8pt" Font-Names="Tahoma" BackColor="WhiteSmoke" Font-Bold="True">Удирдлага</asp:label><asp:label id="Label11" style="Z-INDEX: 100; LEFT: 592px; POSITION: absolute; TOP: 336px" runat="server"
				Width="357px" Height="104px" BorderWidth="1px" BorderStyle="Solid" BorderColor="Silver"></asp:label><asp:label id="Label10" style="Z-INDEX: 115; LEFT: 592px; POSITION: absolute; TOP: 312px" runat="server"
				Width="357px" Height="29px" BackColor="WhiteSmoke" BorderWidth="1px" BorderStyle="Solid" BorderColor="Silver"></asp:label><asp:label id="Label9" style="Z-INDEX: 114; LEFT: 800px; POSITION: absolute; TOP: 408px" runat="server"
				ForeColor="#404040" Width="104px" Height="16px" Font-Size="8pt" Font-Names="Tahoma">Шалгалт эхлvvлэх</asp:label><asp:label id="Label8" style="Z-INDEX: 113; LEFT: 656px; POSITION: absolute; TOP: 408px" runat="server"
				ForeColor="#404040" Width="104px" Height="16px" Font-Size="8pt" Font-Names="Tahoma">Шалгалт ачааллах</asp:label><asp:imagebutton id="ImageButton2" style="Z-INDEX: 112; LEFT: 824px; POSITION: absolute; TOP: 360px"
				runat="server" Width="48px" Height="48px" ImageUrl=".\mini\start.gif"></asp:imagebutton><asp:label id="Label7" style="Z-INDEX: 108; LEFT: 288px; POSITION: absolute; TOP: 16px" runat="server"
				ForeColor="#404040" Width="72px" Height="16px" Font-Size="8pt" Font-Names="Tahoma" BackColor="WhiteSmoke"></asp:label><asp:label id="Label5" style="Z-INDEX: 107; LEFT: 208px; POSITION: absolute; TOP: 16px" runat="server"
				ForeColor="#404040" Width="72px" Height="16px" Font-Size="8pt" Font-Names="Tahoma" BackColor="WhiteSmoke">Оюутны код :</asp:label><asp:label id="Label3" style="Z-INDEX: 106; LEFT: 104px; POSITION: absolute; TOP: 16px" runat="server"
				ForeColor="#404040" Width="88px" Height="16px" Font-Size="8pt" Font-Names="Tahoma" BackColor="WhiteSmoke"></asp:label><asp:label id="Label4" style="Z-INDEX: 104; LEFT: 8px; POSITION: absolute; TOP: 56px" runat="server"
				ForeColor="#404040" Width="573px" Height="16px" Font-Size="10pt" Font-Names="Tahoma" BackColor="WhiteSmoke" BorderWidth="1px" BorderStyle="Solid" BorderColor="Silver">.: Ашиглах заавар</asp:label><asp:label id="Label1" style="Z-INDEX: 101; LEFT: 8px; POSITION: absolute; TOP: 8px" runat="server"
				Width="940px" Height="40px" BackColor="WhiteSmoke" BorderWidth="1px" BorderStyle="Solid" BorderColor="Silver"></asp:label><asp:hyperlink id="linkb" style="Z-INDEX: 102; LEFT: 904px; POSITION: absolute; TOP: 16px" runat="server"
				ForeColor="#404040" Width="40px" Height="16px" Font-Size="10pt" Font-Names="Tahoma" BackColor="WhiteSmoke" NavigateUrl="javascript:window.close();">Гарах</asp:hyperlink><asp:label id="Label2" style="Z-INDEX: 103; LEFT: 8px; POSITION: absolute; TOP: 56px" runat="server"
				ForeColor="#404040" Width="573px" Height="384px" Font-Size="10pt" Font-Names="Tahoma" BorderWidth="1px" BorderStyle="Solid" BorderColor="Silver"></asp:label><asp:image id="Image1" style="Z-INDEX: 109; LEFT: 16px; POSITION: absolute; TOP: 104px" runat="server"
				Width="518px" Height="94px" ImageUrl=".\mini\introduction.gif"></asp:image><asp:panel id="Panel1" style="Z-INDEX: 110; LEFT: 16px; POSITION: absolute; TOP: 88px" runat="server"
				ForeColor="#406040" Width="544px" Height="344px" Font-Size="8pt" Font-Names="Tahoma">
				<P>Шалгалт егехийн емне доорхи зааварыг заавал уншаарай.</P>
				<P>&nbsp;</P>
				<P>&nbsp;</P>
				<P>&nbsp;</P>
				<P>1. Энэ хэсэгт оюутан таны егч байгаа шалгалтын хугацаа харагдах болно. Энэ цаг 
					дуусхад шалгалтын хуудас хаагдаж дvн бодогдох болно. Тиймээс цагаа 
					сайн&nbsp;тооцоолон шалгалтаа амжилттай&nbsp;егеерэй.</P>
				<P>2. Энэ хэсэгт шалгалтын хуудаснуудад шилших удирдлага байрлана.</P>
				<P>3. Энэ холбоос дээр дарж шалгалтыг хянагчаас таньд илгээсэн мэдээллийг харна.</P>
				<P>4. Энэ холбоос дээр дарж шалгалтыг хянагчруу мэдээлэл илгээх&nbsp;боломжтой.</P>
				<P>5. Энэ холбоос дээр дарж шалгалтын&nbsp; хугацаа дуусхаас емне&nbsp;шалгалтаа 
					дvгнvvлж болно.&nbsp;Дvгнvvлэхээс емне&nbsp;асуултуудаа&nbsp;бvрэн гvйцэд 
					хариулсан эсэхээ сайтар хянахыг таньд сануулж байна. Учир нь энэ холбоос дээр 
					дарсан тохиолдолд дахин шалгалтын хуудасруу орох боломжгvй.</P>
				<P>6. Шалгалтаа эхлvvлэхийн емне ачааллах&nbsp;шаардлагатай.&nbsp;&nbsp;</P>
			</asp:panel><asp:imagebutton id="ImageButton1" style="Z-INDEX: 111; LEFT: 680px; POSITION: absolute; TOP: 360px"
				runat="server" Width="48px" Height="48px" ImageUrl=".\mini\load.gif"></asp:imagebutton>
		</form>
	</body>
</HTML>
