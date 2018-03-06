<%@ Page Language="vb" AutoEventWireup="false" Inherits="tem_print" CodeFile="tem_print.aspx.vb" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
	<head>
		<title>СУРГАЛТЫН АЖЛЫН КРЕДИТ</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1"/>
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1"/>
		<meta name="vs_defaultClientScript" content="JavaScript"/>
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5"/>
		<style type="text/css">
		    body {
		        font-family: Tahoma;
	            font-size: 10px;
		    }
		</style>
	</head>
	<body>
		<form id="Form1" method="post" runat="server">
			<b>БАГШИЙН СУРГАЛТЫН АЖЛЫН КРЕДИТ ТООЦОХ ХУУДАС</b><table id="table1" cellspacing="1" cellpadding="1" width="100%" border="0">
				<tr>
					<td style="WIDTH: 203px">Сургуулийн нэр :</td>
					<td>
						<asp:Label id="Label1" runat="server"></asp:Label></td>
				</tr>
				<tr>
					<td style="WIDTH: 203px">Профессорын багийн нэр :</td>
					<td>
						<asp:Label id="Label2" runat="server"></asp:Label></td>
				</tr>
				<tr>
					<td style="WIDTH: 203px">Албан тушаал :</td>
					<td>
						<asp:Label id="Label3" runat="server"></asp:Label></td>
				</tr>
				<tr>
					<td style="WIDTH: 203px">Багшийн код,овог нэр :</td>
					<td>
						<asp:Label id="Label4" runat="server"></asp:Label></td>
				</tr>
				<tr>
					<td style="WIDTH: 203px">Эрдмийн зэрэг,цол :</td>
					<td>
						<asp:Label id="Label5" runat="server"></asp:Label></td>
				</tr>
				<tr>
					<td style="WIDTH: 203px">Хичээлийн код,нэр :</td>
					<td>
						<asp:Label id="Label6" runat="server"></asp:Label></td>
				</tr>
				<tr>
					<td style="WIDTH: 203px">
						<asp:Label id="Label7" runat="server"></asp:Label></td>
					<td></td>
				</tr>
			</table>
			<asp:datagrid id="DataGrid1" runat="server" Width="100%" AutoGenerateColumns="False" ShowFooter="true"
				OnItemDataBound="Item_Bound">
				<headerStyle BackColor="Gainsboro"></headerStyle>
				<Columns>
					<asp:TemplateColumn headerText="№">
						<headerStyle HorizontalAlign="Center"></headerStyle>
						<ItemTemplate>
								<div align="center">
									<asp:Label id="cnt" runat="server" Text='<%# cnt%>' OnDataBinding="Increaser"/>
								</div>
							</ItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn headerText="Сар/едер">
						<ItemTemplate>
							<asp:Label runat="server" Text='<%# format(DataBinder.Eval(Container, "DataItem.ognoo"),"yyyy/M/d") %>' ID="Label1" NAME="Label1">
							</asp:Label>
						</ItemTemplate>
					</asp:TemplateColumn>
					<asp:BoundColumn DataField="too" headerText="Оюутны тоо"></asp:BoundColumn>
					<asp:BoundColumn DataField="sedev" headerText="Хичээлийн сэдэв"></asp:BoundColumn>
					<asp:BoundColumn DataField="lessname" headerText="Хэлбэр"></asp:BoundColumn>
					<asp:BoundColumn DataField="tsag" headerText="Цаг"></asp:BoundColumn>
				</Columns>
			</asp:datagrid>
			<table id="table2" cellspacing="1" cellpadding="1" width="100%" border="0">
				<tr>
					<td style="WIDTH: 573px"></td>
					<td>Тусгай тэмдэглэл :</td>
				</tr>
				<tr>
					<td style="WIDTH: 573px">
						<asp:DataGrid id="DataGrid2" runat="server" OnItemDataBound="Item_Bound1" AutoGenerateColumns="False"
							ShowFooter="true">
							<Columns>
								<asp:BoundColumn DataField="num" headerText="№"></asp:BoundColumn>
								<asp:BoundColumn DataField="hname" headerText="хэлбэр"></asp:BoundColumn>
								<asp:BoundColumn DataField="too" headerText="нийт"></asp:BoundColumn>
								<asp:BoundColumn DataField="tsag" headerText="цаг"></asp:BoundColumn>
								<asp:BoundColumn headerText="кредит"></asp:BoundColumn>
							</Columns>
						</asp:DataGrid></td>
					<td></td>
				</tr>
			</table>
			<table id="table3" cellspacing="1" cellpadding="1" width="100%" border="0">
				<tr>
					<td>Багшийн гарын vсэг :</td>
					<td>Он, сар, едер :</td>
				</tr>
				<tr>
					<td>Гvйцэтгэлийг шалгасан :</td>
					<td>Хянасан :</td>
				</tr>
				<tr>
					<td>Багийн профессор</td>
					<td>Дэд захирал</td>
				</tr>
			</table>
		</form>
	</body>
</html>
