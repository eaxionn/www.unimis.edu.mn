<%@ Control Language="vb" AutoEventWireup="false" Inherits="teacher.zaahlesson" CodeFile="zaahlesson.ascx.vb" %>
<link href="web_default.css" rel="stylesheet" type="text/css" />
<table style="WIDTH: 199px" cellspacing="0" cellpadding="0" width="199" border="0">
	<tr style="WIDTH: 199px; HEIGHT: 34px">
		<td background="images\teacher_new_03.png"></td>
	</tr>
	<tr style="WIDTH: 199px">
		<td align="center"><br/>
			<asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" GridLines="None" Width="189px">
				<Columns>
					<asp:TemplateColumn headerText="Хичээл">
						<ItemTemplate>
							<a href='lesson.aspx?lesscode=<%# DataBinder.Eval(Container, "DataItem.lesscode") %>' class="link">
								<asp:Label runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.lessname") %>' ID="Label1">
								</asp:Label>
							</a>
						</ItemTemplate>
					</asp:TemplateColumn>
				    <asp:BoundColumn ItemStyle-HorizontalAlign="Center" DataField="scount" HeaderText="Оюутны тоо">
				    
				    </asp:BoundColumn>
				</Columns>
                <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
			</asp:DataGrid>
	
		</td>
	</tr>
</table>
<br/>
