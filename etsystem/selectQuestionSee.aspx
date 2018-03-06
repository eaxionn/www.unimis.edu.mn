<%@ Page Language="vb" AutoEventWireup="false" Codebehind="selectQuestionSee.aspx.vb" Inherits="e_testweb.selectQuestionSee"%>
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
			<asp:label id="Label9" style="Z-INDEX: 108; LEFT: 48px; POSITION: absolute; TOP: 120px" runat="server"
				Width="240px" Height="8px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040">Шалгалтанд сонгогдох асуултууд :</asp:label>
			<asp:DataGrid id="DataGrid2" style="Z-INDEX: 113; LEFT: 48px; POSITION: absolute; TOP: 136px"
				runat="server" ForeColor="Black" Font-Size="XX-Small" Font-Names="tahoma" Height="88px" Width="555px"
				BorderColor="#DEDFDE" BorderWidth="1px" BackColor="White" BorderStyle="None" AutoGenerateColumns="False"
				PageSize="20" AllowPaging="True" GridLines="Vertical" CellPadding="4" Visible="False">
				<SelectedItemStyle Font-Bold="True" ForeColor="White" BackColor="#CE5D5A"></SelectedItemStyle>
				<AlternatingItemStyle BackColor="WhiteSmoke"></AlternatingItemStyle>
				<ItemStyle BackColor="White"></ItemStyle>
				<HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#6B696B"></HeaderStyle>
				<FooterStyle BackColor="#CCCC99"></FooterStyle>
				<Columns>
					<asp:BoundColumn DataField="T001J" HeaderText="№">
						<HeaderStyle Width="10%"></HeaderStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="T001B" HeaderText="Асуулт">
						<HeaderStyle Width="35%"></HeaderStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="T001A" HeaderText="Индекс">
						<HeaderStyle Width="10%"></HeaderStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="T001K" HeaderText="Бvлэг">
						<HeaderStyle Width="10%"></HeaderStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="T001I" HeaderText="Тєрєл">
						<HeaderStyle Width="10%"></HeaderStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="T001H" HeaderText="Оноо">
						<HeaderStyle Width="10%"></HeaderStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="T001G" HeaderText="Огноо">
						<HeaderStyle Width="15%"></HeaderStyle>
					</asp:BoundColumn>
				</Columns>
				<PagerStyle NextPageText="Дараах" PrevPageText="Ємнєх" HorizontalAlign="Right" ForeColor="Black"
					BackColor="#F7F7DE"></PagerStyle>
			</asp:DataGrid>
			<asp:ImageButton id="ImageButton2" style="Z-INDEX: 111; LEFT: 424px; POSITION: absolute; TOP: 112px"
				runat="server" Width="178px" Height="26px" ImageUrl=".\imgs\tab_button1_r.jpg"></asp:ImageButton>
			<asp:button id="Button3" style="Z-INDEX: 109; LEFT: 320px; POSITION: absolute; TOP: 72px" runat="server"
				Width="72px" Height="24px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="White" BackColor="#6B696B"
				BorderWidth="1px" BorderColor="#6B696B" Text="Хадгалах"></asp:button>
			<asp:button id="Button2" style="Z-INDEX: 107; LEFT: 400px; POSITION: absolute; TOP: 72px" runat="server"
				Width="120px" Height="24px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="White" BackColor="#6B696B"
				BorderWidth="1px" BorderColor="#6B696B" Text="Санамсаргvй сонгох"></asp:button>
			<asp:label id="Label8" style="Z-INDEX: 104; LEFT: 48px; POSITION: absolute; TOP: 56px" runat="server"
				Width="144px" Height="8px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#404040"> Оруулах хэсэг :</asp:label>
			<asp:label id="Label7" style="Z-INDEX: 103; LEFT: 16px; POSITION: absolute; TOP: 16px" runat="server"
				Width="344px" Height="8px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#E0E0E0" BackColor="#6B696B"
				Font-Bold="True">Шалгалтанд орох асуултуудыг сонго</asp:label>
			<asp:label id="Label6" style="Z-INDEX: 100; LEFT: 8px; POSITION: absolute; TOP: 8px" runat="server"
				Width="632px" Height="600px" BorderWidth="1px" BorderColor="#6B696B" BorderStyle="Solid"></asp:label>
			<asp:label id="Label5" style="Z-INDEX: 102; LEFT: 8px; POSITION: absolute; TOP: 8px" runat="server"
				Width="632px" Height="32px" BackColor="#6B696B" BorderWidth="1px" BorderColor="#6B696B"
				BorderStyle="Solid"></asp:label>
			<asp:button id="Button1" style="Z-INDEX: 105; LEFT: 528px; POSITION: absolute; TOP: 72px" runat="server"
				Width="72px" Height="24px" Font-Names="Tahoma" Font-Size="8pt" ForeColor="White" BackColor="#6B696B"
				BorderWidth="1px" BorderColor="#6B696B" Text="Болих"></asp:button>
			<asp:TextBox id="TextBox1" style="Z-INDEX: 106; LEFT: 48px; POSITION: absolute; TOP: 72px" runat="server"
				Width="264px"></asp:TextBox>
			<asp:DataGrid id="DataGrid1" style="Z-INDEX: 112; LEFT: 48px; POSITION: absolute; TOP: 136px"
				runat="server" Width="555px" Height="88px" Font-Names="tahoma" Font-Size="XX-Small" ForeColor="Black"
				BackColor="White" BorderWidth="1px" BorderColor="#DEDFDE" BorderStyle="None" CellPadding="4"
				GridLines="Vertical" AllowPaging="True" PageSize="20" AutoGenerateColumns="False">
				<SelectedItemStyle Font-Bold="True" ForeColor="White" BackColor="#CE5D5A"></SelectedItemStyle>
				<AlternatingItemStyle BackColor="WhiteSmoke"></AlternatingItemStyle>
				<ItemStyle BackColor="White"></ItemStyle>
				<HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#6B696B"></HeaderStyle>
				<FooterStyle BackColor="#CCCC99"></FooterStyle>
				<Columns>
					<asp:BoundColumn DataField="T001J" HeaderText="№">
						<HeaderStyle Width="10%"></HeaderStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="T001B" HeaderText="Асуулт">
						<HeaderStyle Width="60%"></HeaderStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="T001A" HeaderText="Асуултын индекс">
						<HeaderStyle Width="20%"></HeaderStyle>
					</asp:BoundColumn>
					<asp:TemplateColumn HeaderText="Засах">
						<HeaderStyle Width="5%"></HeaderStyle>
						<ItemTemplate>
							<A href='selectQuestionSee.aspx?quesID=<%# DataBinder.Eval(Container, "DataItem.T001A") %>'>
								<asp:Label id="Label1" runat="server">Засах</asp:Label></A>
						</ItemTemplate>
					</asp:TemplateColumn>
				</Columns>
				<PagerStyle NextPageText="Дараах" PrevPageText="Ємнєх" HorizontalAlign="Right" ForeColor="Black"
					BackColor="#F7F7DE"></PagerStyle>
			</asp:DataGrid>
			<asp:ImageButton id="ImageButton1" style="Z-INDEX: 110; LEFT: 248px; POSITION: absolute; TOP: 112px"
				runat="server" Width="178px" Height="26px" ImageUrl=".\imgs\tab_button_l.jpg"></asp:ImageButton></form>
	</body>
</HTML>
