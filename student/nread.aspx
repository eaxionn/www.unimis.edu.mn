<%@ Page Language="VB" AutoEventWireup="false" CodeFile="nread.aspx.vb" Inherits="nread" %>
<%@ Register TagPrefix="uc1" TagName="dood" Src="dood.ascx" %>
<%@ Register TagPrefix="uc1" TagName="hichjil" Src="hichjil.ascx" %>
<%@ Register TagPrefix="uc1" TagName="deed" Src="deed.ascx" %>
<%@ Register TagPrefix="uc1" TagName="hicheel" Src="hicheel.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//Dtd XHTML 1.0 transitional//EN" "http://www.w3.org/tr/xhtml1/Dtd/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Мэдээ унших</title>
	<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
	<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1" />
	<meta name="vs_defaultClientScript" content="JavaScript" />
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
	<link href="stylesss.css" rel="stylesheet" type="text/css" />
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1251" />
</head>
<body>
    <form id="Form1" method="post" runat="server">
			<uc1:deed id="Deed1" runat="server"></uc1:deed>
			<table width="1000" border="0" align="center" cellpadding="1" cellspacing="1" style="background-color:#ffffff" id="table1">
				<tr>
					<td style="WIDTH: 184px" valign="top">
						<uc1:hicheel id="Hicheel1" runat="server"></uc1:hicheel>
					</td>
					<td valign="top">
							<table id="table4" cellspacing="0" cellpadding="0" width="95%" align="center" border="0">
								<tr>
									<td><font color="#585858"><strong>Мэдээллийн булан</strong></font></td>
								</tr>
								<tr>
									<td>
										<div align="center">
											<asp:label id="subject" runat="server" font-Bold="true" font-Names="arial, sans-serif" font-Size="10"></asp:label></div>
									</td>
								</tr>
								<tr>
									<td align="right">&nbsp;</td>
								</tr>
								<tr>
									<td valign="top" style="HEIGHT: 19px">
										<div>
											<asp:label id="descrebtion" runat="server" font-Names="arial, sans-serif" font-Size="10"></asp:label></div>
									</td>
								</tr>
								<tr>
									<td valign="top">
										<table id="table2" cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
											<tr>
												<td>
													<table id="table3" cellspacing="0" cellpadding="0" align="right" border="0" width="100%">
                      <tr>
															
                        <td style="width:50%">
<div align="left"><a href='javascript:history.go(-1)'>буцах</a></div></td>
															
                        <td style="width:50%" align="right" > 
                          <asp:Label id="henees" runat="server" font-Bold="true" font-Names="arial,sans-serif" font-Size="10pt"
																	ForeColor="#0000C0"></asp:Label>
																<asp:Label id="ognoo" runat="server" font-Names="arial, sans-serif" font-Size="8" ForeColor="#666666"></asp:Label></td>
													  </tr>
													</table>
												</td>
											</tr>
											
										</table>
										
									</td>
								</tr>
							</table>
						
					</td>
				</tr>
		  </table>
			<uc1:dood id="Dood1" runat="server"></uc1:dood>
		</form>
</body>
</html>
