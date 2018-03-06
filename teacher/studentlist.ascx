<%@ Control Language="VB" AutoEventWireup="false" CodeFile="studentlist.ascx.vb" Inherits="studentlist" %>
<table>
<tr><td style="width: 400px">
<asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" GridLines="Both"
    Width="400px" AllowPaging="True" PageSize="30">
    <Columns>
        <asp:TemplateColumn headerText="¹">
			<headerStyle HorizontalAlign="Center"></headerStyle>
			<ItemTemplate>
			<asp:Label id="cnt" runat="server" OnDataBinding="Increaser" Text="<%# cnt%>">
			</asp:Label>
			</ItemTemplate>
	    </asp:TemplateColumn>
        <asp:BoundColumn DataField="studentID" HeaderText="Îþóòíû êîä">
            <ItemStyle HorizontalAlign="Center" />
            <HeaderStyle Font-Bold="True" />
        </asp:BoundColumn>
        <asp:BoundColumn DataField="studentName" HeaderText="Îþóòíû íýð">
            <ItemStyle HorizontalAlign="Center" />
            <HeaderStyle Font-Bold="True" />
        </asp:BoundColumn>
    </Columns>
    <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
    <PagerStyle Mode="NumericPages" HorizontalAlign="Center" />
</asp:DataGrid>
</td></tr>
<tr><td style="width: 400px" align="center">
<asp:Button ID="Button1" runat="server" Text="Õýâëýõ" />
</td></tr>
</table>


