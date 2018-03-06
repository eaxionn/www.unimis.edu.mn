<%@ Register TagPrefix="uc1" TagName="zaahlesson" Src="zaahlesson.ascx" %>
<%@ Register TagPrefix="uc1" TagName="deed" Src="deed.ascx" %>
<%@ Register TagPrefix="uc1" TagName="dood" Src="dood.ascx" %>
<%@ Register TagPrefix="uc1" TagName="nomiinsan" Src="nomiinsan.ascx" %>
<%@ Register TagPrefix="uc1" TagName="nuutsug" Src="nuutsug.ascx" %>
<%@ Page Language="vb" AutoEventWireup="false" Inherits="teacher.songolt" CodeFile="songolt.aspx.vb" %>
<html>
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
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</head>
	<body bottomMargin="0" leftMargin="0" topMargin="0" rightMargin="0">
		<form id="Form1" method="post" runat="server">
			<table id="table1" cellspacing="0" cellpadding="0" width="1020" align="center" border="0">
				<tr>
					<td style="HEIGHT: 6px"><uc1:deed id="Deed1" runat="server"></uc1:deed></td>
				</tr>
				<tr>
					<td valign="top">
						<table id="table2" cellspacing="1" cellpadding="1" border="0" align="center">
							<tr>
								<td colSpan="3"><asp:label id="Label1" runat="server"></asp:label></td>
							</tr>
							<tr>
								<td style="WIDTH: 216px"></td>
								<td style="WIDTH: 288px"><asp:dropdownlist id="DropDownList1" runat="server" AutoPostBack="true" Width="185px"></asp:dropdownlist></td>
								<td></td>
							</tr>
							<tr>
								<td style="WIDTH: 216px; HEIGHT: 18px">Тус хичээл сонгосон багшаа 
									сонгоогvй&nbsp;оюутнууд</td>
								<td style="WIDTH: 288px; HEIGHT: 18px">хичээлийн хуваарь сонгоогvй оюутнууд
									<asp:label id="Label7" runat="server" ForeColor="Red"></asp:label></td>
								<td style="HEIGHT: 18px"><asp:label id="Label6" runat="server"></asp:label></td>
							</tr>
							<tr>
								<td style="WIDTH: 216px" valign="top">
									<table id="table5" cellspacing="1" cellpadding="1" border="1">
										<tr>
											<td><asp:button id="Button6" runat="server" Width="136px" Text="еерийг сонгуулах"></asp:button></td>
										</tr>
										<tr>
											<td><asp:listbox id="ListBox1" runat="server" SelectionMode="Multiple"></asp:listbox></td>
										</tr>
										<tr>
											<td><asp:label id="Label4" runat="server"></asp:label></td>
										</tr>
									</table>
								</td>
								<td style="WIDTH: 288px" valign="top">
									<table id="table4" cellspacing="1" cellpadding="1" width="100%" border="1">
										<tr>
											<td><asp:button id="Button1" runat="server" Text="грvпэд нэмэх"></asp:button><asp:button id="Button7" runat="server" Text="буцах"></asp:button><asp:label id="Label5" runat="server" ForeColor="Red"></asp:label></td>
										</tr>
										<tr>
											<td valign="top"><asp:listbox id="ListBox2" runat="server" SelectionMode="Multiple"></asp:listbox></td>
										</tr>
										<tr>
											<td><asp:button id="Button3" runat="server" Width="112px" Text="грvпэд нэмэх"></asp:button><asp:button id="Button5" runat="server" Width="128px" Text="сонголтоос хасах"></asp:button></td>
										</tr>
										<tr>
											<td><asp:label id="Label2" runat="server"></asp:label></td>
										</tr>
									</table>
								</td>
								<td valign="top">
									<table id="table3" cellspacing="1" cellpadding="1" border="1">
										<tr>
											<td><asp:button id="Button2" runat="server" Text="хасах"></asp:button></td>
										</tr>
										<tr>
											<td><asp:listbox id="ListBox3" runat="server" SelectionMode="Multiple"></asp:listbox></td>
										</tr>
										<tr>
											<td><asp:button id="Button4" runat="server" Text="хасах"></asp:button></td>
										</tr>
										<tr>
											<td><asp:label id="Label3" runat="server"></asp:label></td>
										</tr>
									</table>
									<br/>
								</td>
							</tr>
							<tr>
								<td style="WIDTH: 216px"></td>
								<td style="WIDTH: 288px">
									<asp:Label id="strsql" runat="server"></asp:Label></td>
								<td>
									<asp:Label id="strsql1" runat="server"></asp:Label></td>
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
