<%@ Page Language="VB" AutoEventWireup="false" CodeFile="login.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Холбогдох</title>
    <style type="text/css" media="screen"> @import url( cssreciaspx.css );  </style>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1251" />
	<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR" />
	<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE" />
	<meta content="JavaScript" name="vs_defaultClientScript" />
	<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema" />
	<link href="style.css" rel="stylesheet" type="text/css" />
	<style type="text/css"> .style1 { COLOR: #ffffff } </style>
</head>
<body bottomMargin="0" leftMargin="0" topMargin="0" rightMargin="0">
    <form id="Form2" method="post" runat="server">
			<table cellpadding="0" cellspacing="0" border="0" align="center">
				<tr>
					<td height="120"></td>
				</tr>
				<tr>
					<td valign="top"><img src=".\images\left.jpg"></td>
					<td valign="top" background=".\images\right.jpg" width="268" height="342">
						<P>&nbsp;</P>
						<P>&nbsp;</P>
						<asp:Label id="Label1" runat="server" Width="112px"></asp:Label>
						<table width="245" height="32" border="0" cellpadding="0" cellspacing="1" style="WIDTH: 245px; HEIGHT: 32px">
							<tr>
								<td valign="middle" align="right" style="WIDTH: 99px; COLOR: #3697b7">
									Оюутны код&nbsp;:
								</td>
								<td style="HEIGHT: 20px">
									<asp:textbox id="TextBox1" runat="server" CssClass="button" MaxLength="25" BorderWidth="1" Width="125px"
										BorderColor="DarkGray"></asp:textbox></td>
							</tr>
							<tr>
								<td height="19" style="WIDTH: 99px; COLOR: #3697b7; HEIGHT: 19px" vAlign="middle" align="right">
									Нууц vг :
								</td>
								<td height="19" style="HEIGHT: 19px">
									<asp:textbox id="TextBox2" runat="server" CssClass="button" MaxLength="25" BorderWidth="1" Width="125px"
										TextMode="Password" BorderColor="DarkGray"></asp:textbox></td>
							</tr>
							<tr>
								<td style="WIDTH: 99px; HEIGHT: 17px">
								</td>
								<td style="HEIGHT: 17px">
									<div align="left">
										<asp:button id="Button1" runat="server" Text="Нэвтрэх" Font-Size="8pt" CssClass="button" BackColor="#C1DCFA"
											Height="18px" BorderWidth="1" BorderColor="DarkGray" ForeColor="#3697B7" BorderStyle="Solid"
											Font-Names="tahoma"></asp:button>
									</div>
								</td>
							</tr>	
							<tr><td colspan="2">&nbsp;</td></tr>
							<tr><td colspan="2" align="center" >&nbsp;<asp:Label ID="Label2" ForeColor="red" runat="server" Text="Хичээл сонголт1 3сарын 22-оос 29-ны хооронд явагдана."></asp:Label>
                            </td></tr>	
							<tr><td colspan="2" align="center" >&nbsp;<asp:Label ID="Label3" ForeColor="red" runat="server" Text="Сонголт 1-ээс хоцорсон оюутнууд сонголт2 хийх боломжгїй."></asp:Label>
                            </td></tr>																	
							</table>
					</td>
				</tr>
			</table>			
		</form>    
</body>
</html>
