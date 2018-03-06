<%@ Page Language="VB" AutoEventWireup="false" CodeFile="songolt.aspx.vb" Inherits="songolt" %>
<%@ Register TagPrefix="uc1" TagName="dood" Src="dood.ascx" %>
<%@ Register TagPrefix="uc1" TagName="omnohdun" Src="omnohdun.ascx" %>
<%@ Register TagPrefix="uc1" TagName="hicheel" Src="hicheel.ascx" %>
<%@ Register TagPrefix="uc1" TagName="deed" Src="deed.ascx" %>
<%@ Register TagPrefix="uc1" TagName="hichjil" Src="hichjil.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//Dtd XHTML 1.0 transitional//EN" "http://www.w3.org/tr/xhtml1/Dtd/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>student</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR" />
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE" />
		<meta content="JavaScript" name="vs_defaultClientScript" />
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema" />
		<link href="stylesss.css" rel="stylesheet" type="text/css" />
</head>
<body >
		<form id="Form1" method="post" runat="server">
			<uc1:deed id="Deed1" runat="server"></uc1:deed>
			<table id="table1" cellspacing="1" cellpadding="1" width="100%" border="0">
				<tr>
					<td valign="top">
						<table id="table3" cellspacing="1" cellpadding="1" width="100%" border="0">
							<tr>
								<td align="center"><asp:label id="Label2" runat="server"></asp:label></td>
							</tr>
							<tr>
								<td><asp:hyperlink id="HyperLink1" runat="server">Оюутанд санал болгох толовлогоо харах</asp:hyperlink></td>
							</tr>
							<tr>
								<td align="right">
									<table cellspacing="0" cellpadding="0" width="172" border="0" style="WIDTH: 172px; HEIGHT: 33px; background-color:#eeeeee">
										<tr>
											<td style="WIDTH: 13px"><font face="Arial, Helvetica, sans-serif" color="#660000" size="1"><b>&nbsp;Тайлбар:&nbsp;&nbsp;
													</b></font><font face="Arial, Helvetica, sans-serif" size="1">&nbsp; </font>
											</td>
											<td style="width:20px">
												<asp:CheckBox id="CheckBox10" runat="server" Text="vзсэн хичээл" Width="117px" Enabled="False"></asp:CheckBox>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
						<table id="table2" cellspacing="1" cellpadding="1" width="100%" border="0">
							<tr>
								<td align="center"><font color="#3300cc">- Дээд боловсролын суурь хичээлvvд -<br />
										<asp:label id="Label4" runat="server" font-Bold="true" ForeColor="Red"></asp:label></font></td>
							</tr>
							<tr>
								<td align="center">
									<asp:button id="Button4" runat="server" Text="Сонголт оруулах"></asp:button>
									<asp:button id="Button3" runat="server" Text="Буцах"></asp:button></td>
							</tr>
							<tr>
								<td><font size="2"><font color="#000066">А.Заавал суралцах хичээлvvд </font></font>
								</td>
							</tr>
							<tr>
								<td><asp:datagrid id="DataGrid1" runat="server" OnItemDataBound="Item_Bound1" AutoGenerateColumns="False"
										Width="100%">
										<HeaderStyle BackColor="#B3D8FD"></HeaderStyle>
										<Columns>
											<asp:BoundColumn Visible="False" DataField="U0322CC"></asp:BoundColumn>
											<asp:BoundColumn DataField="U0322DD" HeaderText="Хич.код"></asp:BoundColumn>
											<asp:BoundColumn DataField="U035DD" HeaderText="Нэр"></asp:BoundColumn>
											<asp:BoundColumn DataField="U035EE" HeaderText="Кредит"></asp:BoundColumn>
											<asp:BoundColumn DataField="U035FF" HeaderText="О.холбоо"></asp:BoundColumn>
											<asp:BoundColumn DataField="U0322HH" HeaderText="Улирал"></asp:BoundColumn>
											<asp:TemplateColumn HeaderText="Сонго">
												<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
												<ItemStyle HorizontalAlign="Center"></ItemStyle>
												<ItemTemplate>
													<asp:CheckBox id="CheckBox1" runat="server"></asp:CheckBox>
												</ItemTemplate>
											</asp:TemplateColumn>
											<asp:BoundColumn Visible="False" DataField="omnouzsen" HeaderText="omnouzsen"></asp:BoundColumn>
											<asp:BoundColumn Visible="False" DataField="songoson" HeaderText="songoson"></asp:BoundColumn>
											<asp:BoundColumn Visible="false" DataField="uu" HeaderText="uliral"></asp:BoundColumn>
										</Columns>
									</asp:datagrid></td>
							</tr>
							<tr>
								<td><font size="2"><font color="#000066">Б.Сонгон суралцах хичээлvvд</font></font>
								</td>
							</tr>
							<tr>
								<td><asp:datagrid id="Datagrid2" runat="server" OnItemDataBound="Item_Bound2" AutoGenerateColumns="False"
										Width="100%">
										<HeaderStyle BackColor="#B3D8FD"></HeaderStyle>
										<Columns>
											<asp:BoundColumn DataField="U0322DD" HeaderText="Хич.код"></asp:BoundColumn>
											<asp:BoundColumn DataField="U035DD" HeaderText="Нэр"></asp:BoundColumn>
											<asp:BoundColumn DataField="U035EE" HeaderText="Кредит"></asp:BoundColumn>
											<asp:BoundColumn DataField="U035FF" HeaderText="О.холбоо"></asp:BoundColumn>
											<asp:BoundColumn DataField="U0322HH" HeaderText="Улирал"></asp:BoundColumn>
											<asp:TemplateColumn HeaderText="Сонго">
												<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
												<ItemStyle HorizontalAlign="Center"></ItemStyle>
												<ItemTemplate>
													<asp:CheckBox id="Checkbox2" runat="server"></asp:CheckBox>
												</ItemTemplate>
											</asp:TemplateColumn>
											<asp:BoundColumn Visible="False" DataField="omnouzsen" HeaderText="omnouzsen"></asp:BoundColumn>
											<asp:BoundColumn Visible="False" DataField="songoson" HeaderText="songoson"></asp:BoundColumn>
											<asp:BoundColumn Visible="false" DataField="uu" HeaderText="uliral"></asp:BoundColumn>
										</Columns>
									</asp:datagrid></td>
							</tr>
							<tr>
								<td align="center"><font color="#3300cc">-Мэргэжлийн суурь хичээлvvд-</font></td>
							</tr>
							<tr>
								<td><font size="2"><font color="#000066">А.Заавал суралцах хичээлvvд</font></font>
								</td>
							</tr>
							<tr>
								<td><asp:datagrid id="Datagrid3" runat="server" OnItemDataBound="Item_Bound3" AutoGenerateColumns="False"
										Width="100%">
										<HeaderStyle BackColor="#B3D8FD"></HeaderStyle>
										<Columns>
											<asp:BoundColumn DataField="U0322DD" HeaderText="Хич.код"></asp:BoundColumn>
											<asp:BoundColumn DataField="U035DD" HeaderText="Нэр"></asp:BoundColumn>
											<asp:BoundColumn DataField="U035EE" HeaderText="Кредит"></asp:BoundColumn>
											<asp:BoundColumn DataField="U035FF" HeaderText="О.холбоо"></asp:BoundColumn>
											<asp:BoundColumn DataField="U0322HH" HeaderText="Улирал"></asp:BoundColumn>
											<asp:TemplateColumn HeaderText="Сонго">
												<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
												<ItemStyle HorizontalAlign="Center"></ItemStyle>
												<ItemTemplate>
													<asp:CheckBox id="Checkbox3" runat="server"></asp:CheckBox>
												</ItemTemplate>
											</asp:TemplateColumn>
											<asp:BoundColumn Visible="False" DataField="omnouzsen" HeaderText="omnouzsen"></asp:BoundColumn>
											<asp:BoundColumn Visible="False" DataField="songoson" HeaderText="songoson"></asp:BoundColumn>
											<asp:BoundColumn Visible="false" DataField="uu" HeaderText="uliral"></asp:BoundColumn>
										</Columns>
									</asp:datagrid></td>
							</tr>
							<tr>
								<td><font size="2"><font color="#000066">Б.Сонгон суралцах хичээлvvд</font></font></td>
							</tr>
							<tr>
								<td><asp:datagrid id="Datagrid4" runat="server" OnItemDataBound="Item_Bound4" AutoGenerateColumns="False"
										Width="100%">
										<HeaderStyle BackColor="#B3D8FD"></HeaderStyle>
										<Columns>
											<asp:BoundColumn DataField="U0322DD" HeaderText="Хич.код"></asp:BoundColumn>
											<asp:BoundColumn DataField="U035DD" HeaderText="Нэр"></asp:BoundColumn>
											<asp:BoundColumn DataField="U035EE" HeaderText="Кредит"></asp:BoundColumn>
											<asp:BoundColumn DataField="U035FF" HeaderText="О.холбоо"></asp:BoundColumn>
											<asp:BoundColumn DataField="U0322HH" HeaderText="Улирал"></asp:BoundColumn>
											<asp:TemplateColumn HeaderText="Сонго">
												<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
												<ItemStyle HorizontalAlign="Center"></ItemStyle>
												<ItemTemplate>
													<asp:CheckBox id="Checkbox4" runat="server"></asp:CheckBox>
												</ItemTemplate>
											</asp:TemplateColumn>
											<asp:BoundColumn Visible="False" DataField="omnouzsen" HeaderText="omnouzsen"></asp:BoundColumn>
											<asp:BoundColumn Visible="False" DataField="songoson" HeaderText="songoson"></asp:BoundColumn>
											<asp:BoundColumn Visible="false" DataField="uu" HeaderText="uliral"></asp:BoundColumn>
										</Columns>
									</asp:datagrid></td>
							</tr>
							<tr>
								<td><font size="2"><font color="#000066">C.Дадлага</font></font></td>
							</tr>
							<tr>
								<td><asp:datagrid id="Datagrid5" runat="server" OnItemDataBound="Item_Bound5" AutoGenerateColumns="False"
										Width="100%">
										<HeaderStyle BackColor="#B3D8FD"></HeaderStyle>
										<Columns>
											<asp:BoundColumn DataField="U0322DD" HeaderText="Хич.код"></asp:BoundColumn>
											<asp:BoundColumn DataField="U035DD" HeaderText="Нэр"></asp:BoundColumn>
											<asp:BoundColumn DataField="U035EE" HeaderText="Кредит"></asp:BoundColumn>
											<asp:BoundColumn DataField="U035FF" HeaderText="О.холбоо"></asp:BoundColumn>
											<asp:BoundColumn DataField="U0322HH" HeaderText="Улирал"></asp:BoundColumn>
											<asp:TemplateColumn HeaderText="Сонго">
												<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
												<ItemStyle HorizontalAlign="Center"></ItemStyle>
												<ItemTemplate>
													<asp:CheckBox id="Checkbox5" runat="server"></asp:CheckBox>
												</ItemTemplate>
											</asp:TemplateColumn>
											<asp:BoundColumn Visible="False" DataField="omnouzsen" HeaderText="omnouzsen"></asp:BoundColumn>
											<asp:BoundColumn Visible="False" DataField="songoson" HeaderText="songoson"></asp:BoundColumn>
											<asp:BoundColumn Visible="false" DataField="uu" HeaderText="uliral"></asp:BoundColumn>
										</Columns>
									</asp:datagrid></td>
							</tr>
							<tr>
								<td>
									<div align="center"><font color="#3300cc">Мэргэжлийн хичээлvvд</font></div>
								</td>
							</tr>
							<tr>
								<td><font size="2"><font color="#000066">А.Заавал суралцах хичээлvvд</font></font></td>
							</tr>
							<tr>
								<td><asp:datagrid id="Datagrid6" runat="server" OnItemDataBound="Item_Bound6" AutoGenerateColumns="False"
										Width="100%">
										<HeaderStyle BackColor="#B3D8FD"></HeaderStyle>
										<Columns>
											<asp:BoundColumn DataField="U0322DD" HeaderText="Хич.код"></asp:BoundColumn>
											<asp:BoundColumn DataField="U035DD" HeaderText="Нэр"></asp:BoundColumn>
											<asp:BoundColumn DataField="U035EE" HeaderText="Кредит"></asp:BoundColumn>
											<asp:BoundColumn DataField="U035FF" HeaderText="О.холбоо"></asp:BoundColumn>
											<asp:BoundColumn DataField="U0322HH" HeaderText="Улирал"></asp:BoundColumn>
											<asp:TemplateColumn HeaderText="Сонго">
												<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
												<ItemStyle HorizontalAlign="Center"></ItemStyle>
												<ItemTemplate>
													<asp:CheckBox id="Checkbox6" runat="server"></asp:CheckBox>
												</ItemTemplate>
											</asp:TemplateColumn>
											<asp:BoundColumn Visible="False" DataField="omnouzsen" HeaderText="omnouzsen"></asp:BoundColumn>
											<asp:BoundColumn Visible="False" DataField="songoson" HeaderText="songoson"></asp:BoundColumn>
											<asp:BoundColumn Visible="false" DataField="uu" HeaderText="uliral"></asp:BoundColumn>
										</Columns>
									</asp:datagrid></td>
							</tr>
							<tr>
								<td><font size="2"><font color="#000066">Б.Сонгон суралцах хичээлvvд</font></font></td>
							</tr>
							<tr>
								<td><asp:datagrid id="Datagrid7" runat="server" OnItemDataBound="Item_Bound7" AutoGenerateColumns="False"
										Width="100%">
										<HeaderStyle BackColor="#B3D8FD"></HeaderStyle>
										<Columns>
											<asp:BoundColumn DataField="U0322DD" HeaderText="Хич.код"></asp:BoundColumn>
											<asp:BoundColumn DataField="U035DD" HeaderText="Нэр"></asp:BoundColumn>
											<asp:BoundColumn DataField="U035EE" HeaderText="Кредит"></asp:BoundColumn>
											<asp:BoundColumn DataField="U035FF" HeaderText="О.холбоо"></asp:BoundColumn>
											<asp:BoundColumn DataField="U0322HH" HeaderText="Улирал"></asp:BoundColumn>
											<asp:TemplateColumn HeaderText="Сонго">
												<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
												<ItemStyle HorizontalAlign="Center"></ItemStyle>
												<ItemTemplate>
													<asp:CheckBox id="Checkbox7" runat="server"></asp:CheckBox>
												</ItemTemplate>
											</asp:TemplateColumn>
											<asp:BoundColumn Visible="False" DataField="omnouzsen" HeaderText="omnouzsen"></asp:BoundColumn>
											<asp:BoundColumn Visible="False" DataField="songoson" HeaderText="songoson"></asp:BoundColumn>
											<asp:BoundColumn Visible="false" DataField="uu" HeaderText="uliral"></asp:BoundColumn>
										</Columns>
									</asp:datagrid></td>
							</tr>
							<tr>
								<td><font size="2"><font color="#000066">C.Дадлага</font></font></td>
							</tr>
							<tr>
								<td><asp:datagrid id="Datagrid8" runat="server" OnItemDataBound="Item_Bound8" AutoGenerateColumns="False"
										Width="100%">
										<HeaderStyle BackColor="#B3D8FD"></HeaderStyle>
										<Columns>
											<asp:BoundColumn DataField="U0322DD" HeaderText="Хич.код"></asp:BoundColumn>
											<asp:BoundColumn DataField="U035DD" HeaderText="Нэр"></asp:BoundColumn>
											<asp:BoundColumn DataField="U035EE" HeaderText="Кредит"></asp:BoundColumn>
											<asp:BoundColumn DataField="U035FF" HeaderText="О.холбоо"></asp:BoundColumn>
											<asp:BoundColumn DataField="U0322HH" HeaderText="Улирал"></asp:BoundColumn>
											<asp:TemplateColumn HeaderText="Сонго">
												<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
												<ItemStyle HorizontalAlign="Center"></ItemStyle>
												<ItemTemplate>
													<asp:CheckBox id="Checkbox8" runat="server"></asp:CheckBox>
												</ItemTemplate>
											</asp:TemplateColumn>
											<asp:BoundColumn Visible="False" DataField="omnouzsen" HeaderText="omnouzsen"></asp:BoundColumn>
											<asp:BoundColumn Visible="False" DataField="songoson" HeaderText="songoson"></asp:BoundColumn>
											<asp:BoundColumn Visible="false" DataField="uu" HeaderText="uliral"></asp:BoundColumn>
										</Columns>
									</asp:datagrid></td>
							</tr>
							<tr>
								<td><font color="#000066" size="2">D.Дипломын ажил тєсєл</font></td>
							</tr>
							<tr>
								<td><asp:datagrid id="Datagrid9" runat="server" OnItemDataBound="Item_Bound9" AutoGenerateColumns="False"
										Width="100%">
										<HeaderStyle BackColor="#B3D8FD"></HeaderStyle>
										<Columns>
											<asp:BoundColumn DataField="U0322DD" HeaderText="Хич.код"></asp:BoundColumn>
											<asp:BoundColumn DataField="U035DD" HeaderText="Нэр"></asp:BoundColumn>
											<asp:BoundColumn DataField="U035EE" HeaderText="Кредит"></asp:BoundColumn>
											<asp:BoundColumn DataField="U035FF" HeaderText="О.холбоо"></asp:BoundColumn>
											<asp:BoundColumn DataField="U0322HH" HeaderText="Улирал"></asp:BoundColumn>
											<asp:TemplateColumn HeaderText="Сонго">
												<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
												<ItemStyle HorizontalAlign="Center"></ItemStyle>
												<ItemTemplate>
													<asp:CheckBox id="Checkbox9" runat="server"></asp:CheckBox>
												</ItemTemplate>
											</asp:TemplateColumn>
											<asp:BoundColumn Visible="False" DataField="omnouzsen" HeaderText="omnouzsen"></asp:BoundColumn>
											<asp:BoundColumn Visible="False" DataField="songoson" HeaderText="songoson"></asp:BoundColumn>
											<asp:BoundColumn Visible="false" DataField="uu" HeaderText="uliral"></asp:BoundColumn>
										</Columns>
									</asp:datagrid></td>
							</tr>
							<tr>
								<td align="center"><asp:label id="Label3" runat="server" font-Bold="true" ForeColor="Red"></asp:label></td>
							</tr>
							<tr>
								<td align="center"><asp:button id="Button1" runat="server" Text="Сонголт оруулах"></asp:button><asp:button id="Button2" runat="server" Text="Буцах"></asp:button></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<uc1:dood id="Dood1" runat="server"></uc1:dood>
		</form>
	</body>
</html>
