<%@ Page Language="VB" AutoEventWireup="false" CodeFile="print.aspx.vb" Inherits="print" %>
<%@ Register TagPrefix="uc1" TagName="stulist" Src="studentlist.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Оюутны нэрсийн жагсаалт</title>
    <link href="style.css" type="text/css" rel="stylesheet">
	<link href="style.css" type="text/css" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width: 300px">
            <tr>
                <td style="width: 150px">
                    <b>Хичээлийн код: &nbsp;</b><i><asp:Label ID="Label1" runat="server"></asp:Label></i></td>
                 <td style="width: 150px">
                     <b>Багшийн код: &nbsp;</b><i><asp:Label ID="Label2" runat="server"></asp:Label></i> </td>
            </tr>
            <tr>
                <td style="width: 150px">
                   <b>Цаг:&nbsp; </b><i><asp:Label ID="Label3" runat="server"></asp:Label></i> </td>
                     <td style="width: 150px">
                     <b>Хэлбэр:</b> &nbsp;<i><asp:Label ID="Label4" runat="server"></asp:Label></i></td>
            </tr>
            <tr>
                <td style="width: 100px" colspan=2>
                    <asp:DataGrid ID="DataGrid1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                        GridLines="Both" PageSize="50" Width="300px">
                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" />
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                        <Columns>
                            <asp:TemplateColumn HeaderText="№">
                                <ItemTemplate>
                                    <div align="center">
                                        <asp:Label ID="cnt" runat="server" OnDataBinding="Increaser" Text="<%# cnt%>">
			            </asp:Label></div>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:TemplateColumn>
                            <asp:BoundColumn DataField="StudentCode" HeaderText="Оюутны код">
                                <ItemStyle HorizontalAlign="Left" />
                                <HeaderStyle Font-Bold="True" />
                            </asp:BoundColumn>
                            <asp:BoundColumn DataField="StudentFullName" HeaderText="Оюутны нэр">
                                <ItemStyle HorizontalAlign="Left" />
                                <HeaderStyle Font-Bold="True" />
                            </asp:BoundColumn>
                        </Columns>
                    </asp:DataGrid></td>
            </tr>
            <tr><td colspan="2">
                <asp:Label ID="niit" runat="server"></asp:Label>
            </td></tr>
            <tr>
                <td align="right"  style="width: 45px">
                    <asp:Button ID="Button1" runat="server" Text="Хэвлэх" OnClientClick="javascript:window.print();"/>
                   </td>
                   <td align="left"  style="width: 50px">
                    <asp:Button ID="Button2" runat="server" Text="Буцах" />
                   </td>
            </tr>
        </table>
        &nbsp;&nbsp;
    </div>
    </form>
</body>
</html>
