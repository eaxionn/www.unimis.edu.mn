<%@ Control Language="VB" AutoEventWireup="false" CodeFile="omnohdun.ascx.vb" Inherits="omnohdun" %>
<asp:datagrid id="DataGrid1" OnItemDataBound="Item_Bound" ShowFooter="True" Width="100%" runat="server"
	AutoGenerateColumns="False" HeaderStyle-BackColor="#CCCCCC">
	<HeaderStyle BackColor="#CCCCCC"></HeaderStyle>
	<Columns>
		<asp:BoundColumn DataField="U0364EE" HeaderText="���.���"></asp:BoundColumn>
		<asp:BoundColumn DataField="U035DD" HeaderText="���"></asp:BoundColumn>
		<asp:BoundColumn DataField="U035EE" HeaderText="��.�"></asp:BoundColumn>
		<asp:BoundColumn DataField="U0364KK" HeaderText="�.����"></asp:BoundColumn>
		<asp:BoundColumn DataField="U0364LL" HeaderText="���.����"></asp:BoundColumn>
		<asp:BoundColumn DataField="niit" HeaderText="���� ����"></asp:BoundColumn>
		<asp:BoundColumn DataField="ALPHA" HeaderText="V�.v������"></asp:BoundColumn>
		<asp:BoundColumn DataField="POINTCH" HeaderText="���.����"></asp:BoundColumn>
		<asp:BoundColumn DataField="U0364HH" HeaderText="����.���"></asp:BoundColumn>
		<asp:BoundColumn DataField="ner" HeaderText="������� ���"></asp:BoundColumn>
		<asp:BoundColumn Visible="False" DataField="gpa"></asp:BoundColumn>
		<asp:BoundColumn Visible="False" DataField="cred_all"></asp:BoundColumn>
	</Columns>
</asp:datagrid><asp:label id="Label1" runat="server"></asp:label>