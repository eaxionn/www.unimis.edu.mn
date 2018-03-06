<%@ Page Language="VB" AutoEventWireup="false" CodeFile="st_dun.aspx.vb" Inherits="st_dun" %>
<%@ Register TagPrefix="uc1" TagName="deed" Src="deed.ascx" %>
<%@ Register TagPrefix="uc1" TagName="dood" Src="dood.ascx" %>
<%@ Register TagPrefix="uc1" TagName="omnohdun" Src="omnohdun.ascx" %>
<%@ Register TagPrefix="uc1" TagName="hicheel" Src="hicheel.ascx" %>
<%@ Register TagPrefix="uc1" TagName="hichjil" Src="hichjil.ascx" %>
<%@ Register TagPrefix="uc1" TagName="song" Src="song.ascx" %>
<%@ Register TagPrefix="uc1" TagName="nuutsug" Src="nuutsug.ascx" %>
<%@ Register TagPrefix="uc1" TagName="tolbor" Src="tolbor.ascx" %>
<%@ Register TagPrefix="uc1" TagName="nomiinsan" Src="nomiinsan.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//Dtd XHTML 1.0 transitional//EN" "http://www.w3.org/tr/xhtml1/Dtd/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>student</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR" />
	<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE" />
	<meta content="JavaScript" name="vs_defaultClientScript" />
	<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema" />
	<link href="stylesss.css" rel="stylesheet" type="text/css" />
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1251" />
</head>
<body topmargin="0">
    <form id="Form1" method="post" runat="server">
        <uc1:deed id="Deed1" runat="server"></uc1:deed>
		<table width="1000" border="0" cellpadding="0" cellspacing="0" style="background-color:#ffffff" id="table1">
	    	<tr>
		      <td valign="top" align="left" style="width: 260px">
	              <uc1:hicheel id="Hicheel1" runat="server"></uc1:hicheel>
			      <uc1:song id="Song1" runat="server"></uc1:song>
			  </td>
			  <td valign="top" align="center">
				<font color="#585858"><strong>- Оюутны дvнгийн хуудас -</strong></font> 
                <asp:Label id="Label1" runat="server" Width="100%" BorderWidth="0"></asp:Label>
						<asp:datagrid id="DataGrid1" runat="server" AutoGenerateColumns="False" ShowHeader="False"  HeaderStyle-Width="100%" HeaderStyle-BorderWidth="0">
							<Columns>
								<asp:TemplateColumn HeaderStyle-Width="100%" HeaderStyle-BorderWidth="0">
									<ItemStyle font-Italic="true" font-Bold="true" ForeColor="DimGray" Width="95%" BorderWidth="0"></ItemStyle>
									<ItemTemplate >
										<asp:Label ID="Label2" runat="server" Text='<%# left(DataBinder.Eval(Container, "DataItem.aa"),9)&" оны хичээлийн жил."&iif(right(DataBinder.Eval(Container, "DataItem.aa"),1)="1","Намрын улирал","Хаврын улирал") %>'>
										</asp:Label>
										<uc1:omnohdun id="Omnohdun1" runat="server" jil='<%# DataBinder.Eval(Container.DataItem, "aa") %>'>
										</uc1:omnohdun>
									</ItemTemplate>
								</asp:TemplateColumn>
							</Columns>
						</asp:datagrid>
				</td>
				<td style="width:163px; background-image:url(images/r_back.jpg); background-color:#ffffff;" valign="top" align="center">
				<uc1:nomiinsan id="Nomiinsan1" runat="server"></uc1:nomiinsan>
				<uc1:tolbor id="Tolbor1" runat="server"></uc1:tolbor>
				<uc1:nuutsug id="Nuutsug1" runat="server"></uc1:nuutsug>
				</td>
				</tr>
                <tr><td colspan="2"></td></tr>
		  </table>
			<uc1:dood id="Dood1" runat="server"></uc1:dood>
		</form>
</body>
</html>
