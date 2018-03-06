<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Lstandart.aspx.vb" Inherits="Lstandart" %>

<!DOCTYPE html PUBLIC "-//W3C//Dtd XHTML 1.0 transitional//EN" "http://www.w3.org/tr/xhtml1/Dtd/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Хичээлийн стандарт</title>
		<meta http-equiv="Content-Type" content="text/html; charset=windows-1251" />
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1" />
		<meta name="vs_defaultClientScript" content="JavaScript" />
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
		<link href="stylesss.css" rel="stylesheet" type="text/css" />
		<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="Form1" method="post" runat="server">
			<table style="width:100%; background-color:#ffffff" border="0" cellpadding="0" cellspacing="1" >
				<tr>
					<td valign="top" align="center" colspan="4" style="background-color:white">
						<asp:Label id="Label17" runat="server" Font-Bold="true"></asp:Label></td>
				</tr>
				<tr style="background-color:#660000">
					<td colspan="4" valign="top">
					<img alt="" style="width:1; height:1" src="images/blank.gif" runat="server" id="img1" />
					</td>
				</tr>
				<tr>
					<td style="width:16%" valign="top">
					    <div align="right"><font size="1" face="Verdana, Arial, Helvetica, sans-serif" color="#003366">
								Сургууль:</font></div>
					</td>
					<td style="width:22%" valign="top">
						<div align="left"><font size="1" face="Verdana, Arial, Helvetica, sans-serif" color="#663300">&nbsp;
								<asp:Label id="Label1" runat="server"></asp:Label>
							</font>
						</div>
					</td>
					<td style="width:18%" valign="top">
						<div align="right"><font color="#003366" face="Verdana, Arial, Helvetica, sans-serif" size="1">Лабораторын 
								цаг:</font></div>
					</td>
					<td style="width:44%" valign="top"><font size="1" face="Verdana, Arial, Helvetica, sans-serif" color="#663300">&nbsp;
							<asp:Label id="Label9" runat="server"></asp:Label>
						</font>
					</td>
				</tr>
				<tr>
					<td style="width:16%" valign="top">
						<div align="right"><font size="1" face="Verdana, Arial, Helvetica, sans-serif" color="#003366">
								Тэнхим:</font></div>
					</td>
					<td style="width:22%" valign="top">
						<font color="#663300" face="Verdana, Arial, Helvetica, sans-serif" size="1">&nbsp;
							<asp:Label id="Label2" runat="server"></asp:Label>
						</font>
					</td>
					<td style="width:18%" valign="top">
						<div align="right"><font color="#003366" face="Verdana, Arial, Helvetica, sans-serif" size="1">Бие 
								даалтын цаг:</font></div>
					</td>
					<td style="width:44%" valign="top"><font size="1" face="Verdana, Arial, Helvetica, sans-serif" color="#663300">&nbsp;
							<asp:Label id="Label10" runat="server"></asp:Label>
						</font>
					</td>
				</tr>
				<tr>
					<td style="width:16%" valign="top">
						<div align="right"><font color="#003366" face="Verdana, Arial, Helvetica, sans-serif" size="1">Хичээлийн 
								код:</font></div>
					</td>
					<td style="width:22%" valign="top">
						<font size="1" face="Verdana, Arial, Helvetica, sans-serif" color="#663300">&nbsp;
							<asp:Label id="Label3" runat="server"></asp:Label>
						</font>
					</td>
					<td style="width:18%" valign="top">
						<div align="right"><font color="#003366" face="Verdana, Arial, Helvetica, sans-serif" size="1">
								&nbsp;Хичээлийн зорилго:</font></div>
					</td>
					<td style="width:44%" valign="top"><font size="1" face="Verdana, Arial, Helvetica, sans-serif" color="#663300">&nbsp;
							<asp:Label id="Label11" runat="server"></asp:Label>
						</font>
					</td>
				</tr>
				<tr>
					<td style="width:16%;HEIGHT: 5px" valign="top">
						<div align="right"><font color="#003366" face="Verdana, Arial, Helvetica, sans-serif" size="1">Хичээлийн 
								нэр:</font></div>
					</td>
					<td style="width:22%;HEIGHT: 5px" valign="top" >
						<font size="1" face="Verdana, Arial, Helvetica, sans-serif" color="#663300">&nbsp;
							<asp:Label id="Label4" runat="server"></asp:Label>
						</font>
					</td>
					<td style="width:18%;HEIGHT: 5px" valign="top" >
						<div align="right"><font color="#003366" face="Verdana, Arial, Helvetica, sans-serif" size="1">Оюутанд 
								олгох мэдлэг:</font></div>
					</td>
					<td style="width:44%;HEIGHT: 5px" valign="top" ><font size="1" face="Verdana, Arial, Helvetica, sans-serif" color="#663300">&nbsp;<asp:Label id="Label12" runat="server"></asp:Label></font>
					</td>
				</tr>
				<tr>
					<td style="width:16%" valign="top">
						<div align="right"><font color="#003366" face="Verdana, Arial, Helvetica, sans-serif" size="1">Кредит:</font></div>
					</td>
					<td style="width:22%" valign="top">
						<font size="1" face="Verdana, Arial, Helvetica, sans-serif" color="#663300">&nbsp;
							<asp:Label id="Label5" runat="server"></asp:Label>
						</font>
					</td>
					<td style="width:18%" valign="top">
						<div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" color="#003366" size="1">Чадвар:</font></div>
					</td>
					<td style="width:44%" valign="top"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#663300">&nbsp;
							<asp:Label id="Label13" runat="server"></asp:Label>
						</font>
					</td>
				</tr>
				<tr>
					<td style="width:16%" valign="top">
						<div align="right"><font color="#003366" face="Verdana, Arial, Helvetica, sans-serif" size="1">Омнох 
								холбоо:</font></div>
					</td>
					<td style="width:22%" valign="top"><font size="1" face="Verdana, Arial, Helvetica, sans-serif" color="#663300">&nbsp;
							<asp:Label id="Label6" runat="server"></asp:Label>
						</font>
					</td>
					<td style="width:18%" valign="top">
						<div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" color="#003366" size="1">Дадал:</font></div>
					</td>
					<td style="width:44%" valign="top"><font size="1" face="Verdana, Arial, Helvetica, sans-serif" color="#663300">&nbsp;
							<asp:Label id="Label14" runat="server"></asp:Label>
						</font>
					</td>
				</tr>
				<tr>
					<td style="width:16%" valign="top">
						<div align="right"><font color="#003366" face="Verdana, Arial, Helvetica, sans-serif" size="1">Лекцийн 
								цаг:</font></div>
					</td>
					<td style="width:22%"><font size="1" face="Verdana, Arial, Helvetica, sans-serif" color="#663300">&nbsp;
							<asp:Label id="Label7" runat="server"></asp:Label>
						</font>
					</td>
					<td style="width:18%" valign="top">
						<div align="right"><font color="#003366" face="Verdana, Arial, Helvetica, sans-serif" size="1">Бvртгэсэн 
								огноо:</font></div>
					</td>
					<td style="width:44%"><font face="Verdana, Arial, Helvetica, sans-serif" color="#663300" size="1">&nbsp;
							<asp:Label id="Label15" runat="server"></asp:Label>
						</font>
					</td>
				</tr>
				<tr>
					<td style="width:16%" valign="top">
						<div align="right"><font color="#003366" face="Verdana, Arial, Helvetica, sans-serif" size="1">Семинарийн 
								цаг:</font></div>
					</td>
					<td style="width:22%"><font size="1" face="Verdana, Arial, Helvetica, sans-serif" color="#663300">&nbsp;
							<asp:Label id="Label8" runat="server"></asp:Label>
						</font>
					</td>
					<td style="width:18%" valign="top">
						<div align="right"><font color="#003366" face="Verdana, Arial, Helvetica, sans-serif" size="1">Хичээлийн 
								англи нэр:</font></div>
					</td>
					<td style="width:44%"><font face="Verdana, Arial, Helvetica, sans-serif" color="#663300" size="1">&nbsp;
							<asp:Label id="Label16" runat="server"></asp:Label></font></td>
				</tr>
			</table>
			<table style="width:100%;background-color:#ffffff" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td valign="top" style="width:60%">
						<table style="width:99%;background-color:#ffffff" border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td style="height:18" valign="bottom"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><font color="#0080c0"><font color="#003366"><b>- 
													Хичээл заах багш -</b></font></font></font>
								</td>
							</tr>
							<tr>
								<td style="background-color:#663366;height:1"><img src="images/blank.gif" style="width:1" alt="" /></td>
							</tr>
							<tr>
								<td style="background-color:#ffffff">
									<asp:DataGrid id="DataGrid1" runat="server" AutoGenerateColumns="False" style="width:100%" HeaderStyle-Font-Size="10">
										<Columns>
											<asp:BoundColumn DataField="U0351BB" HeaderText="Код" HeaderStyle-Font-Size="10"></asp:BoundColumn>
											<asp:BoundColumn DataField="U41II" HeaderText="Нэр" HeaderStyle-Font-Size="10"></asp:BoundColumn>
											<asp:BoundColumn HeaderText="Ороо" HeaderStyle-Font-Size="10"></asp:BoundColumn>
											<asp:BoundColumn HeaderText="Утас" HeaderStyle-Font-Size="10"></asp:BoundColumn>
											<asp:BoundColumn HeaderText="E-mail хяаг" HeaderStyle-Font-Size="10"></asp:BoundColumn>
										</Columns>
									</asp:DataGrid></td>
							</tr>
						</table>
					</td>
					<td style="width:40%;background-color:#f3f3f3" valign="top" >
						<table style="width:100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td style="height:18" valign="bottom"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><font color="#0080c0"><font face="Arial, Helvetica, sans-serif"><font size="2"><font size="2"><font face="Arial, Helvetica, sans-serif"><font face="Arial, Helvetica, sans-serif"><font face="Arial, Helvetica, sans-serif"><font size="2" color="#0080c0"><font color="#ffffff" face="Verdana, Arial, Helvetica, sans-serif" size="1"><b><font color="#003366"></font></b></font></font></font></font></font></font></font></font></font></font>
								</td>
							</tr>
							<tr>
								<td style="background-color:#663366"><img src="images/blank.gif" style="width:1;height:1" alt="" /></td>
							</tr>
						</table>
						<asp:DataGrid id="DataGrid2" runat="server" AutoGenerateColumns="False" style="width:100%">
							<Columns>
								<asp:BoundColumn DataField="UN_NER" HeaderText="Vнэлгээ"></asp:BoundColumn>
								<asp:BoundColumn DataField="U0355CC" HeaderText="Оноо"></asp:BoundColumn>
							</Columns>
						</asp:DataGrid>
					</td>
				</tr>
				<tr style="background-color:#f3f3f3">
					<td colspan="2">
						<table style="width:100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td style="height:18" valign="bottom"><font face="Arial, Helvetica, sans-serif"><font size="2"><font size="2"><font face="Arial, Helvetica, sans-serif"><font face="Arial, Helvetica, sans-serif"><font face="Arial, Helvetica, sans-serif"><font face="Arial, Helvetica, sans-serif"><font size="2"><font size="2"><font face="Arial, Helvetica, sans-serif"><font face="Arial, Helvetica, sans-serif"><font face="Arial, Helvetica, sans-serif"><font size="2" color="#0080c0"><font color="#003366" face="Verdana, Arial, Helvetica, sans-serif" size="1"><b>- 
																								Ном сурах бичиг -</b></font></font></font></font></font></font></font></font><b><font size="1" color="#003366" face="Verdana, Arial, Helvetica, sans-serif"></font></b></font></font></font></font></font></font></td>
							</tr>
							<tr>
								<td style="background-color:#663366;height:1;width:1"><img src="images/blank.gif" alt="" /></td>
							</tr>
						</table>
						<asp:DataGrid id="DataGrid3" runat="server" AutoGenerateColumns="False" style="width:100%">
							<Columns>
								<asp:BoundColumn DataField="U0352BB" HeaderText="Зохиогчид"></asp:BoundColumn>
								<asp:BoundColumn DataField="U0352CC" HeaderText="Нэр"></asp:BoundColumn>
								<asp:BoundColumn DataField="U0352DD" HeaderText="ISBN"></asp:BoundColumn>
								<asp:BoundColumn DataField="U0352EE" HeaderText="Он"></asp:BoundColumn>
								<asp:BoundColumn DataField="U0352FF" HeaderText="Vндсэн нэмэлт"></asp:BoundColumn>
							</Columns>
						</asp:DataGrid>
					</td>
				</tr>
				<tr style="background-color:#f3f3f3">
					<td colspan="2" valign="top" style="HEIGHT: 11px">
						<table style="width:100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td style="width:50%" valign="top">
									<table style="width:100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td style="height:18" valign="bottom"><font face="Arial, Helvetica, sans-serif"><font size="2"><font size="2"><font face="Arial, Helvetica, sans-serif"><font face="Arial, Helvetica, sans-serif"><font face="Arial, Helvetica, sans-serif"><font size="2" color="#0080c0"><font color="#003366" face="Verdana, Arial, Helvetica, sans-serif" size="1"><b>- 
																					Бие даалт -</b></font></font></font></font></font></font></font></font></td>
										</tr>
										<tr>
											<td style="background-color:#663366"><img src="images/blank.gif" style="width:1;height:1" alt="" /></td>
										</tr>
									</table>
									<asp:DataGrid id="DataGrid4" runat="server" style="width:100%" AutoGenerateColumns="False">
										<Columns>
											<asp:BoundColumn DataField="U0353BB" HeaderText="Долоо хоног"></asp:BoundColumn>
											<asp:BoundColumn DataField="U0353CC" HeaderText="Сэдэв"></asp:BoundColumn>
											<asp:BoundColumn DataField="U0353DD" HeaderText="Оноо"></asp:BoundColumn>
										</Columns>
									</asp:DataGrid>
								</td>
								<td style="width:5" valign="top">
									<img src="images/blank.gif" style="width:5;height:3" alt="" /></td>
								<td style="width:50%" valign="top"><table style="width:100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td style="height:18" valign="bottom"><font face="Arial, Helvetica, sans-serif"><font size="2"><font size="2"><font face="Arial, Helvetica, sans-serif"><font face="Arial, Helvetica, sans-serif"><font face="Arial, Helvetica, sans-serif"><font size="2" color="#0080c0"><font face="Arial, Helvetica, sans-serif"><font size="2"><font size="2"><font face="Arial, Helvetica, sans-serif"><font face="Arial, Helvetica, sans-serif"><font face="Arial, Helvetica, sans-serif"><font size="2" color="#0080c0"><font color="#003366" face="Verdana, Arial, Helvetica, sans-serif" size="1"><b>- 
																												Хичээлийн сэдэвчилсэн толовлогоо-</b></font></font></font></font></font></font></font></font><b><font color="#003366" face="Verdana, Arial, Helvetica, sans-serif" size="1"></font></b></font></font></font></font></font></font></font></td>
										</tr>
										<tr>
											<td style="background-color:#663366"><img src="images/blank.gif" style="width:1;height:1" alt="" /></td>
										</tr>
										<tr>
											<td valign="top" style="background-color:#ffffff">
												<asp:DataGrid id="DataGrid5" runat="server" style="width:100%" AutoGenerateColumns="False">
													<Columns>
														<asp:BoundColumn DataField="U0354BB" HeaderText="Долоо хоног" HeaderStyle-Width="20px" HeaderStyle-HorizontalAlign="center"></asp:BoundColumn>
														<asp:BoundColumn DataField="U0354CC" HeaderText="Сэдэв, бvлэг"></asp:BoundColumn>
														<asp:BoundColumn DataField="U0354DD" HeaderText="Тэмдэглэл"></asp:BoundColumn>
													</Columns>
												</asp:DataGrid></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr style="background-color:#f3f3f3">
					<td colspan="2">&nbsp;</td>
				</tr>
			</table>
		</form>
</body>
</html>
