<%@ Page Language="vb" AutoEventWireup="false" Inherits="teacher.sbichig" CodeFile="sbichig.aspx.vb" %>
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
		<META http-equiv="Content-Type" content="text/html; charset=windows-1251">
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
									<ASP:DATAGRID id="Datagrid1" runat="server" OnDeleteCommand="DataGrid_Delete" OnEditCommand="DataGrid_Edit"
										OnCancelCommand="DataGrid_Cancel" OnUpdateCommand="DataGrid_Update" DataKeyField="U0352II"
										GridLines="Horizontal" ShowFooter="true" OnItemCommand="doInsert" AutoGenerateColumns="False"
										Width="100%">
										<Columns>
											<asp:TemplateColumn SortExpression="id" headerText="№">
												<headerStyle Width="5%"></headerStyle>
												<ItemStyle HorizontalAlign="Center"></ItemStyle>
												<ItemTemplate>
													<asp:Label id="Label9" runat="server" Font-Size="8" Text='<%# cnt%>' OnDataBinding="Increaser"/>
												</ItemTemplate>
											</asp:TemplateColumn>
											<asp:TemplateColumn headerText="Нэр">
												<ItemTemplate>
													<asp:Label runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.U0352CC") %>' ID="Label10" >
													</asp:Label>
												</ItemTemplate>
												<FooterTemplate>
													<table border="0">
														<tr>
															<th bgcolor="#F0F0F0">
																<div align="left"></div>
															</th>
															<td>Шинэ ном бvртгэх
															</td>
														</tr>
														<tr>
															<th bgcolor="#F0F0F0">
																<div align="left">Дугаар:</div>
															</th>
															<td>
																<asp:TextBox ID="add_dugaar" MaxLength="20" Width="200" runat="Server" />
																<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ErrorMessage="*" ControlToValidate="add_dugaar"></asp:RequiredFieldValidator>
																<asp:RangeValidator ID="Rangevalidator2" ControlToValidate="add_dugaar" Type="Integer" MinimumValue="1"
																	MaximumValue="1000" ErrorMessage="Дугаар зев оруулна уу" Display="Dynamic" runat="server" />
															</td>
														</tr>
														<tr>
															<th bgcolor="#F0F0F0">
																<div align="left">Зохиогчид:</div>
															</th>
															<td>
																<asp:TextBox ID="add_zohiogch" MaxLength="100" Width="200" runat="Server" />
																<asp:RequiredFieldValidator ID="Requiredfieldvalidator5" runat="server" Display="Dynamic" ErrorMessage="Зохиогч оруулна уу?"
																	ControlToValidate="add_zohiogch"></asp:RequiredFieldValidator></td>
														</tr>
														<tr>
															<th bgcolor="#F0F0F0">
																<div align="left">Нэр:</div>
															</th>
															<td>
																<asp:TextBox ID="add_ner" MaxLength="100" Width="200" runat="Server" />
																<asp:RequiredFieldValidator ID="Requiredfieldvalidator2" runat="server" Display="Dynamic" ErrorMessage="Нэр оруулна уу"
																	ControlToValidate="add_ner"></asp:RequiredFieldValidator></td>
														</tr>
														<tr>
															<th bgcolor="#F0F0F0">
																<div align="left">ISBN:</div>
															</th>
															<td>
																<asp:TextBox ID="add_isbn" MaxLength="20" Width="200" runat="Server" />
																<asp:RequiredFieldValidator ID="Requiredfieldvalidator6" runat="server" Display="Dynamic" ErrorMessage="ISBN оруулна уу"
																	ControlToValidate="add_isbn"></asp:RequiredFieldValidator></td>
														</tr>
														<tr>
															<th bgcolor="#F0F0F0">
																<div align="left">Он:</div>
															</th>
															<td>
																<asp:TextBox ID="add_on" MaxLength="20" Width="200" runat="Server" />
																<asp:RequiredFieldValidator ID="Requiredfieldvalidator7" runat="server" Display="Dynamic" ErrorMessage="*" ControlToValidate="add_on"></asp:RequiredFieldValidator>
																<asp:RangeValidator ID="Rangevalidator1" ControlToValidate="add_on" Type="Integer" MinimumValue="1930"
																	MaximumValue="2010" ErrorMessage="Он зев оруулна уу" Display="Dynamic" runat="server" />
															</td>
														</tr>
														<tr>
															<th bgcolor="#F0F0F0">
																<div align="left">Терел:</div>
															</th>
															<td>
																<asp:DropDownList ID="add_type" runat="server" Width="200">
																	<asp:ListItem Value="61">Vндсэн сурах бичиг</asp:ListItem>
																	<asp:ListItem Value="62">Нэмэлт материал</asp:ListItem>
																</asp:DropDownList></td>
														</tr>
														<tr>
															<th bgcolor="#F0F0F0">
																<div align="left"></div>
															</th>
															<td>
																<asp:Button CommandName="Insert" Text="Нэмэх" ID="btnAdd" runat="server" CausesValidation="true" /></td>
														</tr>
													</table>
												</FooterTemplate>
												<EditItemTemplate>
													<table border="0">
														<tr>
															<th bgcolor="#F0F0F0">
																<div align="left"></div>
															</th>
															<td>Засах</td>
														</tr>
														<tr>
															<th bgcolor="#F0F0F0">
																<div align="left">Дугаар:</div>
															</th>
															<td>
																<asp:TextBox ID="ed_dugaar" MaxLength="20" Width="200" Text='<%# DataBinder.Eval(Container, "DataItem.U0352II") %>' runat="Server" />
																<asp:RequiredFieldValidator ID="Requiredfieldvalidator10" runat="server" Display="Dynamic" ErrorMessage="*"
																	ControlToValidate="ed_dugaar"></asp:RequiredFieldValidator>
																<asp:RangeValidator ID="Rangevalidator3" ControlToValidate="ed_dugaar" Type="Integer" MinimumValue="1"
																	MaximumValue="2000" ErrorMessage="Дугаар зев оруулна уу" Display="Dynamic" runat="server" />
															</td>
														</tr>
														<tr>
															<th bgcolor="#F0F0F0">
																<div align="left">Зохиогчид:
																</div>
															</th>
															<td>
																<asp:TextBox ID="ed_zohiogch" MaxLength="20" Width="200" runat="Server" Text='<%# DataBinder.Eval(Container, "DataItem.U0352BB") %>'/>
																<asp:RequiredFieldValidator ID="Requiredfieldvalidator4" runat="server" Display="Dynamic" ErrorMessage="Зохиогч оруулна уу"
																	ControlToValidate="ed_zohiogch"></asp:RequiredFieldValidator></td>
														</tr>
														<tr>
															<th bgcolor="#F0F0F0">
																<div align="left">Нэр:
																</div>
															</th>
															<td>
																<asp:TextBox ID="ed_ner" MaxLength="20" Width="200" runat="Server" Text='<%# DataBinder.Eval(Container, "DataItem.U0352CC") %>' />
																<asp:RequiredFieldValidator ID="Requiredfieldvalidator8" runat="server" Display="Dynamic" ErrorMessage="Нэр оруулна уу"
																	ControlToValidate="ed_ner"></asp:RequiredFieldValidator></td>
														</tr>
														<tr>
															<th bgcolor="#F0F0F0">
																<div align="left">ISBN:</div>
															</th>
															<td>
																<asp:TextBox ID="ed_isbn" MaxLength="20" Width="200" runat="Server" Text='<%# DataBinder.Eval(Container, "DataItem.U0352DD") %>' />
																<asp:RequiredFieldValidator ID="Requiredfieldvalidator9" runat="server" Display="Dynamic" ErrorMessage="ISBN оруулна уу"
																	ControlToValidate="ed_isbn"></asp:RequiredFieldValidator></td>
														</tr>
														<tr>
															<th bgcolor="#F0F0F0">
																<div align="left">Он:</div>
															</th>
															<td>
																<asp:TextBox ID="ed_on" MaxLength="20" Width="200" runat="Server" Text='<%# DataBinder.Eval(Container, "DataItem.U0352EE") %>'/>
																<asp:RangeValidator ID="Value1RangeValidator" ControlToValidate="ed_on" Type="Integer" MinimumValue="1930"
																	MaximumValue="2010" ErrorMessage="Он зев оруулна уу" Display="Dynamic" runat="server" />
															</td>
														</tr>
														<tr>
															<th bgcolor="#F0F0F0">
																<div align="left">Терел:</div>
															</th>
															<td>
																<asp:DropDownList ID="ed_type" runat="server" Width="200">
																	<asp:ListItem Value="61">Vндсэн сурах бичиг</asp:ListItem>
																	<asp:ListItem Value="62">Нэмэлт материал</asp:ListItem>
																</asp:DropDownList></td>
														</tr>
													</table>
												</EditItemTemplate>
											</asp:TemplateColumn>
											<asp:TemplateColumn headerText="Зохиолч">
												<ItemTemplate>
													<asp:Label runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.U0352BB") %>' ID="Label5">
													</asp:Label>
												</ItemTemplate>
											</asp:TemplateColumn>
											<asp:EditCommandColumn ButtonType="linkButton" UpdateText="&lt;img  border=0 alt=save/update&gt;"
												headerText="Засах" CancelText="&lt;img border=0 alt=cancel&gt;" EditText="&lt;img border=0 alt=edit&gt;">
												<ItemStyle HorizontalAlign="Center"></ItemStyle>
											</asp:EditCommandColumn>
											<asp:TemplateColumn headerText="Устгах">
												<ItemStyle HorizontalAlign="Center"></ItemStyle>
												<ItemTemplate>
													<asp:linkButton runat="server" Text="<img border=0 src=images/im_delete.gif alt=delete>" CommandName="Delete"
														CausesValidation="false" ID="linkbutton2" NAME="linkbutton2"></asp:linkButton>
												</ItemTemplate>
											</asp:TemplateColumn>
										</Columns>
									</ASP:DATAGRID><asp:label id="Label1" runat="server" ForeColor="Red"></asp:label></td>
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
