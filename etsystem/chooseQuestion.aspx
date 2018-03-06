<%@ Page Language="vb" AutoEventWireup="false" Codebehind="chooseQuestion.aspx.vb" Inherits="e_testweb.chooseQuestion"%>
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
			<asp:label id="Label9" style="Z-INDEX: 109; LEFT: 48px; POSITION: absolute; TOP: 104px" runat="server"
				Width="256px" Height="8px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040">Шалгалтанд сонгогдох лекцийн сэдвvvд :</asp:label>
			<asp:button id="Button2" style="Z-INDEX: 108; LEFT: 448px; POSITION: absolute; TOP: 72px" runat="server"
				Width="72px" Height="24px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="White" BackColor="#6B696B"
				BorderWidth="1px" BorderColor="#6B696B" Text="Хадгалах"></asp:button>
			<asp:label id="Label8" style="Z-INDEX: 104; LEFT: 48px; POSITION: absolute; TOP: 56px" runat="server"
				Width="144px" Height="8px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040"> Оруулах хэсэг :</asp:label>
			<asp:label id="Label7" style="Z-INDEX: 103; LEFT: 16px; POSITION: absolute; TOP: 16px" runat="server"
				Width="432px" Height="8px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#E0E0E0" BackColor="#6B696B"
				Font-Bold="True">Шалгалтанд орох асуултуудыг лекцийн сэдвээр тохируулах</asp:label>
			<asp:label id="Label6" style="Z-INDEX: 100; LEFT: 8px; POSITION: absolute; TOP: 8px" runat="server"
				Width="632px" Height="496px" BorderWidth="1px" BorderColor="#6B696B" BorderStyle="Solid"></asp:label>
			<asp:label id="Label5" style="Z-INDEX: 102; LEFT: 8px; POSITION: absolute; TOP: 8px" runat="server"
				Width="632px" Height="32px" BackColor="#6B696B" BorderWidth="1px" BorderColor="#6B696B"
				BorderStyle="Solid"></asp:label>
			<asp:button id="Button1" style="Z-INDEX: 105; LEFT: 528px; POSITION: absolute; TOP: 72px" runat="server"
				Width="72px" Height="24px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="White" BackColor="#6B696B"
				BorderWidth="1px" BorderColor="#6B696B" Text="Болих"></asp:button>
			<asp:TextBox id="TextBox1" style="Z-INDEX: 106; LEFT: 48px; POSITION: absolute; TOP: 72px" runat="server"
				Width="392px"></asp:TextBox>
			<asp:DataGrid id="DataGrid1" style="Z-INDEX: 107; LEFT: 48px; POSITION: absolute; TOP: 120px"
				runat="server" Width="552px" Height="88px" Font-Names="tahoma" Font-Size="XX-Small" ForeColor="Black"
				BackColor="White" BorderWidth="1px" BorderColor="#DEDFDE" BorderStyle="None" CellPadding="4"
				GridLines="Vertical" AllowPaging="True" PageSize="16" AllowCustomPaging="True" AutoGenerateColumns="False">
				<SelectedItemStyle Font-Bold="True" ForeColor="White" BackColor="#CE5D5A"></SelectedItemStyle>
				<AlternatingItemStyle BackColor="White"></AlternatingItemStyle>
				<ItemStyle BackColor="#F7F7DE"></ItemStyle>
				<HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#6B696B"></HeaderStyle>
				<FooterStyle BackColor="#CCCC99"></FooterStyle>
				<Columns>
					<asp:BoundColumn DataField="U0354BB" HeaderText="№">
						<HeaderStyle Width="5%"></HeaderStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="U0354CC" HeaderText="Хичээлийн сэдвийн нэр">
						<HeaderStyle Width="60%"></HeaderStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="bgaa" HeaderText="Одоо байгаа">
						<HeaderStyle Width="20%"></HeaderStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="too" HeaderText="Сонгогдсон">
						<HeaderStyle Width="10%"></HeaderStyle>
					</asp:BoundColumn>
					<asp:TemplateColumn HeaderText="Засах">
						<HeaderStyle Width="5%"></HeaderStyle>
						<ItemTemplate>
							<A href='chooseQuestion.aspx?unitID=<%# DataBinder.Eval(Container, "DataItem.U0354BB") %>'>
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
