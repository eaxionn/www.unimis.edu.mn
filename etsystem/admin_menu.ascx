<%@ Control Language="vb" AutoEventWireup="false" Codebehind="admin_menu.ascx.vb" Inherits="e_testweb.admin_tables" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="uc1" TagName="admin_create_list" Src="admin_create_list.ascx" %>
<TABLE id="Table1" cellSpacing="0" cellPadding="0" border="0">
	<TR>
		<TD>&nbsp;&nbsp;&nbsp;&nbsp;
			<asp:imagebutton id="ImageButton1" ImageUrl=".\imgs\tables.gif" runat="server"></asp:imagebutton></TD>
		<TD><A href="admin_main.aspx?pageID=1&amp;name=table"><strong>�v�����vv���� �������</strong></A><br>
			<em>( �������� ���, ��������� ���, ������ ���� v�<br>
				��������� ��� ... �.� )</em></TD>
	</TR>
	<TR>
		<TD>&nbsp;&nbsp;&nbsp;&nbsp;
			<asp:imagebutton id="ImageButton2" runat="server" ImageUrl=".\imgs\create_exam.gif"></asp:imagebutton></TD>
		<TD><A href="admin_main.aspx?pageID=2&amp;name=create"><strong>������� vv����</strong></A><br>
			<em>( ������ ������� vv����, ������� ������<br>
				������ ������, ������� �������vv��� ... �.� )</em></TD>
	</TR>
	<TR>
		<TD>&nbsp;&nbsp;&nbsp;&nbsp;
			<asp:imagebutton id="ImageButton3" runat="server" ImageUrl=".\imgs\monitor.gif"></asp:imagebutton></TD>
		<TD><A href="admin_main.aspx?pageID=3&amp;name=monitoring"><strong>������� �����</strong></A><br>
			<em>( ��������� ������ �����, ������� ���vv���<br>
				������� �������, V������ ���� ... �.� )</em></TD>
	</TR>
	<TR>
		<TD>&nbsp;&nbsp;&nbsp;&nbsp;
			<asp:imagebutton id="Imagebutton4" ImageUrl=".\imgs\chart.gif" runat="server"></asp:imagebutton></TD>
		<TD><A href="admin_main.aspx?pageID=4&amp;name=report"><strong>����������</strong></A><br>
			<em>( ��������� ������ ������, �������� ��� �v����<br>
				����������� ��� �v����, ������ ��� �v���� ... �.� )</em></TD>
	</TR>
</TABLE>
