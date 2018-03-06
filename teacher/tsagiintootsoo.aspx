<%@ Page Language="vb" AutoEventWireup="false" Inherits="teacher.tsagiintootsoo" CodeFile="tsagiintootsoo.aspx.vb" %>
<!DOCTYPE html PUBLIC "-//W3C//Dtd html 4.0 transitional//EN">
<html>
	<head>
		<title>Цагийн тооцооны хуудас</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</head>
	<body>
		<form id="Form1" method="post" runat="server">
			<table id="table1" cellspacing="1" cellpadding="1" width="100%" border="0">
				<TBODY>
					<tr>
						<td style="WIDTH: 557px"><StrONG>БАГШИЙН СУРГАЛТЫН АЖЛЫН КРЕДИТЫН ТООЦОО</StrONG></td>
						<td align="center"></td>
					</tr>
					<tr>
						<td style="WIDTH: 557px">Багшийн овог нэр:
							<asp:Label id="Label1" runat="server"></asp:Label></td>
						<td>Сургуулийн нэр:
							<asp:Label id="Label4" runat="server"></asp:Label></td>
					</tr>
					<tr>
						<td style="WIDTH: 557px">Багшийн код:
							<asp:Label id="Label2" runat="server"></asp:Label></td>
						<td>Профессорын багийн нэр:
							<asp:Label id="Label5" runat="server"></asp:Label></td>
					</tr>
					<tr>
						<td style="WIDTH: 557px">Албан тушаал:
							<asp:Label id="Label3" runat="server"></asp:Label></td>
						<td>Улирал:
							<asp:Label id="Label6" runat="server"></asp:Label></td>
					</tr>
					<tr>
						<td style="WIDTH: 557px">Ачаалал/кр/:сургалтын ажлын__бvтээлч ажлын__бvгд</td>
						<td align="right">200..../200.....оны хичээлийн жил</td>
					</tr>
				</TBODY>
			</table>
			<asp:table id="table1" runat="server" BorderStyle="Solid" BorderWidth="1px" Width="208px" Height="372px"
				GridLines="Both" HorizontalAlign="Center" cellpadding="0" cellspacing="0" BorderColor="Black">
				<asp:tableRow>
					<asp:tableCell RowSpan="3" Text="№"></asp:tableCell>
					<asp:tableCell RowSpan="3" Text="Хичээлийн&lt;br/&gt; код"></asp:tableCell>
					<asp:tableCell RowSpan="3" Text="Хичээлийн&lt;br/&gt; нэр"></asp:tableCell>
					<asp:tableCell RowSpan="3" Text="коэф&lt;br/&gt;фицие&lt;br/&gt;нт"></asp:tableCell>
					<asp:tableCell RowSpan="3" Text="К&lt;br/&gt;р&lt;br/&gt;е&lt;br/&gt;д&lt;br/&gt;и&lt;br/&gt;т"></asp:tableCell>
					<asp:tableCell RowSpan="3" Text="Оюутны&lt;br/&gt; тоо"></asp:tableCell>
					<asp:tableCell ColumnSpan="23" Text="Сургалтын ажлын кредитын гvйцэтгэл"></asp:tableCell>
					<asp:tableCell RowSpan="3" Text="Сургалтын ажлын нийт кредит"></asp:tableCell>
					<asp:tableCell RowSpan="3" Text="Тайлбар"></asp:tableCell>
				</asp:tableRow>
				<asp:tableRow>
					<asp:tableCell ColumnSpan="6" Text="Лекц"></asp:tableCell>
					<asp:tableCell RowSpan="2" Text="к&lt;br/&gt;р&lt;br/&gt;е&lt;br/&gt;д&lt;br/&gt;и&lt;br/&gt;т"></asp:tableCell>
					<asp:tableCell ColumnSpan="6" Text="Семинар"></asp:tableCell>
					<asp:tableCell RowSpan="2" Text="к&lt;br/&gt;р&lt;br/&gt;е&lt;br/&gt;д&lt;br/&gt;и&lt;br/&gt;т"></asp:tableCell>
					<asp:tableCell ColumnSpan="6" Text="Лаборатори"></asp:tableCell>
					<asp:tableCell RowSpan="2" Text="к&lt;br/&gt;р&lt;br/&gt;е&lt;br/&gt;д&lt;br/&gt;и&lt;br/&gt;т"></asp:tableCell>
					<asp:tableCell RowSpan="2" Text="Тооцох оюутны тоо"></asp:tableCell>
					<asp:tableCell RowSpan="2" Text="30 аас их"></asp:tableCell>
				</asp:tableRow>
				<asp:tableRow>
					<asp:tableCell Text="II"></asp:tableCell>
					<asp:tableCell Text="III"></asp:tableCell>
					<asp:tableCell Text="IY"></asp:tableCell>
					<asp:tableCell Text="Y"></asp:tableCell>
					<asp:tableCell Text="YI"></asp:tableCell>
					<asp:tableCell Text="бvгд"></asp:tableCell>
					<asp:tableCell Text="II"></asp:tableCell>
					<asp:tableCell Text="III"></asp:tableCell>
					<asp:tableCell Text="IY"></asp:tableCell>
					<asp:tableCell Text="Y"></asp:tableCell>
					<asp:tableCell Text="YI"></asp:tableCell>
					<asp:tableCell Text="бvгд"></asp:tableCell>
					<asp:tableCell Text="II"></asp:tableCell>
					<asp:tableCell Text="III"></asp:tableCell>
					<asp:tableCell Text="IY"></asp:tableCell>
					<asp:tableCell Text="Y"></asp:tableCell>
					<asp:tableCell Text="YI"></asp:tableCell>
					<asp:tableCell Text="бvгд"></asp:tableCell>
				</asp:tableRow>
			</asp:table>
			<table id="table2" cellspacing="1" cellpadding="1" width="100%" border="0">
				<TBODY>
					<tr>
						<td style="HEIGHT: 30px"></td>
					</tr>
					<tr>
						<td>Багш таны гvйцэтгэсэн сургалын ажлын.......кр,бvтээлч 
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
				</TBODY>
			</table>
		</form>
	</body>
</html>
