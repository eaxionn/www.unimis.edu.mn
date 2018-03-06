<%@ Page Language="VB" AutoEventWireup="false" CodeFile="dun.aspx.vb" Inherits="dun" %>
<%@ Register TagPrefix="uc1" TagName="hicheel" Src="hicheel.ascx" %>
<%@ Register TagPrefix="uc1" TagName="deed" Src="deed.ascx" %>
<%@ Register TagPrefix="uc1" TagName="hichjil" Src="hichjil.ascx" %>
<%@ Register TagPrefix="uc1" TagName="dood" Src="dood.ascx" %>
<%@ Register TagPrefix="uc1" TagName="hname" Src="hname.ascx" %>
<%@ Register TagPrefix="uc1" TagName="nomiinsan" Src="nomiinsan.ascx" %>
<%@ Register TagPrefix="uc1" TagName="tolbor" Src="tolbor.ascx" %>
<%@ Register TagPrefix="uc1" TagName="nuutsug" Src="nuutsug.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//Dtd XHTML 1.0 transitional//EN" "http://www.w3.org/tr/xhtml1/Dtd/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>student</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1" />
		<meta name="vs_defaultClientScript" content="JavaScript" />
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
		<link href="style.css" rel="stylesheet" type="text/css" />
		<meta http-equiv="Content-Type" content="text/html; charset=windows-1251" />
</head>
<body topmargin="0">
    <form id="Form1" method="post" runat="server">
			<uc1:deed id="Deed1" runat="server"></uc1:deed>
			<table width="1000" border="0" cellpadding="0" cellspacing="0" style="background-color:#ffffff" id="table1">
				<tr>
					<td style="WIDTH: 184px" valign="top">
						<uc1:hicheel id="Hicheel1" runat="server"></uc1:hicheel>
					</td>
					<td valign="top"><strong><font color="#585858">- Îþóòíû äví -</font></strong>
							<br />
							<table id="table2" cellspacing="1" cellpadding="1" width="100%" border="0">
								<tr>
									<td>
										<strong><font color="#cc0000">
												<uc1:hname id="Hname1" runat="server"></uc1:hname>
										</font><strong>
												<asp:Label id="Label1" runat="server" ForeColor="#CC0000"></asp:Label></strong></strong></td>
								</tr>
								<tr>
									<td align="center">
										<asp:datagrid id="DataGrid1" runat="server" ShowFooter="true" AutoGenerateColumns="False" OnItemDataBound="Item_Bound"
											Width="95%">
											<Columns>
												<asp:TemplateColumn HeaderText="¹" HeaderStyle-Width="20">
													<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
													<ItemTemplate>
														<div align="center">
															<asp:Label id="cnt" runat="server" font-Size="9" Text='<%# cnt%>' OnDataBinding="Increaser"/>
														</div>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:BoundColumn DataField="hname" HeaderText="Ävãíýõ õýëáýð"></asp:BoundColumn>
												<asp:TemplateColumn HeaderText="Äví">
													<ItemTemplate>
														<asp:Label runat="server" ID="dun" Text='<%# DataBinder.Eval(Container, "DataItem.U503FF") %>'>
														</asp:Label>
													</ItemTemplate>
												</asp:TemplateColumn>
											</Columns>
										</asp:datagrid></td>
								</tr>
								<tr>
									<td></td>
								</tr>
							</table>
					</td>
					<td style="width:180px; background-image:url(images/r_back.jpg); background-color:#ffffff" valign="top" align="center">
						<uc1:nomiinsan id="Nomiinsan1" runat="server"></uc1:nomiinsan>
						<uc1:tolbor id="Tolbor1" runat="server"></uc1:tolbor>
						<uc1:nuutsug id="Nuutsug1" runat="server"></uc1:nuutsug>
					</td>
				</tr>
			</table>
			<uc1:dood id="Dood1" runat="server"></uc1:dood>
		</form>
</body>
</html>
