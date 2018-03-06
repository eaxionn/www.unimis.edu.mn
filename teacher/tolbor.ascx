<%@ Control Language="vb" AutoEventWireup="false" Inherits="teacher.tolbor" CodeFile="tolbor.ascx.vb" %>
<div class="div8">
	<div class="div9">
		Телбер</div>
	<div class="div6">
		<asp:DataGrid id="DataGrid1" runat="server" AutoGenerateColumns="False" cssClass="hlink" GridLines="Horizontal"
			Showheader="False">
			<Columns>
				<asp:TemplateColumn>
					<ItemTemplate>
						<a href='' class="dt">
							<asp:Label runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.nname") %>' ID="Label1" >
							</asp:Label></a>
					</ItemTemplate>
				</asp:TemplateColumn>
			</Columns>
		</asp:DataGrid></div>
</div>
