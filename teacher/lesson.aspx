<%@ Page Language="vb" AutoEventWireup="false" Inherits="teacher.lesson" CodeFile="lesson.aspx.vb" %>
<%@ Register TagPrefix="uc1" TagName="huvaari" Src="huvaari.ascx" %>
<%@ Register TagPrefix="uc1" TagName="dood" Src="dood.ascx" %>
<%@ Register TagPrefix="uc1" TagName="deed" Src="deed.ascx" %>
<%@ Register TagPrefix="uc1" TagName="zaahlesson" Src="zaahlesson.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Багшийн програм</title>
		<SCRIPT language="javascript">
<!--
var index1;
index1=0;
var  DIGIT = "0123456789-.";
function keydowned()
{ res=false;
  for (k=0;k<DIGIT.length;k++)
  res=res || (DIGIT.charCodeAt(k)==event.keyCode) 
  event.returnValue=res;
}
//-->
		</SCRIPT>
		<META http-equiv="Content-Type" content="text/html; charset=windows-1251">
		<style type="text/css" media="screen">@import url( cssreciaspx.css ); 
		</style>
		<meta content="Microsoft Visual Studio .NET 8.0" name="GENERATOR">
		<meta content="Visual Basic .NET 8.0" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</head>
	<body>
		<form id="Form1" method="post" runat="server">
			<table id="table1" cellspacing="0" cellpadding="0" width="1020" align="center" border="0">
				<tr>
					<td style="HEIGHT: 6px"><uc1:deed id="Deed1" runat="server"></uc1:deed></td>
				</tr>
				<tr>
					<td valign="top">
						<table id="table2" cellspacing="0" cellpadding="0" width="100%" border="0">
							<tr>
								<td valign="top" width="150"><uc1:zaahlesson id="Zaahlesson1" runat="server"></uc1:zaahlesson><uc1:huvaari id="Huvaari1" runat="server"></uc1:huvaari></td>
								<td valign="top">
									<table id="table3" cellspacing="1" cellpadding="1" width="90%" border="0">
										<tr>
											<td align="center"><asp:hyperlink id="Hyperlink1" runat="server" Font-Size="Medium"></asp:hyperlink></td>
										</tr>
										<tr>
											<td align="center">
												<table id="table4" cellspacing="1" cellpadding="1" width="90%" border="1">
													<tr>
														<td style="WIDTH: 393px" align="center"><asp:hyperlink id="Hyperlink5" runat="server" Font-Size="Medium" Visible="False">Семинарын дvн оруулах</asp:hyperlink><asp:dropdownlist id="DropDownList1" runat="server" Visible="False" AutoPostBack="true" Width="160px">
																<asp:ListItem Value="0">grup</asp:ListItem>
															</asp:dropdownlist></td>
														<td valign="top"><asp:hyperlink id="Hyperlink2" runat="server" Font-Size="Medium" Visible="False" NavigateUrl="songolt.aspx">Семинарын группийн сонголт засах</asp:hyperlink></td>
													</tr>
													<tr>
														<td style="WIDTH: 393px" align="center"><asp:hyperlink id="Hyperlink6" runat="server" Font-Size="Medium" Visible="False">Лаб-н дvн оруулах</asp:hyperlink><asp:dropdownlist id="DropDownList2" runat="server" Visible="False" AutoPostBack="true" Width="160px">
																<asp:ListItem Value="0">grup</asp:ListItem>
															</asp:dropdownlist></td>
														<td valign="top"><asp:hyperlink id="Hyperlink3" runat="server" Font-Size="Medium" Visible="False" NavigateUrl="songolt.aspx">Лабораторын группийн сонголт засах</asp:hyperlink></td>
													</tr>
													<tr>
														<td style="WIDTH: 393px" align="center"><br/>
															<asp:hyperlink id="Hyperlink8" runat="server" Font-Size="Medium" NavigateUrl="songolt.aspx">Нийт оюутнаар дvн оруулах</asp:hyperlink></td>
														<td valign="top">
															<asp:hyperlink id="Hyperlink4" runat="server" Font-Size="Medium" Visible="False" NavigateUrl="songolt.aspx">Сонголт засах /группгvй/</asp:hyperlink>
															<br/>
															<asp:hyperlink id="Hyperlink7" runat="server" Font-Size="Medium" NavigateUrl="standart.aspx">Хичээлийн стандарт засах</asp:hyperlink></td>
													</tr>
												</table>
											</td>
										</tr>
										<tr>
											<td align="left">Хичээл заасан тэмдэглэл</td>
										</tr>
										<tr>
											<td><asp:datagrid id="DataGrid1" runat="server" Width="100%" AutoGenerateColumns="False" OnItemCommand="ItemsGrid_Command"
													AllowPaging="true" OnPageIndexChanged="DataGrid1_Paged" Height="192px">
													<headerStyle BackColor="Gainsboro"></headerStyle>
													<Columns>
														<asp:BoundColumn Visible="False" DataField="num"></asp:BoundColumn>
														<asp:TemplateColumn headerText="№">
															<headerStyle HorizontalAlign="Center"></headerStyle>
															<ItemTemplate>
																<DIV align="center">
																	<asp:Label id=cnt runat="server" OnDataBinding="Increaser" Text="<%# cnt%>">
																	</asp:Label></DIV>
															</ItemTemplate>
														</asp:TemplateColumn>
														<asp:TemplateColumn headerText="Сар/едер">
															<ItemTemplate>
																<asp:Label id=Label2 runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.ognoo") %>'>
																</asp:Label>
															</ItemTemplate>
														</asp:TemplateColumn>
														<asp:TemplateColumn headerText="Ою-тоо/цаг">
															<ItemTemplate>
																<asp:Label id=Label3 runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.too")&amp;"/"&amp;DataBinder.Eval(Container, "DataItem.tsag") %>'>
																</asp:Label>
															</ItemTemplate>
														</asp:TemplateColumn>
														<asp:BoundColumn DataField="sedev" headerText="Сэдэв"></asp:BoundColumn>
														<asp:BoundColumn DataField="lessname" headerText="Хэлбэр"></asp:BoundColumn>
														<asp:ButtonColumn Text="засах" headerText="Засах" CommandName="Select"></asp:ButtonColumn>
														<asp:TemplateColumn headerText="Устгах">
															<ItemTemplate>
																<asp:CheckBox id="del" runat="server"></asp:CheckBox>
																<asp:Label id=num runat="server" Visible="false" Text='<%# DataBinder.Eval(Container.DataItem, "num") %>'>
																</asp:Label>
															</ItemTemplate>
														</asp:TemplateColumn>
													</Columns>
													<PagerStyle Mode="NumericPages"></PagerStyle>
												</asp:datagrid>
												<table id="table5" cellspacing="1" cellpadding="1" width="100%" border="0">
													<tr>
														<td>
															<table id="table6" cellspacing="1" cellpadding="1" width="100%" border="0">
																<tr>
																	<td></td>
																	<td align="right" style="width: 523px"><asp:button id="Button3" runat="server" Text="Устгах" CausesValidation="False"></asp:button></td>
																</tr>
																<tr>
																	<td><asp:button id="Button5" runat="server" Width="168px" Text="Цагийн тооцоо хvснэгт" CausesValidation="False"></asp:button></td>
																	<td style="width: 523px"></td>
																</tr>
																<tr>
																	<td>Тэмдэглэл оруулах
																		<asp:label id="tolov" runat="server" Visible="False">0</asp:label></td>
																	<td align="center" style="width: 523px"><asp:textbox id="ognoo1" runat="server" Width="92px"></asp:textbox>-ээс
																		<asp:textbox id="ognoo2" runat="server" Width="92px"></asp:textbox>&nbsp;
																		<asp:button id="Button4" runat="server" Width="132px" Text="Хэвлэхээр харах" CausesValidation="False"></asp:button></td>
																</tr>
															</table>
														</td>
													</tr>
													<tr>
														<td>
															<table id="table7" cellspacing="1" cellpadding="1" width="100%" border="0">
																<tr>
																	<td bgColor="gainsboro">Сар едер</td>
																	<td bgColor="gainsboro">Оюутны тоо</td>
																	<td bgColor="gainsboro">Цаг</td>
																	<td bgColor="gainsboro">Хэлбэр</td>
																</tr>
																<tr>
																	<td><asp:textbox id="TextBox1" runat="server" Width="100px"></asp:textbox><asp:requiredfieldvalidator id="RequiredFieldValidator3" runat="server" Display="Dynamic" ErrorMessage="*" ControlToValidate="TextBox1"></asp:requiredfieldvalidator><asp:comparevalidator id="CompareValidator1" runat="server" Display="Dynamic" ErrorMessage="*" ControlToValidate="TextBox1"
																			Operator="DataTypeCheck" Type="Date"></asp:comparevalidator></td>
																	<td><asp:textbox id="TextBox2" runat="server" Width="100px"></asp:textbox><asp:requiredfieldvalidator id="Requiredfieldvalidator2" runat="server" Display="Dynamic" ErrorMessage="*" ControlToValidate="TextBox2"></asp:requiredfieldvalidator><asp:rangevalidator id="Rangevalidator1" runat="server" Display="Dynamic" ErrorMessage="Тоо зев оруулна уу"
																			ControlToValidate="TextBox2" Type="Integer" MaximumValue="2000" MinimumValue="1"></asp:rangevalidator></td>
																	<td><asp:textbox id="TextBox3" runat="server" Width="100px"></asp:textbox><asp:requiredfieldvalidator id="RequiredFieldValidator1" runat="server" Display="Dynamic" ErrorMessage="*" ControlToValidate="TextBox3"></asp:requiredfieldvalidator><asp:rangevalidator id="Rangevalidator2" runat="server" Display="Dynamic" ErrorMessage="Тоо зев оруулна уу"
																			ControlToValidate="TextBox3" Type="Integer" MaximumValue="2000" MinimumValue="1"></asp:rangevalidator></td>
																	<td><asp:dropdownlist id="DropDownList3" runat="server" Width="105px"></asp:dropdownlist></td>
																</tr>
															</table>
															<asp:textbox id="TextBox4" runat="server" Width="100%" TextMode="MultiLine" Height="104px"></asp:textbox></td>
													</tr>
													<tr>
														<td><asp:button id="Button1" runat="server" Text="Бvртгэх"></asp:button><asp:button id="Button2" runat="server" Text="Болих" CausesValidation="False"></asp:button><asp:label id="Label1" runat="server"></asp:label></td>
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
				<tr>
					<td><uc1:dood id="Dood1" runat="server"></uc1:dood></td>
				</tr>
			</table>
		</form>
	</body>
</html>
