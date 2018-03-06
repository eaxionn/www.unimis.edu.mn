<%@ Page Language="VB" AutoEventWireup="false" CodeFile="songolt1.aspx.vb" Inherits="songolt1" %>

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
<script language="JavaScript" type="text/JavaScript">

function showwin(val1,val2)
{  window.location.href='hhuvaari.aspx?h='+val1+'&t='+val2;
}
</script>
<body>
    <form id="Form1" method="post" runat="server">
    <table>
        <tr>
            <td style="width: 810px">
                Оюутны код:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox1" runat="server" Width="120px"></asp:TextBox>&nbsp;&nbsp;
                <asp:Button ID="Button1" runat="server" Text="Хайх" />&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label3" runat="server" Visible="false" ForeColor="red"></asp:Label>
            </td>            
        </tr>
    </table>
	<table id="table1" cellspacing="1" cellpadding="1" width="100%" border="0">
		<tr>
			<td valign="top" style="height: 268px">						
				<asp:panel id="Panel1" runat="server">
					<table id="table2" cellspacing="1" cellpadding="1" width="100%" border="0">
						<tr>
							<td align="left" style="height: 14px">
								<asp:Label id="Label5" runat="server"></asp:Label></td>
						</tr>
						<tr>
							<td align="center">
								<asp:Label id="Label1" runat="server"></asp:Label></td>
						</tr>
						<tr>
							<td align="center">
								<asp:datagrid id="DataGrid1" runat="server" AutoGenerateColumns="False"
										Width="100%" ShowFooter="true">
										<HeaderStyle BackColor="#B3D8FD"></HeaderStyle>
										<Columns>
											<asp:TemplateColumn HeaderText="№">
												<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
												<ItemTemplate>
													<div align="center">
														<asp:Label id="cnt" runat="server" Text='<%# cnt%>' OnDataBinding="Increaser"/>
													</div>
												</ItemTemplate>
											</asp:TemplateColumn>
											<asp:BoundColumn DataField="U0362DD" HeaderText="Хич.код"></asp:BoundColumn>
											<asp:BoundColumn Visible="False" DataField="U0362EE" HeaderText="tcode"></asp:BoundColumn>
											<asp:BoundColumn Visible="False" DataField="U035GG" HeaderText="lecture"></asp:BoundColumn>
											<asp:BoundColumn Visible="False" DataField="U035HH" HeaderText="semnar"></asp:BoundColumn>
											<asp:BoundColumn Visible="False" DataField="U035II" HeaderText="labrat"></asp:BoundColumn>
											<asp:BoundColumn Visible="False" DataField="U0362KK" HeaderText="l_1"></asp:BoundColumn>
											<asp:BoundColumn Visible="False" DataField="U0362LL" HeaderText="s_1"></asp:BoundColumn>
											<asp:BoundColumn Visible="False" DataField="U0362MM" HeaderText="l_1"></asp:BoundColumn>
											<asp:BoundColumn Visible="False" DataField="U0362NN" HeaderText="b_1"></asp:BoundColumn>
											<asp:BoundColumn DataField="U035DD" HeaderText="Нэр">
												<FooterStyle HorizontalAlign="Right"></FooterStyle>
											</asp:BoundColumn>
											<asp:TemplateColumn HeaderText="Багш">
												<ItemTemplate>
												    <asp:DropDownList id="DropDownList1" Width="160px" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlGroup_SelectedIndexChanged" OnLoad="ddlGroup_load"></asp:DropDownList>
												</ItemTemplate>
											</asp:TemplateColumn>
											<asp:TemplateColumn HeaderText="Лекц">
												<ItemTemplate>
													<asp:DropDownList id="DropDownList2" Font-Size="X-Small" runat="server" AutoPostBack="true" OnSelectedIndexChanged="lk_SelectedIndexChanged"></asp:DropDownList>
												</ItemTemplate>
											</asp:TemplateColumn>
											
											<asp:TemplateColumn HeaderText="Семинар">
												<ItemTemplate>
													<asp:DropDownList id="DropDownList3" Font-Size="X-Small" runat="server"></asp:DropDownList>
												</ItemTemplate>
											</asp:TemplateColumn>
											
											<asp:TemplateColumn HeaderText="Лаборатори">
												<ItemTemplate>
													<asp:DropDownList id="DropDownList4" Font-Size="X-Small" runat="server"></asp:DropDownList>
												</ItemTemplate>
											</asp:TemplateColumn>
											
											<asp:BoundColumn DataField="U035EE" HeaderText="Кредит">
												<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
												<ItemStyle HorizontalAlign="Center"></ItemStyle>
												<FooterStyle HorizontalAlign="Center"></FooterStyle>
											</asp:BoundColumn>
											<asp:TemplateColumn HeaderText="хасах">
												<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
												<ItemStyle HorizontalAlign="Center"></ItemStyle>
												<ItemTemplate>
													<asp:CheckBox id="CheckBox1" runat="server"></asp:CheckBox>
												</ItemTemplate>
											</asp:TemplateColumn>											
										
										</Columns>
									</asp:datagrid>
								<asp:label id="Label4" runat="server" ForeColor="Red"></asp:label><br />
								<asp:label id="Label2" runat="server" ForeColor="Red"></asp:label></td>
						</tr>
						<tr>
							<td align="center">
								<table id="table4" cellspacing="1" cellpadding="1" width="100%" border="0">
									<tr>
										<td style="WIDTH: 239px" align="left">
											<asp:Button id="Button2" runat="server" Text="Гарах"></asp:Button>
											</td>
										<td align="left">
											<asp:Button id="Button3" runat="server" Text="Сонголт хадгалах"></asp:Button>&nbsp;&nbsp;&nbsp;&nbsp;
											<asp:Button id="print1" runat="server" Text="Хичээлийн хуваарь хэвлэх" Width="200px"></asp:Button>
											</td>
										<td align="right">
											<asp:Button id="Button4" runat="server" Width="48px" Text="хасах"></asp:Button></td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</asp:panel></td>
		    </tr>
	    </table>
	</form>
</body>
</html>
