<%@ Page Language="vb" AutoEventWireup="false" Codebehind="amain.aspx.vb" Inherits="e_testweb.amain" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>АДМИН ЦОНХ</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body background=".\mini\bgimage.gif" MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<asp:imagebutton id="ImageButton1" style="Z-INDEX: 101; LEFT: 32px; POSITION: absolute; TOP: 8px"
				runat="server" Width="48px" Height="48px" ImageUrl=".\mini\exit.gif"></asp:imagebutton>
			<DIV style="DISPLAY: inline; FONT-WEIGHT: normal; FONT-SIZE: xx-small; Z-INDEX: 108; LEFT: 8px; WIDTH: 96px; COLOR: black; FONT-FAMILY: tahoma; POSITION: absolute; TOP: 416px; HEIGHT: 8px"
				align="center" ms_positioning="FlowLayout">Мэдээллэх</DIV>
			<DIV style="DISPLAY: inline; FONT-WEIGHT: normal; FONT-SIZE: xx-small; Z-INDEX: 106; LEFT: 8px; WIDTH: 96px; COLOR: black; FONT-FAMILY: tahoma; POSITION: absolute; TOP: 344px; HEIGHT: 8px"
				align="center" ms_positioning="FlowLayout">Шалгалт</DIV>
			<DIV style="DISPLAY: inline; FONT-WEIGHT: normal; FONT-SIZE: xx-small; Z-INDEX: 104; LEFT: 8px; WIDTH: 96px; COLOR: black; FONT-FAMILY: tahoma; POSITION: absolute; TOP: 272px; HEIGHT: 8px"
				align="center" ms_positioning="FlowLayout">Хэрэглэгч vvсгэх</DIV>
			<asp:imagebutton id="ImageButton2" style="Z-INDEX: 103; LEFT: 32px; POSITION: absolute; TOP: 224px"
				runat="server" Width="48px" Height="48px" ImageUrl=".\mini\addusers.gif"></asp:imagebutton>
			<DIV style="DISPLAY: inline; FONT-WEIGHT: normal; FONT-SIZE: xx-small; Z-INDEX: 102; LEFT: 8px; WIDTH: 96px; COLOR: black; FONT-FAMILY: tahoma; POSITION: absolute; TOP: 56px; HEIGHT: 8px"
				align="center" ms_positioning="FlowLayout">Гарах</DIV>
			<asp:imagebutton id="ImageButton3" style="Z-INDEX: 105; LEFT: 32px; POSITION: absolute; TOP: 296px"
				runat="server" Width="48px" Height="48px" ImageUrl=".\mini\monitoring.gif"></asp:imagebutton><asp:imagebutton id="ImageButton4" style="Z-INDEX: 107; LEFT: 32px; POSITION: absolute; TOP: 368px"
				runat="server" Width="48px" Height="48px" ImageUrl=".\mini\info_sent.gif"></asp:imagebutton>
			<TABLE id="Table1" style="FONT-SIZE: xx-small; Z-INDEX: 109; LEFT: 136px; WIDTH: 852px; COLOR: #404040; FONT-FAMILY: tahoma; POSITION: absolute; TOP: 0px; HEIGHT: 102.54%"
				cellSpacing="1" cellPadding="1" width="852" border="0">
				<TR>
					<TD style="WIDTH: 258px">Системийн удирдагч :
						<asp:label id="Label1" runat="server" Width="136px"></asp:label></TD>
					<TD style="WIDTH: 207px">Хэрэглэгчийн&nbsp;зэрэглэл :
						<asp:label id="Label2" runat="server"></asp:label></TD>
					<td style="WIDTH: 215px"></td>
					<TD style="HEIGHT: 19px" align="right">Он сар едер :
						<asp:label id="Label3" runat="server" Font-Bold="True">05-10-19</asp:label></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 247px" vAlign="top" align="left" colSpan="4"><br>
						<asp:placeholder id="PlaceHolder1" runat="server"></asp:placeholder></TD>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>
