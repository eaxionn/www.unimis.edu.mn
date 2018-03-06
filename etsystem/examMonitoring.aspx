<%@ Page Language="vb" AutoEventWireup="false" Codebehind="examMonitoring.aspx.vb" Inherits="e_testweb.examMonitoring"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>Шалгалт хянах</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="stylesss.css" type="text/css" rel="stylesheet">
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
newWin2=window.open(page, name, details);
newWin2.focus();
return false;
 }
		</SCRIPT>
		<form id="Form1" method="post" runat="server">
			<asp:label id="Label19" style="Z-INDEX: 104; LEFT: 24px; POSITION: absolute; TOP: 16px" runat="server"
				ForeColor="White" Font-Size="8pt" Font-Names="Tahoma" Height="8px" Width="104px" BackColor="#6B696B">Хэрэглэгчийн нэр :</asp:label><asp:label id="Label8" style="Z-INDEX: 127; LEFT: 824px; POSITION: absolute; TOP: 224px" runat="server"
				ForeColor="#404040" Font-Size="8pt" Font-Names="Tahoma" Height="8px" Width="104px">Оюутны код :</asp:label><asp:button id="Button9" style="Z-INDEX: 126; LEFT: 832px; POSITION: absolute; TOP: 272px" runat="server"
				ForeColor="White" Font-Size="8pt" Font-Names="Tahoma" Height="24px" Width="96px" BackColor="#6B696B" Text="Хайх" BorderColor="#6B696B" BorderWidth="1px"></asp:button><asp:textbox id="Textbox3" style="Z-INDEX: 125; LEFT: 824px; POSITION: absolute; TOP: 240px"
				runat="server" Height="24px" Width="113px"></asp:textbox><asp:button id="Button8" style="Z-INDEX: 124; LEFT: 832px; POSITION: absolute; TOP: 592px" runat="server"
				ForeColor="White" Font-Size="8pt" Font-Names="Tahoma" Height="24px" Width="96px" BackColor="#6B696B" Text="Нvvр хуудас" BorderColor="#6B696B" BorderWidth="1px"></asp:button><asp:button id="Button7" style="Z-INDEX: 123; LEFT: 832px; POSITION: absolute; TOP: 560px" runat="server"
				ForeColor="White" Font-Size="8pt" Font-Names="Tahoma" Height="24px" Width="96px" BackColor="#6B696B" Text="Хvлээн авах" BorderColor="#6B696B" BorderWidth="1px"></asp:button><asp:button id="Button6" style="Z-INDEX: 122; LEFT: 832px; POSITION: absolute; TOP: 528px" runat="server"
				ForeColor="White" Font-Size="8pt" Font-Names="Tahoma" Height="24px" Width="96px" BackColor="#6B696B" Text="Мэдээлэл илгээх" BorderColor="#6B696B" BorderWidth="1px"></asp:button><asp:button id="Button5" style="Z-INDEX: 121; LEFT: 832px; POSITION: absolute; TOP: 496px" runat="server"
				ForeColor="White" Font-Size="8pt" Font-Names="Tahoma" Height="24px" Width="96px" BackColor="#6B696B" Text="Хугацаа" BorderColor="#6B696B" BorderWidth="1px"></asp:button><asp:label id="Label7" style="Z-INDEX: 120; LEFT: 824px; POSITION: absolute; TOP: 448px" runat="server"
				ForeColor="#404040" Font-Size="8pt" Font-Names="Tahoma" Height="8px" Width="104px">Оюутны хугацаа :</asp:label><asp:textbox id="TextBox2" style="Z-INDEX: 119; LEFT: 824px; POSITION: absolute; TOP: 464px"
				runat="server" Height="24px" Width="113px"></asp:textbox><asp:button id="Button3" style="Z-INDEX: 118; LEFT: 832px; POSITION: absolute; TOP: 416px" runat="server"
				ForeColor="White" Font-Size="8pt" Font-Names="Tahoma" Height="24px" Width="96px" BackColor="#6B696B" Text="Зогсоох" BorderColor="#6B696B" BorderWidth="1px"></asp:button><asp:button id="Button2" style="Z-INDEX: 117; LEFT: 832px; POSITION: absolute; TOP: 384px" runat="server"
				ForeColor="White" Font-Size="8pt" Font-Names="Tahoma" Height="24px" Width="96px" BackColor="#6B696B" Text="Эхлvvлэх" BorderColor="#6B696B" BorderWidth="1px"></asp:button><asp:button id="Button1" style="Z-INDEX: 116; LEFT: 832px; POSITION: absolute; TOP: 352px" runat="server"
				ForeColor="White" Font-Size="8pt" Font-Names="Tahoma" Height="24px" Width="97px" BackColor="#6B696B" Text="Идэвхижvvлэх" BorderColor="#6B696B" BorderWidth="1px"></asp:button><asp:label id="Label6" style="Z-INDEX: 114; LEFT: 824px; POSITION: absolute; TOP: 304px" runat="server"
				ForeColor="#404040" Font-Size="8pt" Font-Names="Tahoma" Height="8px" Width="104px">Оюутны дугаар :</asp:label><asp:label id="Label5" style="Z-INDEX: 112; LEFT: 816px; POSITION: absolute; TOP: 56px" runat="server"
				ForeColor="White" Font-Size="8pt" Font-Names="Tahoma" Height="8px" Width="112px" BackColor="#6B696B" Font-Bold="True">Шалгалтууд</asp:label><asp:label id="Label24" style="Z-INDEX: 111; LEFT: 824px; POSITION: absolute; TOP: 88px" runat="server"
				ForeColor="#404040" Font-Size="8pt" Font-Names="Tahoma" Height="8px" Width="104px" BackColor="WhiteSmoke">Vvссэн шалгалт :</asp:label><asp:button id="Button4" style="Z-INDEX: 110; LEFT: 832px; POSITION: absolute; TOP: 136px" runat="server"
				ForeColor="White" Font-Size="8pt" Font-Names="Tahoma" Height="24px" Width="95px" BackColor="#6B696B" Text="Цонхыг сэргээх" BorderColor="#6B696B" BorderWidth="1px"></asp:button><asp:label id="Label4" style="Z-INDEX: 100; LEFT: 808px; POSITION: absolute; TOP: 48px" runat="server"
				ForeColor="White" Height="128px" Width="144px" BackColor="WhiteSmoke" BorderColor="#6B696B" BorderWidth="1px" BorderStyle="Solid"></asp:label><asp:label id="Label2" style="Z-INDEX: 108; LEFT: 808px; POSITION: absolute; TOP: 48px" runat="server"
				ForeColor="#6B696B" Height="32px" Width="144px" BackColor="#6B696B" BorderColor="#6B696B" BorderWidth="1px" BorderStyle="Solid"></asp:label><asp:label id="Label21" style="Z-INDEX: 107; LEFT: 816px; POSITION: absolute; TOP: 192px" runat="server"
				ForeColor="White" Font-Size="8pt" Font-Names="Tahoma" Height="8px" Width="112px" BackColor="#6B696B" Font-Bold="True">Оюутны шалгалт</asp:label><asp:label id="Label10" style="Z-INDEX: 101; LEFT: 808px; POSITION: absolute; TOP: 184px" runat="server"
				ForeColor="White" Height="456px" Width="144px" BorderColor="#6B696B" BorderWidth="1px" BorderStyle="Solid"></asp:label><asp:label id="Label3" style="Z-INDEX: 106; LEFT: 808px; POSITION: absolute; TOP: 184px" runat="server"
				ForeColor="#6B696B" Height="32px" Width="144px" BackColor="#6B696B" BorderColor="#6B696B" BorderWidth="1px" BorderStyle="Solid"></asp:label><asp:datagrid id="DataGrid1" style="Z-INDEX: 105; LEFT: 8px; POSITION: absolute; TOP: 48px" runat="server"
				ForeColor="Black" Font-Size="7pt" Font-Names="Tahoma" Height="240px" Width="792px" BackColor="White" BorderColor="#DEDFDE" BorderWidth="1px" BorderStyle="None" CellPadding="4" AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True"
				GridLines="Vertical" PageSize="40">
				<SelectedItemStyle Font-Bold="True" ForeColor="White" BackColor="#CE5D5A"></SelectedItemStyle>
				<AlternatingItemStyle BackColor="White"></AlternatingItemStyle>
				<ItemStyle Height="18px" BackColor="#F7F7DE"></ItemStyle>
				<HeaderStyle Font-Bold="True" Height="24px" ForeColor="White" BackColor="#6B696B"></HeaderStyle>
				<FooterStyle BackColor="#CCCC99"></FooterStyle>
				<Columns>
					<asp:BoundColumn DataField="T013B" HeaderText="Оюутны код">
						<HeaderStyle Width="10%"></HeaderStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="T016B" HeaderText="Тєлєв">
						<HeaderStyle Width="15%"></HeaderStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="T013D" HeaderText="Шалгалтын оноо">
						<HeaderStyle Width="10%"></HeaderStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="T013F" HeaderText="Хаяг">
						<HeaderStyle Width="10%"></HeaderStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="T013G" HeaderText="Огноо">
						<HeaderStyle Width="15%"></HeaderStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="T013L" HeaderText="Хариулсан асуултын тоо">
						<HeaderStyle Width="15%"></HeaderStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="T013O" HeaderText="Дvн">
						<HeaderStyle Width="5%"></HeaderStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="T013E" HeaderText="Хугацаа">
						<HeaderStyle Width="5%"></HeaderStyle>
					</asp:BoundColumn>
					<asp:TemplateColumn HeaderText="Засах">
						<HeaderStyle Width="5%"></HeaderStyle>
						<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
						<ItemTemplate>
							<A href='examMonitoring.aspx?studID=<%# DataBinder.Eval(Container, "DataItem.T013H") %>'>
								<asp:Label id="Label1" runat="server">Засах</asp:Label></A>
						</ItemTemplate>
					</asp:TemplateColumn>
				</Columns>
				<PagerStyle NextPageText="Дараах &gt;" PrevPageText="&lt; Ємнєх" HorizontalAlign="Right" ForeColor="Black"
					BackColor="#F7F7DE" PageButtonCount="20"></PagerStyle>
			</asp:datagrid><asp:label id="Label29" style="Z-INDEX: 103; LEFT: 760px; POSITION: absolute; TOP: 16px" runat="server"
				ForeColor="White" Font-Size="14pt" Font-Names="Tahoma" Height="8px" Width="115px" BackColor="#6B696B"
				Font-Bold="True">АДМИНИСТРАТОР</asp:label><asp:label id="Label17" style="Z-INDEX: 102; LEFT: 8px; POSITION: absolute; TOP: 8px" runat="server"
				ForeColor="#6B696B" Height="32px" Width="944px" BackColor="#6B696B" BorderColor="#6B696B" BorderWidth="1px" BorderStyle="Solid"></asp:label><asp:dropdownlist id="Exam" style="Z-INDEX: 109; LEFT: 824px; POSITION: absolute; TOP: 104px" runat="server"
				Height="16px" Width="112px"></asp:dropdownlist><asp:textbox id="TextBox1" style="Z-INDEX: 113; LEFT: 824px; POSITION: absolute; TOP: 320px"
				runat="server" Height="24px" Width="113px" Enabled="False"></asp:textbox></form>
	</body>
</HTML>
