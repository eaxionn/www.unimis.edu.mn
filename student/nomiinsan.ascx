<%@ Control Language="VB" AutoEventWireup="false" CodeFile="nomiinsan.ascx.vb" Inherits="nomiinsan" %>
<P>
	<table id="table1" cellspacing="0" cellpadding="0" width="165" border="0">
		<tr>
			<td>
				<asp:Image id="Image1" runat="server" ImageUrl="images/book.gif"></asp:Image></td>
		</tr>
		<tr>
			<td align="center">
				<asp:DataGrid id="DataGrid1" ShowHeader="False" GridLines="Horizontal" cssClass="hlink" AutoGenerateColumns="False"
					runat="server">
					<Columns>
						<asp:TemplateColumn HeaderText="Авсан ном">
							<ItemTemplate>
								<asp:Label ID="Label1" runat="server" Text='<%# "/"&DataBinder.Eval(Container, "DataItem.Barcode")&"/ "&DataBinder.Eval(Container, "DataItem.B2") %>'>
								</asp:Label>
							</ItemTemplate>
						</asp:TemplateColumn>
					</Columns>
				</asp:DataGrid></td>
		</tr>
	</table>
</P>