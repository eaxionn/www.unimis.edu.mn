<%@ Control Language="vb" AutoEventWireup="false" Codebehind="admin_create_list.ascx.vb" Inherits="e_testweb.admin_create_list" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<P>
	<TABLE id="Table1" height="100%" cellSpacing="0" cellPadding="0" width="100%" border="0">
		<TR>
			<TD>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<asp:Button id="Button1" runat="server" BorderColor="#6B696B" BorderWidth="1px" BackColor="#6B696B"
					Font-Names="Tahoma" Font-Size="8pt" ForeColor="White" Text="Шинээр vvсгэх" Height="24px"></asp:Button><br>
				<br>
			</TD>
		</TR>
		<TR>
			<TD vAlign="top" align="center"><asp:datagrid id="DataGrid1" BorderStyle="None" ForeColor="Black" PageSize="15" GridLines="Vertical"
					AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" Font-Size="7pt" Font-Names="Tahoma" Width="95%" CellPadding="4"
					BackColor="White" BorderWidth="1px" BorderColor="#DEDFDE" runat="server">
					<SelectedItemStyle Font-Bold="True" ForeColor="White" BackColor="#CE5D5A"></SelectedItemStyle>
					<AlternatingItemStyle BackColor="White"></AlternatingItemStyle>
					<ItemStyle BackColor="#F7F7DE"></ItemStyle>
					<HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#6B696B"></HeaderStyle>
					<FooterStyle BackColor="#CCCC99"></FooterStyle>
					<Columns>
						<asp:BoundColumn DataField="T008A" HeaderText="Ш/дугаар">
							<HeaderStyle Width="5%"></HeaderStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="T008B" HeaderText="Хич. код">
							<HeaderStyle Width="10%"></HeaderStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="U035DD" HeaderText="Хичээлийн нэр">
							<HeaderStyle Width="26%"></HeaderStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="T008K" HeaderText="Шалгалтын нэр">
							<HeaderStyle Width="25%"></HeaderStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="ner" HeaderText="Багшийн нэр, код">
							<HeaderStyle Width="15%"></HeaderStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="hugatsaa" HeaderText="Ш. хугацаа">
							<HeaderStyle Width="9%"></HeaderStyle>
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
				</asp:datagrid></TD>
		</TR>
	</TABLE>
</P>
