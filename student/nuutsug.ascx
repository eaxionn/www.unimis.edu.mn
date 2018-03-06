<%@ Control Language="VB" AutoEventWireup="false" CodeFile="nuutsug.ascx.vb" Inherits="nuutsug" %>
<link href="style.css" rel="stylesheet" type="text/css">
<asp:panel id="Panel3" runat="server" BackColor="WhiteSmoke" CssClass="hlink" Width="165" HorizontalAlign="Center">
	<asp:LinkButton id="LinkButton1" runat="server" ForeColor="#003399">Нууц vг солих</asp:LinkButton>
</asp:panel><asp:panel id="Panel4" runat="server" Visible="False" Width="150px">
	<TABLE cellSpacing="1" cellPadding="0" width="165" align="center" bgColor="#819fc0" border="0">
		<TR>
			<TD background="images/r_back_t.jpg">
				<DIV align="center"><STRONG><FONT color="#ffffff">НУУЦ YГ СОЛИХ </FONT></STRONG>
				</DIV>
			</TD>
		</TR>
		<TR>
			<TD align="center" background="images/r_back_1.jpg">
				<TABLE cellSpacing="0" cellPadding="0" width="95%" border="0">
					<TR>
						<TD><FONT color="#000000">Хуучин нууц vг</FONT></TD>
					</TR>
					<TR>
						<TD align="center">
							<asp:TextBox id="TextBox1" style="BORDER-RIGHT: #e8e8e8 1px groove; BORDER-TOP: #ffffff 1px groove; FONT-WEIGHT: normal; FONT-SIZE: 10px; BORDER-LEFT: #ffffff 1px groove; COLOR: #000000; LINE-HEIGHT: normal; BORDER-BOTTOM: #e8e8e8 1px groove; FONT-STYLE: normal; BACKGROUND-COLOR: #f1f1f1; FONT-VARIANT: normal"
								runat="server" TextMode="Password"></asp:TextBox>
                            <asp:Label ID="Label2" runat="server" Text="*" ForeColor="red"></asp:Label>
						</TD>
					</TR>
					<TR>
						<TD><FONT color="#000000">Шинэ нууц vг 2 удаа оруул</FONT></TD>
					</TR>
					<TR>
						<TD align="center">
							<asp:TextBox id="TextBox2" style="BORDER-RIGHT: #e8e8e8 1px groove; BORDER-TOP: #ffffff 1px groove; FONT-WEIGHT: normal; FONT-SIZE: 10px; BORDER-LEFT: #ffffff 1px groove; COLOR: #000000; LINE-HEIGHT: normal; BORDER-BOTTOM: #e8e8e8 1px groove; FONT-STYLE: normal; BACKGROUND-COLOR: #f1f1f1; FONT-VARIANT: normal"
								runat="server" TextMode="Password"></asp:TextBox>
							<asp:Label ID="Label3" runat="server" Text="*" ForeColor="red"></asp:Label>
						</TD>
					</TR>
					<TR>
						<TD align="center">
							<asp:TextBox id="TextBox3" style="BORDER-RIGHT: #e8e8e8 1px groove; BORDER-TOP: #ffffff 1px groove; FONT: 10px f; BORDER-LEFT: #ffffff 1px groove; COLOR: #000000; BORDER-BOTTOM: #e8e8e8 1px groove; BACKGROUND-COLOR: #f1f1f1"
								runat="server" TextMode="Password"></asp:TextBox>
							<asp:Label ID="Label4" runat="server" Text="*" ForeColor="red"></asp:Label>
						</TD>
					</TR>
					<TR>
						<TD align="center">
							<asp:Button id="Button1" style="BORDER-RIGHT: #ffffff 1px groove; BORDER-TOP: #ffffff 1px groove; FONT-WEIGHT: normal; FONT-SIZE: 10px; BORDER-LEFT: #ffffff 1px groove; COLOR: #003366; LINE-HEIGHT: normal; BORDER-BOTTOM: #ffffff 1px groove; FONT-STYLE: normal; BACKGROUND-COLOR: #eaeff4; FONT-VARIANT: normal"
								runat="server" Text="Солих"></asp:Button>
							<asp:Button id="Button2" style="BORDER-RIGHT: #ffffff 1px groove; BORDER-TOP: #ffffff 1px groove; FONT-WEIGHT: normal; FONT-SIZE: 10px; BORDER-LEFT: #ffffff 1px groove; COLOR: #003366; LINE-HEIGHT: normal; BORDER-BOTTOM: #ffffff 1px groove; FONT-STYLE: normal; BACKGROUND-COLOR: #eaeff4; FONT-VARIANT: normal"
								runat="server" Text="Болих" CausesValidation="False"></asp:Button></TD>
					</TR>
					<TR>
						<TD align="center"><IMG height="10" src="images/blank.gif"></TD>
					</TR>
				</TABLE>
				<asp:label id="Label1" runat="server" ForeColor="Red" Font-Size="8"></asp:label></TD>
		</TR>
	</TABLE>
</asp:panel>