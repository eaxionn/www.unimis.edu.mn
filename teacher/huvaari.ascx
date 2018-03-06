<%@ Control Language="vb" AutoEventWireup="false" Inherits="teacher.huvaari" CodeFile="huvaari.ascx.vb" %>
<%@ Register TagPrefix="uc1" TagName="huvaari1" Src="huvaari1.ascx" %>
<link href="web_default.css" type="text/css" rel="stylesheet">
<table style="WIDTH: 199px" cellspacing="0" cellpadding="0" width="199" border="0">
	<tr style="WIDTH: 199px; HEIGHT: 34px">
		<td background="images\teacher_new_16.png"></td>
	</tr>
	<tr style="WIDTH: 199px">
		<td bgColor="#e1f0f7">
            <asp:DataGrid ID="Datagrid1" runat="server" AutoGenerateColumns="False" GridLines="None"
                Width="100%">
                <Columns>
                    <asp:TemplateColumn HeaderText="¹">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemTemplate>
                            <div align="center">
                                <asp:Label ID="cnt" runat="server" Font-Size="9" OnDataBinding="Increaser" Text='<%# cnt%>'></asp:Label>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    	<asp:TemplateColumn headerText="Õè÷ýýë">
						<ItemTemplate>
							<a href='TsagiinHuviarNers.aspx?lesscode=<%# DataBinder.Eval(Container, "DataItem.LESSON_KOD") %>&huvaariID=<%# DataBinder.Eval(Container, "DataItem.id") %>&ltype=<%# DataBinder.Eval(Container, "DataItem.LESSON_TYPE") %>&page=2' class="link">
								<asp:Label runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.LESSON_KOD") %>' ID="Label1">
								</asp:Label>
							</a>
						</ItemTemplate>
					</asp:TemplateColumn>
                    <asp:BoundColumn DataField="LTYPE" ItemStyle-HorizontalAlign="Center" HeaderText="Õýëáýð"></asp:BoundColumn>
                    <asp:BoundColumn DataField="LTIME" HeaderText="Öàã"></asp:BoundColumn>
                </Columns>
                <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
            </asp:DataGrid></td>
	</tr>
</table>
<br//>
<br/>
