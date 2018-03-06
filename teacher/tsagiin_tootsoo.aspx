<%@ Reference Page="~/tsagiintootsoo.aspx" %>
<%@ Page Language="vb" AutoEventWireup="false" Inherits="teacher.tsagiin_tootsoo" CodeFile="tsagiin_tootsoo.aspx.vb" %>
<!DOCTYPE html PUBLIC "-//W3C//Dtd html 4.0 transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml" >
	<head>
		<title>tsagiin_tootsoo</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</head>
	<body>
		<form id="Form1" method="post" runat="server">
			<table id="table1" cellspacing="1" cellpadding="1" width="100%" border="0">
				<tr>
					<td style="WIDTH: 557px"><StrONG>БАГШИЙН СУРГАЛТЫН АЖЛЫН КРЕДИТЫН ТООЦОО</StrONG></td>
					<td></td>
				</tr>
				<tr>
					<td style="WIDTH: 557px">Багшийн овог нэр:</td>
					<td></td>
				</tr>
				<tr>
					<td style="WIDTH: 557px">Багшийн код:</td>
					<td>Сургуулийн нэр:</td>
				</tr>
				<tr>
					<td style="WIDTH: 557px">Албан тушаал:</td>
					<td>Профессорын багийн нэр:</td>
				</tr>
				<tr>
					<td style="WIDTH: 557px">Ачаалал/кр/:сургалтын ажлын__бvтээлч ажлын__бvгд</td>
					<td align="right">200..../200.....оны хичээлийн жил</td>
				</tr>
			</table>
			<asp:DataGrid id="DataGrid1" runat="server" AutoGenerateColumns="False">
				<Columns>
					<asp:BoundColumn DataField="num" headerText="№"></asp:BoundColumn>
					<asp:BoundColumn DataField="lcode" headerText="Х/код"></asp:BoundColumn>
					<asp:BoundColumn DataField="lname" headerText="Х/нэр"></asp:BoundColumn>
					<asp:BoundColumn DataField="kredit" headerText="Кредит"></asp:BoundColumn>
					<asp:BoundColumn DataField="koef" headerText="Коэффициент"></asp:BoundColumn>
					<asp:BoundColumn DataField="le_sar8" headerText="8"></asp:BoundColumn>
					<asp:BoundColumn DataField="le_sar9" headerText="9"></asp:BoundColumn>
					<asp:BoundColumn DataField="le_sar10" headerText="10"></asp:BoundColumn>
					<asp:BoundColumn DataField="le_sar11" headerText="11"></asp:BoundColumn>
					<asp:BoundColumn DataField="le_sar12" headerText="12"></asp:BoundColumn>
					<asp:BoundColumn DataField="le_sumtsag" headerText="бvгд"></asp:BoundColumn>
					<asp:BoundColumn DataField="le_sumkr" headerText="кредит"></asp:BoundColumn>
					<asp:BoundColumn DataField="se_sar8" headerText="8"></asp:BoundColumn>
					<asp:BoundColumn DataField="se_sar9" headerText="9"></asp:BoundColumn>
					<asp:BoundColumn DataField="se_sar10" headerText="10"></asp:BoundColumn>
					<asp:BoundColumn DataField="se_sar11" headerText="11"></asp:BoundColumn>
					<asp:BoundColumn DataField="se_sar12" headerText="12"></asp:BoundColumn>
					<asp:BoundColumn DataField="se_sumtsag" headerText="бvгд"></asp:BoundColumn>
					<asp:BoundColumn DataField="se_sumkr" headerText="кредит"></asp:BoundColumn>
					<asp:BoundColumn DataField="la_sar8" headerText="8"></asp:BoundColumn>
					<asp:BoundColumn DataField="la_sar9" headerText="9"></asp:BoundColumn>
					<asp:BoundColumn DataField="la_sar10" headerText="10"></asp:BoundColumn>
					<asp:BoundColumn DataField="la_sar11" headerText="11"></asp:BoundColumn>
					<asp:BoundColumn DataField="la_sar12" headerText="12"></asp:BoundColumn>
					<asp:BoundColumn DataField="la_sumtsag" headerText="бvгд"></asp:BoundColumn>
					<asp:BoundColumn DataField="la_sumkr" headerText="кредит"></asp:BoundColumn>
					<asp:BoundColumn DataField="t_oyut_too" headerText="ТО тоо"></asp:BoundColumn>
					<asp:BoundColumn DataField="zoruu30" headerText="30-аас дээш"></asp:BoundColumn>
					<asp:BoundColumn DataField="sur_kr" headerText="СУН кредит"></asp:BoundColumn>
					<asp:BoundColumn DataField="tailbar" headerText="Тайлбар"></asp:BoundColumn>
				</Columns>
			</asp:DataGrid>
			<table id="table2" cellspacing="1" cellpadding="1" width="100%" border="0">
				<tr>
					<td>Багш таны гvйцэтгэсэн сургалын ажлын.......кр,бvтеелч 
						ажлын.........кр,бvгд.........кредит цагийг хянаж,ноогдлоос давуулан 
						биелvvлсэн/дутсан/..............кредит цагийн хелсийг олгохоор /суутгахаар/ 
						шийдвэрлэв.Ээлжийн амралт ажлын .............. хоног.</td>
				</tr>
				<tr>
					<td>Тооцоог хийсэн 
						профессор:_____________________&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						Зевшеерсен багш:__________________</td>
				</tr>
				<tr>
					<td align="center">Хянасан дэд захирал:__________________________</td>
				</tr>
			</table>
		</form>
	</body>
</html>
