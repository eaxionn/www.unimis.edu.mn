<%@ Page AutoEventWireup="false" Codebehind="admin_index.aspx.vb" Inherits="e_testweb.adminpage" Language="vb" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>АДМИН ЦОНХ</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table3" style="Z-INDEX: 101; LEFT: 8px; WIDTH: 100%; POSITION: absolute; TOP: 8px; HEIGHT: 100%"
				cellSpacing="1" cellPadding="1" width="100%" align="center" border="0">
				<TR>
					<TD align="center"><asp:label id="Label1" runat="server" Visible="False" Font-Size="8pt" Font-Names="Tahoma" Height="16px"
							Width="208px">Уучлаарай та нэвтрэх боложгvй байна.</asp:label>
						<TABLE id="Table2" style="WIDTH: 280px" cellSpacing="1" borderColorDark="mintcream" cellPadding="1"
							width="280" align="center" bgColor="#dcdcd9" borderColorLight="navy" background=".\mini\8.gif"
							border="1">
							<TR>
								<TD style="HEIGHT: 182px" vAlign="middle" align="center">
									<TABLE id="Table1" style="WIDTH: 192px; HEIGHT: 102px" cellSpacing="1" cellPadding="1"
										width="192" border="0">
										<TR>
											<TD align="center" colSpan="2"></TD>
										</TR>
										<TR>
											<TD style="WIDTH: 148px; HEIGHT: 18px" vAlign="middle" align="right"><FONT style="FONT-WEIGHT: bold" face="tahoma" size="1">Администратор 
													:</FONT></TD>
											<TD style="HEIGHT: 18px" width="55%"><FONT face="tahoma" size="1"><INPUT id="admin" style="FONT-SIZE: xx-small; FONT-FAMILY: Tahoma; HEIGHT: 23px; BACKGROUND-COLOR: white"
														type="text" name="test1" runat="server"></FONT></TD>
										</TR>
										<TR>
											<TD style="WIDTH: 148px; HEIGHT: 28px" vAlign="middle" align="right"><FONT style="FONT-WEIGHT: bold" face="tahoma" size="1">Нууц 
													vг :</FONT></TD>
											<TD style="HEIGHT: 28px" width="55%"><FONT face="tahoma" size="1"><INPUT id="apass" style="FONT-SIZE: xx-small; FONT-FAMILY: Tahoma; HEIGHT: 23px; BACKGROUND-COLOR: white"
														type="password" name="Password1" runat="server"></FONT></TD>
										</TR>
										<TR>
											<TD vAlign="top" align="right" colSpan="2"><asp:button id="Button1" runat="server" Font-Size="8pt" Font-Names="Tahoma" Height="19px" Width="72px"
													ForeColor="WhiteSmoke" BackColor="SlateGray" BorderWidth="1px" BorderStyle="Solid" Text="Нэвтрэх"></asp:button></TD>
										</TR>
									</TABLE>
								</TD>
							</TR>
						</TABLE>
						<DIV style="DISPLAY: inline; FONT-SIZE: xx-small; WIDTH: 280px; FONT-FAMILY: tahoma; HEIGHT: 8px"
							align="center" ms_positioning="FlowLayout">
							COPYRIGHT © 2007 ITC.
						</DIV>
					</TD>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>
