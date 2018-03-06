<%@ Control Language="VB" AutoEventWireup="false" CodeFile="omnohdun.ascx.vb" Inherits="omnohdun" %>
<asp:datagrid id="DataGrid1" OnItemDataBound="Item_Bound" ShowFooter="True" Width="100%" runat="server"
	AutoGenerateColumns="False" HeaderStyle-BackColor="#CCCCCC">
	<HeaderStyle BackColor="#CCCCCC"></HeaderStyle>
	<Columns>
		<asp:BoundColumn DataField="U0364EE" HeaderText="Хич.код"></asp:BoundColumn>
		<asp:BoundColumn DataField="U035DD" HeaderText="Нэр"></asp:BoundColumn>
		<asp:BoundColumn DataField="U035EE" HeaderText="Кр.т"></asp:BoundColumn>
		<asp:BoundColumn DataField="U0364KK" HeaderText="Б.оноо"></asp:BoundColumn>
		<asp:BoundColumn DataField="U0364LL" HeaderText="Шал.оноо"></asp:BoundColumn>
		<asp:BoundColumn DataField="niit" HeaderText="Нийт оноо"></asp:BoundColumn>
		<asp:BoundColumn DataField="ALPHA" HeaderText="Vс.vнэлгээ"></asp:BoundColumn>
		<asp:BoundColumn DataField="POINTCH" HeaderText="Чан.оноо"></asp:BoundColumn>
		<asp:BoundColumn DataField="U0364HH" HeaderText="Багш.код"></asp:BoundColumn>
		<asp:BoundColumn DataField="ner" HeaderText="Багшийн нэр"></asp:BoundColumn>
		<asp:BoundColumn Visible="False" DataField="gpa"></asp:BoundColumn>
		<asp:BoundColumn Visible="False" DataField="cred_all"></asp:BoundColumn>
	</Columns>
</asp:datagrid><asp:label id="Label1" runat="server"></asp:label>