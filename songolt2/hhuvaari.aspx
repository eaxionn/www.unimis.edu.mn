<%@ Page Language="VB" AutoEventWireup="false" CodeFile="hhuvaari.aspx.vb" Inherits="hhuvaari" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>student</title>
	<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR" />
	<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE" />
	<meta content="JavaScript" name="vs_defaultClientScript" />
	<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema" />
	<link href="stylesss.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="formm" runat="server">        
        <table border="0" cellpadding="0" cellspacing="0" style="width:660px">
            <tr><td valign="top" style="height: 14px">
                <asp:Label ID="Label2" Font-Size="12px" runat="server" Text="Label"></asp:Label>                
            </td>
            <td style="height: 14px"><asp:Label ID="Label1" Font-Size="12px" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td valign="top" align="left" style="height: 142px" colspan="2">
                <br />
                <asp:datagrid id="DataGrid1" runat="server" AutoGenerateColumns="False"
					Width="100%" ShowFooter="true">
					<HeaderStyle BackColor="#B3D8FD"></HeaderStyle>
					<Columns>
						<asp:BoundColumn DataField="garig" HeaderText="Гариг"></asp:BoundColumn>
						<asp:BoundColumn DataField="LTIME" HeaderText="Цаг"></asp:BoundColumn>
						<asp:BoundColumn DataField="LESSON_KOD" HeaderText="Хич.код"></asp:BoundColumn>
						<asp:BoundColumn DataField="U035DD" HeaderText="Хич.нэр"></asp:BoundColumn>
						<asp:BoundColumn DataField="helber" HeaderText="Хич.хэлбэр"></asp:BoundColumn>
						<asp:BoundColumn DataField="room" HeaderText="Анги"></asp:BoundColumn>
						<asp:BoundColumn HeaderText="Багш.код" DataField="LTEACHER"></asp:BoundColumn>
						<asp:BoundColumn HeaderText="Багш.нэр" DataField="tname"></asp:BoundColumn>	
						<asp:BoundColumn HeaderText="Тайлбар" DataField="LDESC"></asp:BoundColumn>
					</Columns>
				</asp:datagrid>
				    <br />
				    <asp:Button ID="Button1" runat="server" Text="Буцах" />
                    <asp:Button ID="Button2" runat="server" Text="Хэвлэх" OnClientClick="javascript:window.print();" />
                </td>
            </tr>
            <tr><td colspan="2">
                <br /><br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label7" runat="server" Font-Size="12px" Text=""></asp:Label><br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label6" runat="server" Font-Size="12px"></asp:Label><br /><br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label3" runat="server" Font-Size="12px" Text="Сонголт хийсэн оюутны гарын vсэг:" ></asp:Label><br /><br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label4" runat="server" Font-Size="12px" Text="Сонголтыг баталгаажуулсан багшийн гарын vсэг:" ></asp:Label><br />
            </td></tr>
        </table>
    </form>
</body>
</html>
