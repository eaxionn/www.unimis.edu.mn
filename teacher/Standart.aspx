<%@ Register TagPrefix="uc1" TagName="huvaari" Src="huvaari.ascx" %>
<%@ Page Language="vb" AutoEventWireup="false" Inherits="teacher.Standart" validaterequest="false" CodeFile="Standart.aspx.vb" %>
<%@ Register TagPrefix="uc1" TagName="myinfo" Src="myinfo.ascx" %>
<%@ Register TagPrefix="uc1" TagName="tsalin" Src="tsalin.ascx" %>
<%@ Register TagPrefix="uc1" TagName="nuutsug" Src="nuutsug.ascx" %>
<%@ Register TagPrefix="uc1" TagName="dood" Src="dood.ascx" %>
<%@ Register TagPrefix="uc1" TagName="deed" Src="deed.ascx" %>
<%@ Register TagPrefix="uc1" TagName="zaahlesson" Src="zaahlesson.ascx" %>
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
			<table id="table1" cellspacing="0" cellpadding="0" width="937" align="center" border="0">
				<tr>
					<td style="HEIGHT: 6px">
						<uc1:deed id="Deed1" runat="server"></uc1:deed></td>
				</tr>
				<tr>
					<td valign="top">
						<table id="table2" cellspacing="0" cellpadding="0" width="100%" border="0">
							<tr>
								<td valign="top" width="150">
									<uc1:zaahlesson id="Zaahlesson1" runat="server"></uc1:zaahlesson>
									<uc1:huvaari id="Huvaari1" runat="server"></uc1:huvaari></td>
								<td valign="top">Хичээлийн стандарт
									<table id="table3" cellspacing="1" cellpadding="1" width="300" border="0">
										<tr>
											<td><StrONG>Нэр :</StrONG></td>
											<td><asp:label id="Label1" runat="server" Font-Bold="true"></asp:label></td>
										</tr>
										<tr>
											<td><StrONG>Код :</StrONG></td>
											<td><asp:label id="Label2" runat="server" Font-Bold="true"></asp:label></td>
										</tr>
									</table>
									Хичээлийн тухай
									<table id="table5" cellspacing="1" cellpadding="1" width="100%" border="0">
										<tr>
											<td align="right">
												<table id="table4" cellspacing="1" cellpadding="1" border="0">
													<tr>
														<td bgColor="#f0f0f0">Хичээлийн зорилго
														</td>
													</tr>
													<tr>
														<td>
															<asp:textbox id="TextBox1" runat="server" Width="346px" Height="160px" TextMode="MultiLine"></asp:textbox></td>
													</tr>
													<tr>
														<td bgColor="#f0f0f0">Оюутанд олгох мэдлэг
														</td>
													</tr>
													<tr>
														<td>
															<asp:textbox id="TextBox2" runat="server" Width="346px" Height="160px" TextMode="MultiLine"></asp:textbox></td>
													</tr>
													<tr>
														<td bgColor="#f0f0f0">Чадвар
														</td>
													</tr>
													<tr>
														<td>
															<asp:textbox id="TextBox3" runat="server" Width="346px" Height="160px" TextMode="MultiLine"></asp:textbox></td>
													</tr>
													<tr>
														<td bgColor="#f0f0f0">Дадал</td>
													</tr>
													<tr>
														<td>
															<asp:textbox id="TextBox4" runat="server" Width="346px" Height="160px" TextMode="MultiLine"></asp:textbox></td>
													</tr>
													<tr>
														<td><asp:button id="Button6" runat="server" Text="Бvртгэх"></asp:button><asp:label id="Label3" runat="server" ForeColor="Red"></asp:label></td>
													</tr>
												</table>
											</td>
											<td valign="top" bgColor="#f0f0f0"><asp:button id="Button1" runat="server" Width="120px" Text="Сурах бичиг"></asp:button><br/>
												<asp:button id="Button2" runat="server" Width="120px" Text="Бие даалт"></asp:button><br/>
												<asp:button id="Button3" runat="server" Width="120px" Text="Лекц"></asp:button><br/>
												<asp:button id="Button4" runat="server" Width="120px" Text="Семинар"></asp:button><br/>
												<asp:button id="Button5" runat="server" Width="120px" Text="Лаборатори"></asp:button></td>
										</tr>
									</table>
								</td>
								<td class="hlink" valign="top" width="130">
									<uc1:myinfo id="Myinfo1" runat="server"></uc1:myinfo>
									<uc1:tsalin id="Tsalin1" runat="server"></uc1:tsalin>
									<uc1:nuutsug id="Nuutsug1" runat="server"></uc1:nuutsug></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<uc1:dood id="Dood1" runat="server"></uc1:dood></td>
				</tr>
			</table>
		</form>
	</body>
</html>
