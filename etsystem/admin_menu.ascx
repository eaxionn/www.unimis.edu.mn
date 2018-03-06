<%@ Control Language="vb" AutoEventWireup="false" Codebehind="admin_menu.ascx.vb" Inherits="e_testweb.admin_tables" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="uc1" TagName="admin_create_list" Src="admin_create_list.ascx" %>
<TABLE id="Table1" cellSpacing="0" cellPadding="0" border="0">
	<TR>
		<TD>&nbsp;&nbsp;&nbsp;&nbsp;
			<asp:imagebutton id="ImageButton1" ImageUrl=".\imgs\tables.gif" runat="server"></asp:imagebutton></TD>
		<TD><A href="admin_main.aspx?pageID=1&amp;name=table"><strong>Хvснэгтvvдийг удирдах</strong></A><br>
			<em>( Асуултын сан, Хариултын сан, Оюутны нууц vг<br>
				Шалгалтын сан ... г.м )</em></TD>
	</TR>
	<TR>
		<TD>&nbsp;&nbsp;&nbsp;&nbsp;
			<asp:imagebutton id="ImageButton2" runat="server" ImageUrl=".\imgs\create_exam.gif"></asp:imagebutton></TD>
		<TD><A href="admin_main.aspx?pageID=2&amp;name=create"><strong>Шалгалт vvсгэх</strong></A><br>
			<em>( Шинээр шалгалт vvсгэх, Шалгалт устгах<br>
				Асуулт сонгох, Шалгалт идэвхижvvлэх ... г.м )</em></TD>
	</TR>
	<TR>
		<TD>&nbsp;&nbsp;&nbsp;&nbsp;
			<asp:imagebutton id="ImageButton3" runat="server" ImageUrl=".\imgs\monitor.gif"></asp:imagebutton></TD>
		<TD><A href="admin_main.aspx?pageID=3&amp;name=monitoring"><strong>Шалгалт хянах</strong></A><br>
			<em>( Шалгалтын явцийг хянах, Шалгалт эхлvvлэх<br>
				Шалгалт зогсоох, Vнэлгээ егех ... г.м )</em></TD>
	</TR>
	<TR>
		<TD>&nbsp;&nbsp;&nbsp;&nbsp;
			<asp:imagebutton id="Imagebutton4" ImageUrl=".\imgs\chart.gif" runat="server"></asp:imagebutton></TD>
		<TD><A href="admin_main.aspx?pageID=4&amp;name=report"><strong>Тайлангууд</strong></A><br>
			<em>( Хичээлээр тайлан гаргах, Сургууль тус бvрээр<br>
				Профессорын баг бvрээр, Оюутан тус бvрээр ... г.м )</em></TD>
	</TR>
</TABLE>
