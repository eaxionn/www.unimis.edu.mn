<%@ Register TagPrefix="uc1" TagName="admin_header" Src="admin_header.ascx" %>
<%@ Page Language="vb" AutoEventWireup="false" Codebehind="admin_exam_create.aspx.vb" Inherits="e_testweb.admin_exam_create" codePage="1251"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>ЭТС - Электрон тестийн систем</title>
		<META http-equiv="Content-Type" content="text/html; charset=windows-1251">
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="stylesss.css" type="text/css" rel="stylesheet">
	</HEAD>
	<body bottomMargin="0" leftMargin="0" topMargin="0" rightMargin="0" MS_POSITIONING="GridLayout">
		<SCRIPT>
window.name = "currentWindowName";
var newWin;
var newWin2;

function popUp(page, name, details) {
newWin=window.open(page, name, details);
return false;
}
function popUp2(page, name, details) {
newWin2=window.open(page, name, details);
newWin2.focus();
return false;
 }
		</SCRIPT>
		<form id="Form1" method="post" runat="server">
			<asp:label id="Label1" style="Z-INDEX: 104; LEFT: 40px; POSITION: absolute; TOP: 96px" runat="server"
				ForeColor="#404040" Font-Size="8pt" Font-Names="Tahoma" Height="8px" Width="160px">Хичээлийн код, нэр :</asp:label><asp:label id="Label28" style="Z-INDEX: 149; LEFT: 296px; POSITION: absolute; TOP: 96px" runat="server"
				ForeColor="#404040" Font-Size="8pt" Font-Names="Tahoma" Height="8px" Width="160px">Шалгалт vvсгэгчийн нэр :</asp:label><asp:textbox id="Textbox7" style="Z-INDEX: 148; LEFT: 296px; POSITION: absolute; TOP: 112px"
				runat="server" Width="240px" Enabled="False"></asp:textbox><asp:button id="Button4" style="Z-INDEX: 147; LEFT: 232px; POSITION: absolute; TOP: 256px" runat="server"
				ForeColor="White" Font-Size="8pt" Font-Names="Tahoma" Height="24px" Width="95px" Text="Нэмэх" BorderColor="#6B696B" BorderWidth="1px" BackColor="#6B696B"></asp:button><asp:label id="Label30" style="Z-INDEX: 146; LEFT: 816px; POSITION: absolute; TOP: 360px" runat="server"
				ForeColor="#404040" Font-Size="8pt" Font-Names="Tahoma" Height="8px" Width="129px">
				<div align="center">Шалгалт холих</div>
			</asp:label><asp:label id="Label27" style="Z-INDEX: 145; LEFT: 816px; POSITION: absolute; TOP: 288px" runat="server"
				ForeColor="#404040" Font-Size="8pt" Font-Names="Tahoma" Height="8px" Width="129px">
				<div align="center">Асуулт сонгох</div>
			</asp:label><asp:label id="Label26" style="Z-INDEX: 144; LEFT: 816px; POSITION: absolute; TOP: 432px" runat="server"
				ForeColor="#404040" Font-Size="8pt" Font-Names="Tahoma" Height="8px" Width="129px">
				<div align="center">Нvvр хуудас</div>
			</asp:label><asp:label id="Label25" style="Z-INDEX: 143; LEFT: 816px; POSITION: absolute; TOP: 216px" runat="server"
				ForeColor="#404040" Font-Size="8pt" Font-Names="Tahoma" Height="8px" Width="129px">
				<div align="center">Асуулт тохируулах</div>
			</asp:label><asp:label id="Label24" style="Z-INDEX: 142; LEFT: 816px; POSITION: absolute; TOP: 144px" runat="server"
				ForeColor="#404040" Font-Size="8pt" Font-Names="Tahoma" Height="8px" Width="129px">
				<div align="center">Тvвшин тохируулах</div>
			</asp:label><asp:label id="Label21" style="Z-INDEX: 139; LEFT: 816px; POSITION: absolute; TOP: 56px" runat="server"
				ForeColor="White" Font-Size="8pt" Font-Names="Tahoma" Height="8px" Width="112px" BackColor="#6B696B"
				Font-Bold="True">Удирдлагын цэс</asp:label><asp:label id="Label20" style="Z-INDEX: 138; LEFT: 808px; POSITION: absolute; TOP: 48px" runat="server"
				ForeColor="#6B696B" Height="32px" Width="144px" BorderColor="#6B696B" BorderWidth="1px" BackColor="#6B696B" BorderStyle="Solid"></asp:label><asp:label id="Label19" style="Z-INDEX: 137; LEFT: 24px; POSITION: absolute; TOP: 16px" runat="server"
				ForeColor="White" Font-Size="8pt" Font-Names="Tahoma" Height="8px" Width="104px" BackColor="#6B696B">Хэрэглэгчийн нэр :</asp:label><asp:label id="Label18" style="Z-INDEX: 136; LEFT: 720px; POSITION: absolute; TOP: 272px" runat="server"
				ForeColor="#404040" Font-Size="8pt" Font-Names="Tahoma" Height="8px" Width="56px"></asp:label><asp:label id="Label15" style="Z-INDEX: 135; LEFT: 696px; POSITION: absolute; TOP: 256px" runat="server"
				ForeColor="#404040" Font-Size="8pt" Font-Names="Tahoma" Height="8px" Width="96px"></asp:label><asp:label id="Label40" style="Z-INDEX: 134; LEFT: 680px; POSITION: absolute; TOP: 240px" runat="server"
				ForeColor="#404040" Font-Size="8pt" Font-Names="Tahoma" Height="8px" Width="96px"></asp:label><asp:label id="Label14" style="Z-INDEX: 133; LEFT: 592px; POSITION: absolute; TOP: 272px" runat="server"
				ForeColor="Gray" Font-Size="8pt" Font-Names="Tahoma" Height="8px" Width="140px" Font-Italic="True">Сонгосон оюутны тоо :</asp:label><asp:label id="Label13" style="Z-INDEX: 132; LEFT: 592px; POSITION: absolute; TOP: 256px" runat="server"
				ForeColor="Gray" Font-Size="8pt" Font-Names="Tahoma" Height="8px" Width="124px" Font-Italic="True">Идэвхитэй улирал :</asp:label><asp:label id="Label32" style="Z-INDEX: 131; LEFT: 592px; POSITION: absolute; TOP: 240px" runat="server"
				ForeColor="Gray" Font-Size="8pt" Font-Names="Tahoma" Height="8px" Width="108px" Font-Italic="True">Хичээлийн жил :</asp:label><asp:label id="Label12" style="Z-INDEX: 130; LEFT: 576px; POSITION: absolute; TOP: 232px" runat="server"
				ForeColor="White" Height="64px" Width="224px" BorderColor="#6B696B" BorderWidth="1px" BorderStyle="Solid"></asp:label><asp:label id="Label10" style="Z-INDEX: 100; LEFT: 808px; POSITION: absolute; TOP: 48px" runat="server"
				ForeColor="White" Height="424px" Width="144px" BorderColor="#6B696B" BorderWidth="1px" BorderStyle="Solid"></asp:label><asp:label id="Label29" style="Z-INDEX: 129; LEFT: 760px; POSITION: absolute; TOP: 16px" runat="server"
				ForeColor="White" Font-Size="14pt" Font-Names="Tahoma" Height="8px" Width="115px" BackColor="#6B696B" Font-Bold="True">АДМИНИСТРАТОР</asp:label><asp:datagrid id="DataGrid1" style="Z-INDEX: 128; LEFT: 8px; POSITION: absolute; TOP: 304px" runat="server"
				ForeColor="Black" Font-Size="7pt" Font-Names="Tahoma" Width="792px" BorderColor="#DEDFDE" BorderWidth="1px" BackColor="White" BorderStyle="None" CellPadding="4" AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True" GridLines="Vertical"
				PageSize="15">
				<SelectedItemStyle Font-Bold="True" ForeColor="White" BackColor="#CE5D5A"></SelectedItemStyle>
				<AlternatingItemStyle BackColor="White"></AlternatingItemStyle>
				<ItemStyle BackColor="#F7F7DE"></ItemStyle>
				<HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#6B696B"></HeaderStyle>
				<FooterStyle BackColor="#CCCC99"></FooterStyle>
				<Columns>
					<asp:BoundColumn DataField="T008A" HeaderText="Ш/д">
						<HeaderStyle Width="5%"></HeaderStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="T008B" HeaderText="Хич. код">
						<HeaderStyle Width="10%"></HeaderStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="U035DD" HeaderText="Хичээлийн нэр">
						<HeaderStyle Width="25%"></HeaderStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="T008K" HeaderText="Шалгалтын нэр">
						<HeaderStyle Width="25%"></HeaderStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="T008Q" HeaderText="Ш. vvсгэгчийн нэр ">
						<HeaderStyle Width="15%"></HeaderStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="hugatsaa" HeaderText="Ш.хугацаа">
						<HeaderStyle Width="10%"></HeaderStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="T008H" HeaderText="Оноо">
						<HeaderStyle Width="5%"></HeaderStyle>
					</asp:BoundColumn>
					<asp:TemplateColumn HeaderText="Засах">
						<HeaderStyle Width="5%"></HeaderStyle>
						<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
						<ItemTemplate>
							<A href='admin_exam_create.aspx?examID=<%# DataBinder.Eval(Container, "DataItem.T008A") %>'>
								<asp:Label id="Label1" runat="server">Засах</asp:Label></A>
						</ItemTemplate>
					</asp:TemplateColumn>
				</Columns>
				<PagerStyle HorizontalAlign="Right" ForeColor="Black" BackColor="#F7F7DE" PageButtonCount="15"
					Mode="NumericPages"></PagerStyle>
			</asp:datagrid><asp:label id="Label17" style="Z-INDEX: 127; LEFT: 8px; POSITION: absolute; TOP: 8px" runat="server"
				ForeColor="#6B696B" Height="32px" Width="944px" BorderColor="#6B696B" BorderWidth="1px" BackColor="#6B696B"
				BorderStyle="Solid"></asp:label><asp:label id="Label9" style="Z-INDEX: 119; LEFT: 600px; POSITION: absolute; TOP: 136px" runat="server"
				ForeColor="#404040" Font-Size="8pt" Font-Names="Tahoma" Height="8px" Width="144px">Шалгалт дуусах хугацаа :</asp:label><asp:label id="Label8" style="Z-INDEX: 117; LEFT: 600px; POSITION: absolute; TOP: 96px" runat="server"
				ForeColor="#404040" Font-Size="8pt" Font-Names="Tahoma" Height="8px" Width="144px">Шалгалт эхлэх хугацаа :</asp:label><asp:label id="Label7" style="Z-INDEX: 116; LEFT: 584px; POSITION: absolute; TOP: 56px" runat="server"
				ForeColor="White" Font-Size="8pt" Font-Names="Tahoma" Height="8px" Width="144px" BackColor="#6B696B" Font-Bold="True">Шалгалт идэвхижvvлэх</asp:label><asp:label id="Label6" style="Z-INDEX: 101; LEFT: 576px; POSITION: absolute; TOP: 48px" runat="server"
				Height="176px" Width="224px" BorderColor="#6B696B" BorderWidth="1px" BorderStyle="Solid"></asp:label><asp:label id="Label5" style="Z-INDEX: 115; LEFT: 576px; POSITION: absolute; TOP: 48px" runat="server"
				ForeColor="#6B696B" Height="32px" Width="224px" BorderColor="#6B696B" BorderWidth="1px" BackColor="#6B696B" BorderStyle="Solid"></asp:label><asp:label id="Label23" style="Z-INDEX: 112; LEFT: 16px; POSITION: absolute; TOP: 56px" runat="server"
				ForeColor="White" Font-Size="8pt" Font-Names="Tahoma" Height="8px" Width="144px" BackColor="#6B696B" Font-Bold="True">Асуулт vvсгэх талбар</asp:label><asp:label id="Label4" style="Z-INDEX: 110; LEFT: 296px; POSITION: absolute; TOP: 176px" runat="server"
				ForeColor="#404040" Font-Size="8pt" Font-Names="Tahoma" Height="8px" Width="120px">Шалгалтын оноо :</asp:label><asp:label id="Label3" style="Z-INDEX: 108; LEFT: 40px; POSITION: absolute; TOP: 176px" runat="server"
				ForeColor="#404040" Font-Size="8pt" Font-Names="Tahoma" Height="8px" Width="120px">Хугацаа (минут) :</asp:label><asp:label id="Label11" style="Z-INDEX: 102; LEFT: 8px; POSITION: absolute; TOP: 48px" runat="server"
				Height="248px" Width="560px" BorderColor="#6B696B" BorderWidth="1px" BorderStyle="Solid"></asp:label><asp:label id="Label22" style="Z-INDEX: 107; LEFT: 8px; POSITION: absolute; TOP: 48px" runat="server"
				ForeColor="#6B696B" Height="32px" Width="560px" BorderColor="#6B696B" BorderWidth="1px" BackColor="#6B696B" BorderStyle="Solid"></asp:label><asp:label id="Label2" style="Z-INDEX: 106; LEFT: 40px; POSITION: absolute; TOP: 136px" runat="server"
				ForeColor="#404040" Font-Size="8pt" Font-Names="Tahoma" Height="8px" Width="120px">Шалгалтын нэр :</asp:label>&nbsp;<asp:textbox id="TextBox1" style="Z-INDEX: 103; LEFT: 40px; POSITION: absolute; TOP: 152px" runat="server"
				Width="496px"></asp:textbox><asp:textbox id="TextBox2" style="Z-INDEX: 109; LEFT: 40px; POSITION: absolute; TOP: 192px" runat="server"
				Width="240px"></asp:textbox><asp:textbox id="TextBox3" style="Z-INDEX: 111; LEFT: 296px; POSITION: absolute; TOP: 192px"
				runat="server" Width="240px"></asp:textbox><asp:button id="Button1" style="Z-INDEX: 113; LEFT: 336px; POSITION: absolute; TOP: 256px" runat="server"
				ForeColor="White" Font-Size="8pt" Font-Names="Tahoma" Height="24px" Width="95px" Enabled="False" Text="Хадгалах" BorderColor="#6B696B"
				BorderWidth="1px" BackColor="#6B696B"></asp:button><asp:button id="Button2" style="Z-INDEX: 114; LEFT: 440px; POSITION: absolute; TOP: 256px" runat="server"
				ForeColor="White" Font-Size="8pt" Font-Names="Tahoma" Height="24px" Width="95px" Enabled="False" Text="Устгах" BorderColor="#6B696B" BorderWidth="1px"
				BackColor="#6B696B"></asp:button><asp:textbox id="TextBox4" style="Z-INDEX: 118; LEFT: 600px; POSITION: absolute; TOP: 112px"
				runat="server" Width="180px"></asp:textbox><asp:textbox id="TextBox5" style="Z-INDEX: 120; LEFT: 600px; POSITION: absolute; TOP: 152px"
				runat="server" Width="180px"></asp:textbox><asp:button id="Button3" style="Z-INDEX: 121; LEFT: 632px; POSITION: absolute; TOP: 184px" runat="server"
				ForeColor="White" Font-Size="8pt" Font-Names="Tahoma" Height="24px" Width="114px" Enabled="False" Text="Идэвхижvvлэх" BorderColor="#6B696B"
				BorderWidth="1px" BackColor="#6B696B"></asp:button><asp:imagebutton id="ImageButton2" style="Z-INDEX: 122; LEFT: 856px; POSITION: absolute; TOP: 168px"
				runat="server" Height="48px" Width="48px" ImageUrl=".\imgs\bl_question.jpg"></asp:imagebutton><asp:textbox id="TextBox6" style="Z-INDEX: 123; LEFT: 40px; POSITION: absolute; TOP: 112px" runat="server"
				Width="240px" Enabled="False"></asp:textbox><asp:radiobuttonlist id="RadioButtonList1" style="Z-INDEX: 124; LEFT: 48px; POSITION: absolute; TOP: 216px"
				runat="server" ForeColor="#404040" Font-Size="8pt" Font-Names="Tahoma" Height="32px" Width="480px" RepeatDirection="Horizontal">
				<asp:ListItem Value="Явцын сорил I">Явцын сорил I</asp:ListItem>
				<asp:ListItem Value="Явцын сорил II">Явцын сорил II</asp:ListItem>
				<asp:ListItem Value="Улирлын шалгалт">Улирлын шалгалт</asp:ListItem>
			</asp:radiobuttonlist><asp:imagebutton id="ImageButton1" style="Z-INDEX: 125; LEFT: 856px; POSITION: absolute; TOP: 96px"
				runat="server" Height="48px" Width="48px" ImageUrl=".\imgs\bl_chooselevel.jpg"></asp:imagebutton>
			<asp:imagebutton id="ImageButton3" style="Z-INDEX: 126; LEFT: 856px; POSITION: absolute; TOP: 384px"
				runat="server" Height="48px" Width="48px" ImageUrl=".\imgs\bl_home1.jpg"></asp:imagebutton><asp:imagebutton id="ImageButton5" style="Z-INDEX: 140; LEFT: 856px; POSITION: absolute; TOP: 312px"
				runat="server" Height="48px" Width="48px" ImageUrl=".\imgs\bl_mixer.jpg"></asp:imagebutton><asp:imagebutton id="ImageButton4" style="Z-INDEX: 141; LEFT: 856px; POSITION: absolute; TOP: 240px"
				runat="server" Height="48px" Width="48px" ImageUrl=".\imgs\bl_questchoose.jpg"></asp:imagebutton></form>
	</body>
</HTML>
