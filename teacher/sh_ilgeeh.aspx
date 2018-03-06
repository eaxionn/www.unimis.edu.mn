<%@ Register TagPrefix="uc1" TagName="nomiinsan" Src="nomiinsan.ascx" %>
<%@ Register TagPrefix="uc1" TagName="dood" Src="dood.ascx" %>
<%@ Register TagPrefix="uc1" TagName="deed" Src="deed.ascx" %>
<%@ Register TagPrefix="uc1" TagName="zaahlesson" Src="zaahlesson.ascx" %>
<%@ Page Language="vb" AutoEventWireup="false" Inherits="teacher.sh_ilgeeh" CodeFile="sh_ilgeeh.aspx.vb" %>
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
				border="0">
				<tr>
					<td style="HEIGHT: 6px"><uc1:deed id="Deed1" runat="server"></uc1:deed></td>
				</tr>
				<tr>
					<td valign="top">
						<table id="table2" cellspacing="0" cellpadding="0" width="100%" border="0">
							<tr>
								<td valign="top" width="130"><uc1:zaahlesson id="Zaahlesson1" runat="server"></uc1:zaahlesson></td>
								<td valign="top"><asp:panel id="Panel1" runat="server" HorizontalAlign="Center">
										<table id="table3" style="WIDTH: 511px; HEIGHT: 216px" cellspacing="1" cellpadding="1"
											width="511" border="0">
											<tr>
												<td style="WIDTH: 118px; HEIGHT: 1px"></td>
												<td style="HEIGHT: 1px" valign="top">Захидал&nbsp;бичих</td>
											</tr>
											<tr>
												<td style="WIDTH: 118px; HEIGHT: 58px">Хэнд
													<asp:Button id="Button5" runat="server" CausesValidation="False" Text=". . . "></asp:Button></td>
												<td style="HEIGHT: 58px" valign="top">
													<asp:ListBox id="ListBox2" runat="server" Height="80px" Width="160px"></asp:ListBox></td>
											</tr>
											<tr>
												<td style="WIDTH: 118px">Гарчиг</td>
												<td>
													<asp:TextBox id="TextBox1" runat="server" Width="304px"></asp:TextBox>
													<asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="TextBox1"></asp:RequiredFieldValidator></td>
											</tr>
											<tr>
												<td style="WIDTH: 118px; HEIGHT: 83px">Шуудан</td>
												<td style="HEIGHT: 83px">
													<asp:TextBox id="TextBox2" runat="server" Height="192px" Width="304px" TextMode="MultiLine"></asp:TextBox>
													<asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="TextBox2"></asp:RequiredFieldValidator></td>
											</tr>
											<tr>
												<td style="WIDTH: 118px">Дагалдах файл</td>
												<td><INPUT id="upfile" style="WIDTH: 280px; HEIGHT: 22px" type="file" size="27" name="uploadpicture"
														runat="server"></td>
											</tr>
											<tr>
												<td style="WIDTH: 118px"></td>
												<td>
													<asp:Button id="Button1" runat="server" Text="Илгээх" Font-Size="8pt"></asp:Button>
													<asp:Button id="Button2" runat="server" CausesValidation="False" Text="Болих" Font-Size="8pt"></asp:Button>
													<asp:Label id="Label3" runat="server" ForeColor="Red"></asp:Label></td>
											</tr>
										</table>
									</asp:panel><asp:panel id="Panel2" runat="server" HorizontalAlign="Center" Visible="False">
										<table id="table4" style="WIDTH: 369px; HEIGHT: 275px" cellspacing="1" cellpadding="1"
											width="369" border="0">
											<tr>
												<td colSpan="2">хэнд илгээхээ сонгох</td>
											</tr>
											<tr>
												<td valign="top" align="center">Илгээх хvний код:
													<asp:TextBox id="ilcode" runat="server" Width="128px"></asp:TextBox>
													<asp:Button id="Button3" runat="server" Text="Нэмэх" Font-Size="XX-Small"></asp:Button>
													<table id="table5" style="WIDTH: 187px; HEIGHT: 26px" cellspacing="1" cellpadding="1" border="0">
														<tr>
															<td>
																<asp:DropDownList id="heltes" runat="server" Width="128px" AutoPostBack="true" CssClass="textbox"></asp:DropDownList></td>
															<td>
																<asp:Button id="Button9" runat="server" Text="бvгдийг сонго" Width="80px" Font-Size="XX-Small"
																	Visible="False" CssClass="Button3"></asp:Button></td>
														</tr>
													</table>
												</td>
												<td valign="top">
													<asp:Button id="Button8" runat="server" Text="хасах" Font-Size="XX-Small"></asp:Button><br/>
													сонгогдсон хvмvvc
												</td>
											</tr>
											<tr>
												<td valign="top" align="center">
													<asp:DataGrid id="DataGrid1" runat="server" Width="200px" Font-Size="8pt" Visible="true" AutoGenerateColumns="False"
														OnPageIndexChanged="DataGrid1_Paged" AllowPaging="true" PageSize="15">
														<Columns>
															<asp:TemplateColumn Visible="False">
																<ItemTemplate>
																	<asp:Label runat="server" ID="id" Text='<%# DataBinder.Eval(Container, "DataItem.id") %>'>
																	</asp:Label>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn headerText="сонго">
																<ItemTemplate>
																	<asp:CheckBox ID="remove" Runat="server"></asp:CheckBox>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn headerText="Нэрс">
																<ItemTemplate>
																	<asp:Label runat="server" ID="names" Text='<%# DataBinder.Eval(Container, "DataItem.id")&"-"&DataBinder.Eval(Container, "DataItem.names") %>'>
																	</asp:Label>
																</ItemTemplate>
															</asp:TemplateColumn>
														</Columns>
														<PagerStyle Mode="NumericPages"></PagerStyle>
													</asp:DataGrid></td>
												<td valign="top">
													<asp:ListBox id="ListBox1" runat="server" Height="372px" Width="200px" SelectionMode="Multiple"></asp:ListBox></td>
											</tr>
											<tr>
												<td valign="top">
													<asp:Button id="Button7" runat="server" Text="сонгох" Font-Size="XX-Small" CssClass="Button3"></asp:Button></td>
												<td valign="top">
													<asp:Button id="Button4" runat="server" Text="хасах" Font-Size="XX-Small"></asp:Button></td>
											</tr>
											<tr>
												<td align="center" colSpan="2">
													<asp:Button id="Button6" runat="server" Text="сонголт дуусгах" Width="113px" Font-Size="XX-Small"></asp:Button></td>
											</tr>
										</table>
									</asp:panel><asp:panel id="Panel3" runat="server" HorizontalAlign="Center" Height="100px" Width="100%"
										Visible="False"><IMG alt="" src="images\nomail1.gif">Захидал 
            амжилттай илгээгдлээ !<br/><A href="index.aspx">буцах</A></asp:panel>
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
