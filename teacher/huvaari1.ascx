<%@ Control Language="vb" AutoEventWireup="false" Inherits="teacher.huvaari1" CodeFile="huvaari1.ascx.vb" %>
<asp:datagrid id="DataGrid1" runat="server" AutoGenerateColumns="False" GridLines="None" Width="100%">
	<Columns>
		<asp:TemplateColumn headerText="¹">
			<headerStyle HorizontalAlign="Center"></headerStyle>
			<ItemTemplate>
				<div align="center">
					<asp:Label id="cnt" runat="server" Font-Size="9" Text='<%# cnt%>' OnDataBinding="Increaser"/>
				</div>
			</ItemTemplate>
		</asp:TemplateColumn>
		<asp:BoundColumn DataField="LESSON_KOD" headerText="Õè÷ýýë"></asp:BoundColumn>
		<asp:BoundColumn DataField="LESSON_TYPE" headerText="Öàã"></asp:BoundColumn>
	</Columns>
</asp:datagrid>
