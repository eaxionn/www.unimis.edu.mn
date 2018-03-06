<%@ Page Language="vb" AutoEventWireup="false" Inherits="teacher.WebForm1" CodeFile="login.aspx.vb" %>
<html>
	<head>
		<title>Холбогдох</title>
		<style type="text/css" media="screen">@import url( cssreciaspx.css ); 
		</style>

		<META http-equiv="Content-Type" content="text/html; charset=windows-1251">
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</head>
	<body bottomMargin="0" leftMargin="0" topMargin="0" rightMargin="0">
		<form id="Form1" method="post" runat="server">
			<table cellspacing="0" cellpadding="0" align="center" border="0">
				<tr>
					<td style="WIDTH: 358px" height="120"></td>
				</tr>
				<tr>
					<td style="WIDTH: 358px" valign="top"><IMG src="images/left_1.jpg"></td>
					<td valign="top" width="264" background="images/right_1.jpg" height="342">
						<P>&nbsp;</P>
						<P>&nbsp;</P>
						<P><asp:label id="Label1" runat="server" Font-Names="tahoma" Font-Size="8pt"></asp:label>
							<table id="table1" style="FONT-SIZE: 8pt; WIDTH: 245px; FONT-FAMILY: tahoma; HEIGHT: 32px"
								height="32" cellspacing="1" cellpadding="0" width="245" border="0">
								<tr>
									<td style="WIDTH: 99px; COLOR: #3697b7" valign="middle" align="right">Багшийн&nbsp;код&nbsp;:
									</td>
									<td style="HEIGHT: 20px"><asp:textbox id="TextBox1" runat="server" Font-Names="tahoma" Font-Size="8pt" BorderColor="DarkGray"
											CssClass="button" MaxLength="25" BorderWidth="1" Width="125px"></asp:textbox></td>
								</tr>
								<tr>
									<td style="WIDTH: 99px; COLOR: #3697b7; HEIGHT: 19px" valign="middle" align="right"
										height="19">Нууц vг :
									</td>
									<td style="HEIGHT: 19px" height="19"><asp:textbox id="TextBox2" runat="server" Font-Names="Tahoma" Font-Size="8pt" BorderColor="DarkGray"
											CssClass="button" MaxLength="25" BorderWidth="1" Width="125px" TextMode="Password"></asp:textbox></td>
								</tr>
								<tr>
									<td style="WIDTH: 99px; HEIGHT: 19px" height="19"></td>
									<td style="HEIGHT: 19px" height="19">
										<DIV align="left"><asp:button id="Button1" runat="server" Font-Names="tahoma" Font-Size="8pt" BorderColor="DarkGray"
												CssClass="button" BorderWidth="1" BorderStyle="Solid" ForeColor="#3697B7" Text="Нэвтрэх" BackColor="#C1DCFA"
												Height="18px"></asp:button></DIV>
									</td>
								</tr>
								<tr>
									<td colSpan="2" height="16">
										<DIV align="center">&nbsp;
											<asp:checkbox id="CheckBox1" runat="server" Font-Names="tahoma" Font-Size="8pt" Width="177px"
												ForeColor="#3697B7" Text="Энэ компьютерт сануулах" Height="16px"></asp:checkbox></DIV>
									</td>
								</tr>
							</table>
						</P>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
