<%@ Register TagPrefix="uc1" TagName="huvaari1" Src="huvaari1.ascx" %>
<%@ Register TagPrefix="uc1" TagName="huvaari" Src="huvaari.ascx" %>
<%@ Register TagPrefix="uc1" TagName="nuutsug" Src="nuutsug.ascx" %>
<%@ Register TagPrefix="uc1" TagName="nomiinsan" Src="nomiinsan.ascx" %>
<%@ Register TagPrefix="uc1" TagName="dood" Src="dood.ascx" %>
<%@ Register TagPrefix="uc1" TagName="deed" Src="deed.ascx" %>
<%@ Register TagPrefix="uc1" TagName="zaahlesson" Src="zaahlesson.ascx" %>
<%@ Register TagPrefix="uc1" TagName="myinfo" Src="myinfo.ascx" %>
<%@ Page Language="vb" AutoEventWireup="false" Inherits="teacher.result2" CodeFile="result2.aspx.vb" %>
<%@ Register TagPrefix="uc1" TagName="tsalin" Src="tsalin.ascx" %>
<%@ Register TagPrefix="uc1" TagName="links" Src="links.ascx" %>
<html  xmlns="http://www.w3.org/1999/xhtml">
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
		<meta http-equiv="Content-Type" content="text/html; charset=windows-1251">
		<style type="text/css" media="screen">@import url( cssreciaspx.css ); 
		</style>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
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
								<td valign="top" width="130"><uc1:zaahlesson id="Zaahlesson1" runat="server"></uc1:zaahlesson><uc1:huvaari id="Huvaari1" runat="server"></uc1:huvaari></td>
								<td valign="top">
									<table id="table3" cellspacing="1" cellpadding="1" width="100%" border="0">
										<tr>
											<td align="center"><asp:panel id="Panel1" runat="server">
													<table id="table5" cellspacing="1" cellpadding="1" width="100%" border="0">
														<tr>
															<td>
																<table id="table6" cellspacing="1" cellpadding="1" width="100%" border="0">
																	<tr>
																		<td>
																			<asp:Label id="Label4" runat="server" Font-Bold="true"></asp:Label>
																			<asp:label id="Label2" runat="server" Visible="False">1.1</asp:label></td>
																		<td align="right" valign="top">
                                                                            <asp:DropDownList ID="ChooseSchool" runat="server"></asp:DropDownList>&nbsp;
																			<asp:linkButton id="linkButton5" runat="server">Дvнгийн жагсаалт</asp:linkButton></td>
																	</tr>
																</table>
															</td>
														</tr>
														<tr>
															<td align="center">Дvгнэх хэлбэр :
																<asp:dropdownlist id="DropDownList1" runat="server" Width="223px" AutoPostBack="True"></asp:dropdownlist></td>
														</tr>
														<tr>
															<td align="center">
																<asp:label id="Label1" runat="server" ForeColor="Red"></asp:label>
																<asp:Label id="maxonoo" runat="server" Visible="False">0</asp:Label></td>
														</tr>
														<tr>
															<td align="center">
																<asp:datagrid id="DataGrid1" runat="server" DataKeyField="sid" AllowSorting="true" AutoGenerateColumns="False"
																	OnItemCommand="ItemsGrid_Command" AllowPaging="true" PageSize="20">
																	<FooterStyle Font-Bold="true" ForeColor="Red"></FooterStyle>
																	<Columns>
																		<asp:BoundColumn Visible="False" DataField="sid"></asp:BoundColumn>
																		<asp:TemplateColumn Visible="False">
																			<ItemTemplate>
																				<asp:Label runat="server" ID="sid" Text='<%# DataBinder.Eval(Container, "DataItem.sid") %>'>
																				</asp:Label>
																			</ItemTemplate>
																		</asp:TemplateColumn>
																		<asp:TemplateColumn headerText="№">
																			<headerStyle HorizontalAlign="Center"></headerStyle>
																			<ItemTemplate>
																				<div align="center">
																					<asp:Label id="cnt" runat="server" Font-Size="9" Text='<%# cnt%>' OnDataBinding="Increaser"/>
																				</div>
																			</ItemTemplate>
																		</asp:TemplateColumn>
																		<asp:TemplateColumn SortExpression="1" headerText="Сонсогчийн код">
																			<ItemTemplate>
																				<asp:linkButton runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.sid") %>' CommandName="Select" CausesValidation="false" ID="linkbutton1">
																				</asp:linkButton>
																			</ItemTemplate>
																		</asp:TemplateColumn>
																		<asp:TemplateColumn SortExpression="2" headerText="Нэр">
																			<ItemTemplate>
																				<asp:Label runat="server" ID="sname" Text='<%# raplacecode(DataBinder.Eval(Container, "DataItem.sname")) %>'>
																				</asp:Label>
																			</ItemTemplate>
																		</asp:TemplateColumn>
																		<asp:TemplateColumn SortExpression="3" headerText="Дvн">
																			<ItemTemplate>
																				<asp:Textbox id="dun" runat="server" onKeyPress="keydowned()" MaxLength="5" Text='<%# Format(DataBinder.Eval(Container, "DataItem.dun"), "###0.00") %>' Width="70" />
																			</ItemTemplate>
																		</asp:TemplateColumn>
																	</Columns>
																	<PagerStyle Font-Size="Large" Font-Bold="true" Mode="NumericPages"></PagerStyle>
																</asp:datagrid></td>
														</tr>
														<tr>
															<td align="center">
																<asp:button id="Button1" runat="server" Width="100px" Text="Дvн бичих" CausesValidation="False"></asp:button>
																<asp:Button id="Button3" runat="server" Text="буцах"></asp:Button></td>
														</tr>
													</table>
													<div align="center">W тавих оюутны дvнг -50 оруулна</div>
												</asp:panel><asp:panel id="Panel2" runat="server" Visible="False">
													<table id="table4" cellspacing="1" cellpadding="1" width="100%" border="0">
														<tr>
															<td align="center">
																<asp:Label id="Label3" runat="server"></asp:Label><br/>
																<asp:Label id="num" runat="server" Visible="False"></asp:Label>
																<asp:Label id="omnoh" runat="server" ForeColor="#999999" Font-Size="XX-Small"></asp:Label>
																<asp:linkButton id="linkButton4" runat="server" Font-Italic="true">емнех</asp:linkButton>
																<asp:Label id="sid" runat="server" Font-Bold="true" ForeColor="#003399"></asp:Label>
																<asp:linkButton id="linkButton3" runat="server">дараах </asp:linkButton>
																<asp:Label id="daraah" runat="server" ForeColor="#999999" Font-Size="XX-Small"></asp:Label></td>
														</tr>
														<tr>
															<td align="center">
																<asp:DataGrid id="DataGrid2" runat="server" Width="80%" AutoGenerateColumns="False" GridLines="Horizontal"
																	ShowFooter="true" OnItemDataBound="Item_Bound">
																	<Columns>
																		<asp:TemplateColumn headerText="№">
																			<headerStyle HorizontalAlign="Center"></headerStyle>
																			<ItemTemplate>
																				<div align="center">
																					<asp:Label runat="server" Text='<%# cnt1%>' OnDataBinding="Increaser1" />
																				</div>
																			</ItemTemplate>
																		</asp:TemplateColumn>
																		<asp:TemplateColumn headerText="Нэр">
																			<ItemTemplate>
																				<asp:Label runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.hname")&" /"&Format(DataBinder.Eval(Container, "DataItem.honoo"), "###0.00")&"/" %>' ID="Label7" NAME="Label7">
																				</asp:Label>
																			</ItemTemplate>
																		</asp:TemplateColumn>
																		<asp:TemplateColumn headerText="Дvн">
																			<ItemTemplate>
																				<asp:Textbox id="onoo" runat="server" onKeyPress="keydowned()" MaxLength="5" Text='<%# Format(DataBinder.Eval(Container, "DataItem.sonoo"), "###0.00") %>' Width="70" style="BORDER-RIGHT: #ffffff 1px groove; BORDER-TOP: #ffffff 1px groove; FONT: 10px ; BORDER-LEFT: #ffffff 1px groove; COLOR: #003366; BORDER-BOTTOM: #ffffff 1px groove; BACKGROUND-COLOR: #f1f1f1"/>
																			</ItemTemplate>
																		</asp:TemplateColumn>
																		<asp:TemplateColumn Visible="False" headerText="sname">
																			<ItemTemplate>
																				<asp:Label id="Label8" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.sname") %>'>
																				</asp:Label>
																			</ItemTemplate>
																		</asp:TemplateColumn>
																		<asp:TemplateColumn Visible="False" headerText="hcode">
																			<ItemTemplate>
																				<asp:Label id="hcode" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.hcode") %>'>
																				</asp:Label>
																			</ItemTemplate>
																		</asp:TemplateColumn>
																		<asp:TemplateColumn Visible="False" headerText="hname">
																			<ItemTemplate>
																				<asp:Label id="hname" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.hname") %>'>
																				</asp:Label>
																			</ItemTemplate>
																		</asp:TemplateColumn>
																		<asp:TemplateColumn Visible="False" headerText="honoo">
																			<ItemTemplate>
																				<asp:Label id="honoo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.honoo") %>'>
																				</asp:Label>
																			</ItemTemplate>
																		</asp:TemplateColumn>
																	</Columns>
																</asp:DataGrid>
																<asp:button id="Button2" runat="server" Width="100px" Text="Дvн бичих" CausesValidation="False"></asp:button><br/>
																<asp:Label id="Label6" runat="server" ForeColor="Red"></asp:Label></td>
														</tr>
														<tr>
															<td align="center">
																<asp:linkButton id="linkButton2" runat="server">буцах</asp:linkButton></td>
														</tr>
													</table>
													<div align="center">W тавих оюутны дvнг -50 оруулна</DIV>
												</asp:panel></td>
										</tr>
									</table>
								</td>
								<td valign="top" width="199"><uc1:myinfo id="Myinfo1" runat="server"></uc1:myinfo><uc1:tsalin id="Tsalin1" runat="server"></uc1:tsalin><uc1:links id="links1" runat="server"></uc1:links><uc1:nuutsug id="Nuutsug1" runat="server"></uc1:nuutsug></td>
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
