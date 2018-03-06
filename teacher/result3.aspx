<%@ Page Language="VB" AutoEventWireup="false" CodeFile="result3.aspx.vb" Inherits="result3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Багшийн програм</title>
		<META http-equiv="Content-Type" content="text/html; charset=windows-1251">
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bottomMargin="0" leftMargin="0" topMargin="0" rightMargin="0">
    <form id="Form1" method="post" runat="server">
		<p></p>
		<table width="100%"><tr><td width="100px"></td><td>
		<table width="100%" border="0" align="left" cellpadding="1" cellspacing="1" id="table1">
			<tr>
				<td>
					<table id="table2" cellspacing="1" cellpadding="1" width="100%" border="0">
						<tr>
							<td style="width: 250px">
								<P align="left"><asp:label id="Label7" runat="server" Font-Bold="true" Font-Size="14px">ШУТИС</asp:label></P>
							</td>
							<td>
								<P align="right"><asp:label id="hjil" runat="server" Font-Bold="true" Font-Size="14px"></asp:label></P>
							</td>
						</tr>
						<tr>
							<td align="right" colspan="2">
                                <asp:HyperLink ID="Hyper1" runat="server"  NavigateUrl="javascript:history.go(-1)">буцах</asp:HyperLink>
							</td>
						</tr>
						<tr>
							<td align="center" colspan="2"><asp:label id="Label8" runat="server" Font-Bold="true" Font-Size="14px">БАГШИЙН VНЭЛГЭЭНИЙ ХУУДАС</asp:label></td>
						</tr>
						<tr><td colspan="2">&nbsp;</td></tr>
						<tr>
						    <td style="width: 250px; height: 16px"><asp:Label ID="bkod" runat="server" Text="text" Font-Size="14px"></asp:Label></td>
						    <td style="height: 16px"><asp:Label ID="bner" runat="server" Text="Label" Font-Size="14px"></asp:Label></td>
						</tr>
						<tr>
						    <td style="width: 250px"><asp:Label ID="hkod" runat="server" Text="Label" Font-Size="14px"></asp:Label></td>
						    <td><asp:Label ID="hner" runat="server" Text="Label" Font-Size="14px"></asp:Label></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td><br />					    
				    <asp:datagrid id="DataGrid1" runat="server" Width="100%" HorizontalAlign="Center"
					headerStyle-BackColor="#CCCDDB" AutoGenerateColumns="False" >
					<headerStyle BackColor="#CCCDDB" HorizontalAlign="Center"></headerStyle>
					<Columns>
						<asp:TemplateColumn headerText="№">
							<headerStyle HorizontalAlign="Center"></headerStyle>
							<ItemTemplate>
								<div align="center">
									<asp:Label runat="server" Text='<%# cnt%>' OnDataBinding="Increaser" ID="Label1" />
								</div>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:BoundColumn DataField="ovog" HeaderText="Оюутны овог"></asp:BoundColumn>
						<asp:BoundColumn DataField="ner" HeaderText="Оюутны нэр"></asp:BoundColumn>
						<asp:BoundColumn DataField="kod" HeaderText="Оюутны код"></asp:BoundColumn>
						<asp:BoundColumn DataField="onoo" HeaderText="70 оноо" ItemStyle-HorizontalAlign="center"></asp:BoundColumn>							
						<asp:BoundColumn HeaderText="Тусгай тэмдэглэл"></asp:BoundColumn>
					</Columns>
				</asp:datagrid></td>
			</tr>
			<tr>
			    <td><asp:Label ID="Label10" runat="server" Text="Label"></asp:Label></td>                    
			</tr>
			<tr>
			    <td><asp:Label ID="surtoo" runat="server"></asp:Label></td>                    
			</tr>				
			<tr>
			    <td><asp:Label ID="Label16" runat="server" Text="Label">Багийн профессор: &nbsp;&nbsp;&nbsp;&nbsp;....................<br /><br />
			    </asp:Label></td>                    
			</tr>
			<tr>
			    <td><asp:Label ID="Label14" runat="server" Text="Label">Багшийн гарын vсэг: &nbsp;&nbsp;....................<br /><br />
			    </asp:Label></td>                    
			</tr>
			<tr>
			    <td><asp:Label ID="Label15" runat="server" Text="Label">Хянасан сургалтын албаны ажилтны гарын vсэг: &nbsp;&nbsp;....................<br />
			    </asp:Label></td>                    
			</tr>
			<tr><td>&nbsp;</td></tr><tr><td>&nbsp;</td></tr><tr><td>&nbsp;</td></tr>
			<tr>
			    <td><asp:Label ID="ognoo" runat="server" Text="Label"></asp:Label>
                    <p align="right"><asp:Button ID="printt" runat="server" Text="Хэвлэх" OnClientClick="javascript:window.print();" /></p>
			    </td>                    
			</tr>
			<tr>
				<td>
					<P align="right">
                        <asp:HyperLink ID="Hyper2" runat="server" NavigateUrl="javascript:history.go(-1)">буцах</asp:HyperLink>
					</P>
				</td>
			</tr>
		</table>
		</td></tr></table>
	</form>
</body>
</html>
