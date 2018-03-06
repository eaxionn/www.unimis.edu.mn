<%@ Page Language="VB" AutoEventWireup="false" CodeFile="TsagiinHuviarNers.aspx.vb" Inherits="TsagiinHuviarNers" %>
<%@ Register TagPrefix="uc1" TagName="links" Src="links.ascx" %>
<%@ Register TagPrefix="uc1" TagName="tsalin" Src="tsalin.ascx" %>
<%@ Register TagPrefix="uc1" TagName="myinfo" Src="myinfo.ascx" %>
<%@ Register TagPrefix="uc1" TagName="tolbor" Src="tolbor.ascx" %>
<%@ Register TagPrefix="uc1" TagName="huvaari" Src="huvaari.ascx" %>
<%@ Register TagPrefix="uc1" TagName="zaahlesson" Src="zaahlesson.ascx" %>
<%@ Register TagPrefix="uc1" TagName="deed" Src="deed.ascx" %>
<%@ Register TagPrefix="uc1" TagName="dood" Src="dood.ascx" %>
<%@ Register TagPrefix="uc1" TagName="nomiinsan" Src="nomiinsan.ascx" %>
<%@ Register TagPrefix="uc1" TagName="nuutsug" Src="nuutsug.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Багшийн програм</title>
	<meta http-equiv="Content-Type" content="text/html; charset=windows-1251" />
	<style type="text/css" media="screen"></style>
	<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR" />
	<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE" />
	<meta content="JavaScript" name="vs_defaultClientScript" />
	<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema" />
	<link href="style.css" type="text/css" rel="stylesheet">
	<link href="style.css" type="text/css" rel="stylesheet">
    <link href="web_default.css" rel="stylesheet" type="text/css" />
    <link href="web_default.css" rel="stylesheet" type="text/css" />
    <link href="web_default.css" rel="stylesheet" type="text/css" />
    <link href="web_default.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="Form1" method="post" runat="server">
		<table id="table1" style="WIDTH: 937px; HEIGHT: 524px" height="524" cellspacing="0" cellpadding="0"
			width="937" align="center" bgColor="#ffffff" border="0">
			<tr>
				<td style="HEIGHT: 1px" width="100"><uc1:deed id="Deed1" runat="server"></uc1:deed></td>
			</tr>
			<tr>
				<td style="HEIGHT: 400px" valign="top">
					<table id="table2" height="100%" cellspacing="0" cellpadding="0" width="100%" border="0">
						<tr>
							<td valign="top" width="150" background="images/r_back.jpg">
							    <uc1:zaahlesson id="Zaahlesson1" runat="server"></uc1:zaahlesson>
							    <uc1:huvaari id="Huvaari1" runat="server"></uc1:huvaari>
							</td>
							<td valign="top" align="center">&nbsp;
                                <asp:Label ID="Label1" runat="server" ForeColor="red" Text="Оюутны хичээл сонголт 2 бүрэн дууссаны дараа оюутны нэрсийг хэвлэж авна уу."></asp:Label>
							    <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" GridLines="Both"
                                    Width="400px" AllowPaging="True" PageSize="30">
                                    <Columns>
                                        <asp:TemplateColumn headerText="№">
			                                <headerStyle HorizontalAlign="Center"></headerStyle>
			                                <ItemTemplate>
			                                <asp:Label id="cnt" runat="server" OnDataBinding="Increaser" Text="<%# cnt%>">
			                                </asp:Label>
			                                </ItemTemplate>
	                                    </asp:TemplateColumn>
                                        <asp:BoundColumn DataField="StudentCode" HeaderText="Оюутны код">
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle Font-Bold="True" />
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="StudentFullName" HeaderText="Оюутны нэр">
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle Font-Bold="True" />
                                        </asp:BoundColumn>
                                    </Columns>
                                    <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                                    <PagerStyle Mode="NumericPages" HorizontalAlign="Center" />
                                </asp:DataGrid>
                                <asp:Button ID="Button1" runat="server" Text="Хэвлэх" />
							</td>
							<td valign="top" align="center" width="180" background="images/r_back.jpg" bgColor="#ffffff"><uc1:myinfo id="Myinfo1" runat="server"></uc1:myinfo><uc1:tsalin id="Tsalin1" runat="server"></uc1:tsalin><br/>
								<uc1:links id="links1" runat="server"></uc1:links><uc1:nuutsug id="Nuutsug1" runat="server"></uc1:nuutsug></td>
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
