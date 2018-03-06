<%@ Control Language="VB" AutoEventWireup="false" CodeFile="deed.ascx.vb" Inherits="deed" %>
<table border="0" cellpadding="0" cellspacing="0" 
	id="table4" style="WIDTH: 992px; HEIGHT: 112px; background-image:url(images/deed.jpg); background-repeat:no-repeat">
	<tr>
		<td valign="bottom" style="WIDTH: 696px; background-image:url(images/top_back.jpg)">
			<div align="right">
				<table id="table3" cellspacing="0" cellpadding="0" align="right" border="0" style="WIDTH: 327px; HEIGHT: 19px">
					<tr>
						<td style="WIDTH: 82px; HEIGHT: 17px">
							<div align="right"><a class="slogan" href="st_dun.aspx">Нvvр</a>&nbsp;&nbsp;
							</div>
						</td>
						<td style="HEIGHT: 17px">
							<div align="center"><a class="slogan" href="st_dun.aspx">Оюутны нэгдсэн дvн</a>
							</div>
						</td>
						<td style="WIDTH: 26px; HEIGHT: 17px">
							<div align="center">
								<asp:linkbutton id="LinkButton1" runat="server" Cssclass="slogan">
									Гарах</asp:linkbutton></div>
						</td>
						<td style="HEIGHT: 17px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</td>
					</tr>
					<tr>
						<td style="WIDTH: 82px; HEIGHT: 17px"></td>
						<td style="HEIGHT: 17px"></td>
						<td style="WIDTH: 26px; HEIGHT: 17px"></td>
						<td style="HEIGHT: 17px"></td>
					</tr>
				</table>
			</div>
		</td>
		<td valign="middle" style="background-image:url(images/top_back.jpg)" >
			<table id="table1" cellspacing="0" cellpadding="0" align="center" border="0">
				<tr>
					<td valign="top"><span>Код:
							<asp:label id="Label1" ForeColor="#CC3300" runat="server"></asp:label></span></td>
					<td valign="top"><span>Мэргэжил:
							<asp:label id="Label5" ForeColor="#CC3300" runat="server"></asp:label></span></td>
				</tr>
				<tr>
					<td valign="top"><span>Нэр:
							<asp:label id="Label2" ForeColor="#CC3300" runat="server"></asp:label></span></td>
					<td valign="top"><span>Зевлех багш:
							<asp:label id="Label6" ForeColor="#CC3300" runat="server"></asp:label></span></td>
				</tr>
				<tr>
					<td valign="top"><span>Нийт кредит:
							<asp:label id="Label3" ForeColor="#CC3300" runat="server"></asp:label></span></td>
					<td valign="top"><span>Улирал:
							<asp:label id="Label7" ForeColor="#CC3300" runat="server"></asp:label></span></td>
				</tr>
				<tr>
					<td valign="top"><span>VГД :
							<asp:label id="Label4" ForeColor="#CC3300" runat="server"></asp:label></span></td>
					<td valign="top"><span>Оюутны улирал:
							<asp:label id="Label8" ForeColor="#CC3300" runat="server"></asp:label></span></td>
				</tr>
			</table>
		</td>
	</tr>
</table>
