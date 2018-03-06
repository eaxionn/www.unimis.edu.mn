<%@ Page Language="vb" AutoEventWireup="false" Codebehind="choosegroup.aspx.vb" Inherits="e_testweb.admin_choose_group"%>
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
		<form id="Form1" method="post" runat="server">
			<asp:label id="Label9" style="Z-INDEX: 106; LEFT: 48px; POSITION: absolute; TOP: 104px" runat="server"
				Width="240px" Height="8px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040">Шалгалтанд сонгогдох асуултын тvвшин :</asp:label>
			<asp:button id="Button2" style="Z-INDEX: 109; LEFT: 320px; POSITION: absolute; TOP: 72px" runat="server"
				Width="72px" Height="24px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="White" BackColor="#6B696B"
				BorderWidth="1px" BorderColor="#6B696B" Text="Хадгалах"></asp:button>
			<asp:label id="Label8" style="Z-INDEX: 104; LEFT: 48px; POSITION: absolute; TOP: 56px" runat="server"
				Width="144px" Height="8px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040"> Оруулах хэсэг :</asp:label>
			<asp:label id="Label7" style="Z-INDEX: 103; LEFT: 16px; POSITION: absolute; TOP: 16px" runat="server"
				Width="344px" Height="8px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#E0E0E0" BackColor="#6B696B"
				Font-Bold="True">Шалгалтанд орох асуултуудын тvвшинг сонго</asp:label>
			<asp:label id="Label6" style="Z-INDEX: 101; LEFT: 8px; POSITION: absolute; TOP: 8px" runat="server"
				Width="504px" Height="264px" BorderWidth="1px" BorderStyle="Solid" BorderColor="#6B696B"></asp:label>
			<asp:label id="Label5" style="Z-INDEX: 102; LEFT: 8px; POSITION: absolute; TOP: 8px" runat="server"
				Width="504px" Height="32px" BackColor="#6B696B" BorderWidth="1px" BorderStyle="Solid" BorderColor="#6B696B"></asp:label>
			<asp:button id="Button1" style="Z-INDEX: 105; LEFT: 400px; POSITION: absolute; TOP: 72px" runat="server"
				Width="72px" Height="24px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="White" BackColor="#6B696B"
				BorderWidth="1px" BorderColor="#6B696B" Text="Болих"></asp:button>
			<asp:TextBox id="TextBox1" style="Z-INDEX: 107; LEFT: 48px; POSITION: absolute; TOP: 72px" runat="server"
				Width="264px"></asp:TextBox>
			<asp:DataGrid id="DataGrid1" style="Z-INDEX: 108; LEFT: 48px; POSITION: absolute; TOP: 120px"
				runat="server" Width="424px" Height="88px" Font-Names="tahoma" Font-Size="XX-Small" ForeColor="Black"
				BackColor="White" BorderWidth="1px" BorderStyle="None" BorderColor="#DEDFDE" CellPadding="4"
				GridLines="Vertical" AllowPaging="True" PageSize="4" AllowCustomPaging="True" AutoGenerateColumns="False">
				<SelectedItemStyle Font-Bold="True" ForeColor="White" BackColor="#CE5D5A"></SelectedItemStyle>
				<AlternatingItemStyle BackColor="White"></AlternatingItemStyle>
				<ItemStyle BackColor="#F7F7DE"></ItemStyle>
				<HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#6B696B"></HeaderStyle>
				<FooterStyle BackColor="#CCCC99"></FooterStyle>
				<Columns>
					<asp:BoundColumn DataField="T017A" HeaderText="№"></asp:BoundColumn>
					<asp:BoundColumn DataField="T017B" HeaderText="Тvвшний нэр">
						<HeaderStyle Width="45%"></HeaderStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="bgaa" HeaderText="Одоо байгаа">
						<HeaderStyle Width="20%"></HeaderStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="too" HeaderText="Сонгогдсон">
						<HeaderStyle Width="20%"></HeaderStyle>
					</asp:BoundColumn>
					<asp:TemplateColumn HeaderText="Засах">
						<HeaderStyle Width="10%"></HeaderStyle>
						<ItemTemplate>
							<A href='choosegroup.aspx?levelID=<%# DataBinder.Eval(Container, "DataItem.T017A") %>'>
								<asp:Label id="Label1" runat="server">Засах</asp:Label></A>
						</ItemTemplate>
					</asp:TemplateColumn>
				</Columns>
				<PagerStyle NextPageText="Дараах" PrevPageText="Ємнєх" HorizontalAlign="Right" ForeColor="Black"
					BackColor="#F7F7DE"></PagerStyle>
			</asp:DataGrid>
		</form>
	</body>
</HTML>
