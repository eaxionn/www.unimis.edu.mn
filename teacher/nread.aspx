<%@ Register TagPrefix="uc1" TagName="zaahlesson" Src="zaahlesson.ascx" %>
<%@ Register TagPrefix="uc1" TagName="deed" Src="deed.ascx" %>
<%@ Register TagPrefix="uc1" TagName="dood" Src="dood.ascx" %>
<%@ Register TagPrefix="uc1" TagName="nomiinsan" Src="nomiinsan.ascx" %>
<%@ Page Language="vb" AutoEventWireup="false" Inherits="teacher.nread" CodeFile="nread.aspx.vb" %>
<html>
	<head>
		<title>Багшийн програм</title>
		<style type="text/css" media="screen">@import url( cssreciaspx.css ); 
		</style>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</head>
	<body bottomMargin="0" leftMargin="0" topMargin="0" rightMargin="0">
		<form id="Form1" method="post" runat="server">
			<table id="table1" style="HEIGHT: 53px" cellspacing="0" cellpadding="0" width="1020" align="center"
				border="1">
				<tr>
					<td style="HEIGHT: 6px"><uc1:deed id="Deed1" runat="server"></uc1:deed></td>
				</tr>
				<tr>
					<td valign="top">
						<table id="table2" cellspacing="0" cellpadding="0" width="100%" border="1">
							<tr>
								<td valign="top" width="130"><uc1:zaahlesson id="Zaahlesson1" runat="server"></uc1:zaahlesson></td>
								<td valign="top">
									<table id="table3" cellspacing="0" cellpadding="0" width="95%" align="center" border="0">
										<tr>
											<td>Мэдээ унших
											</td>
										</tr>
										<tr>
											<td>
												<DIV align="center">
													<asp:label id="subject" runat="server" Font-Size="10" Font-Names="arial, sans-serif" Font-Bold="true"></asp:label></DIV>
											</td>
										</tr>
										<tr>
											<td align="right">&nbsp;</td>
										</tr>
										<tr>
											<td valign="top">
												<DIV align="justify">
													<asp:hyperlink id="Hyperlink2" runat="server" Target="_blank">
														<asp:Image id="Image1" runat="server" Height="150px" ImageAlign="Left" Visible="False" onclick='showimage()'></asp:Image>
													</asp:hyperlink>
													<asp:label id="descrebtion" runat="server" Font-Size="10" Font-Names="arial, sans-serif"></asp:label></DIV>
											</td>
										</tr>
										<tr>
											<td valign="top">
												<table id="table4" cellspacing="0" cellpadding="0" width="95%" align="center" border="0">
													<tr>
														<td><A href="javascript:history.go(-1)">буцах</A></td>
														<td>
															<table id="table5" cellspacing="0" cellpadding="0" align="right" border="0">
																<tr>
																	<td><IMG src="images/a_ugol.gif"></td>
																	<td noWrap bgColor="#f2f2f2">
																		<asp:Label id="henees" runat="server" ForeColor="#0000C0" Font-Size="10pt" Font-Names="arial,sans-serif"
																			Font-Bold="true"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																		<asp:Label id="ognoo" runat="server" ForeColor="#666666" Font-Size="10" Font-Names="arial, sans-serif"></asp:Label></td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
												<DIV align="right"></DIV>
											</td>
										</tr>
									</table>
								</td>
								<td valign="top" width="100"><uc1:nomiinsan id="Nomiinsan1" runat="server"></uc1:nomiinsan></td>
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
