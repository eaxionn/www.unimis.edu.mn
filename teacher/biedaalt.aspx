﻿<%@ Page Language="vb" AutoEventWireup="false" Inherits="teacher.biedaalt" CodeFile="biedaalt.aspx.vb" %>
<%@ Register TagPrefix="uc1" TagName="zaahlesson" Src="zaahlesson.ascx" %>
<%@ Register TagPrefix="uc1" TagName="deed" Src="deed.ascx" %>
<%@ Register TagPrefix="uc1" TagName="dood" Src="dood.ascx" %>
<html>
	<head>
		<title>Багшийн програм</title>
		<script language="JavaScript" src="key.js">	</script>
		<script language="JavaScript">	
function showblank1(val)
{window.open('sbichig.aspx?lesscode='+val, 'batkhuu', 'width=1000, height=500, menubar=yes, resizable=yes,scrollbars=yes');
}								
//-->
		</script>
		<META http-equiv="Content-Type" content="text/html; charset=utf-8">
		<style type="text/css" media="screen">@import url( cssreciaspx.css ); .style6 { COLOR: #595959; FONT-FAMILY: arial, verdana, helvetica, sans-serif }
	A:link { COLOR: #ffffff }
	A:visited { COLOR: #cccccc }
	A:hover { COLOR: #ffffff }
	A:active { COLOR: #ffffff }
		</style>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<script language="JavaScript" type="text/JavaScript">
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);
//-->
		</script>
	</head>
	<body onkeypress="keydowned2()" bottomMargin="0" leftMargin="0" topMargin="0" rightMargin="0">
		<form id="Form1" method="post" runat="server">
			<table id="table1" style="WIDTH: 780px; HEIGHT: 53px" cellspacing="0" cellpadding="0" width="780"
				align="center" border="0">
				<tr>
					<td style="HEIGHT: 6px"><uc1:deed id="Deed1" runat="server"></uc1:deed></td>
				</tr>
				<tr>
					<td valign="top">
						<table id="table2" cellspacing="0" cellpadding="0" width="100%" border="0">
							<tr>
								<td valign="top" width="150"><uc1:zaahlesson id="Zaahlesson1" runat="server"></uc1:zaahlesson></td>
								<td valign="top">
									<table id="table3" cellspacing="1" cellpadding="1" width="100%" border="0">
										<tr>
											<td><asp:label id="Label2" runat="server"></asp:label></td>
											<td align="right"><asp:hyperlink id="Hyperlink1" runat="server">буцах</asp:hyperlink></td>
										</tr>
									</table>
									<table id="table4" cellspacing="1" cellpadding="1" border="0">
										<tr>
											<td bgColor="#f0f0f0">Долоо хоног</td>
											<td>Сэдэв бvлэг хэсэг</td>
											<td>Оноо</td>
										</tr>
										<tr>
											<td bgColor="#f0f0f0">5</td>
											<td><asp:textbox id="TextBox1" runat="server" Width="346px" Height="80px" TextMode="MultiLine"></asp:textbox></td>
											<td><asp:textbox id="onoo1" runat="server" Width="64px"></asp:textbox></td>
										</tr>
										<tr>
											<td bgColor="#f0f0f0">6</td>
											<td><asp:textbox id="TextBox2" runat="server" Width="346px" Height="80px" TextMode="MultiLine"></asp:textbox></td>
											<td><asp:textbox id="onoo2" runat="server" Width="64px"></asp:textbox></td>
										</tr>
										<tr>
											<td bgColor="#f0f0f0">7</td>
											<td><asp:textbox id="TextBox3" runat="server" Width="346px" Height="80px" TextMode="MultiLine"></asp:textbox></td>
											<td><asp:textbox id="onoo3" runat="server" Width="64px"></asp:textbox></td>
										</tr>
										<tr>
											<td bgColor="#f0f0f0">8</td>
											<td><asp:textbox id="TextBox4" runat="server" Width="346px" Height="80px" TextMode="MultiLine"></asp:textbox></td>
											<td><asp:textbox id="onoo4" runat="server" Width="64px"></asp:textbox></td>
										</tr>
										<tr>
											<td bgColor="#f0f0f0">9</td>
											<td><asp:textbox id="TextBox5" runat="server" Width="346px" Height="80px" TextMode="MultiLine"></asp:textbox></td>
											<td><asp:textbox id="onoo5" runat="server" Width="64px"></asp:textbox></td>
										</tr>
										<tr>
											<td bgColor="#f0f0f0">10</td>
											<td><asp:textbox id="TextBox6" runat="server" Width="346px" Height="80px" TextMode="MultiLine"></asp:textbox></td>
											<td><asp:textbox id="onoo6" runat="server" Width="64px"></asp:textbox></td>
										</tr>
										<tr>
											<td bgColor="#f0f0f0">11</td>
											<td><asp:textbox id="TextBox7" runat="server" Width="346px" Height="80px" TextMode="MultiLine"></asp:textbox></td>
											<td><asp:textbox id="onoo7" runat="server" Width="64px"></asp:textbox></td>
										</tr>
										<tr>
											<td bgColor="#f0f0f0">12</td>
											<td><asp:textbox id="TextBox8" runat="server" Width="346px" Height="80px" TextMode="MultiLine"></asp:textbox></td>
											<td><asp:textbox id="onoo8" runat="server" Width="64px"></asp:textbox></td>
										</tr>
										<tr>
											<td bgColor="#f0f0f0">13</td>
											<td><asp:textbox id="TextBox9" runat="server" Width="346px" Height="80px" TextMode="MultiLine"></asp:textbox></td>
											<td><asp:textbox id="onoo9" runat="server" Width="64px"></asp:textbox></td>
										</tr>
										<tr>
											<td bgColor="#f0f0f0">14</td>
											<td><asp:textbox id="TextBox10" runat="server" Width="346px" Height="80px" TextMode="MultiLine"></asp:textbox></td>
											<td><asp:textbox id="onoo10" runat="server" Width="64px"></asp:textbox></td>
										</tr>
										<tr>
											<td bgColor="#f0f0f0">15</td>
											<td><asp:textbox id="TextBox11" runat="server" Width="346px" Height="80px" TextMode="MultiLine"></asp:textbox></td>
											<td><asp:textbox id="onoo11" runat="server" Width="64px"></asp:textbox></td>
										</tr>
										<tr>
											<td bgColor="#f0f0f0">16</td>
											<td><asp:textbox id="TextBox12" runat="server" Width="346px" Height="80px" TextMode="MultiLine"></asp:textbox></td>
											<td><asp:textbox id="onoo12" runat="server" Width="64px"></asp:textbox></td>
										</tr>
										<tr>
											<td bgColor="#f0f0f0"></td>
											<td align="right"><asp:button id="Button1" runat="server" Text="Бvртгэх"></asp:button></td>
											<td></td>
										</tr>
									</table>
									<asp:label id="Label1" runat="server" ForeColor="Red"></asp:label></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td><uc1:dood id="Dood1" runat="server"></uc1:dood></td>
				</tr>
			</table>
		</form>
	</body>
</html>
