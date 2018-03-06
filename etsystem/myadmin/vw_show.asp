<%@ Language=VBScript %>
<!-- #include file="functions/function.asp" -->
<!-- #include file="config.asp" -->

<%
	If Request("dbName")<>"" Then
		dbName=Trim(cStr(Request("dbName")))
	End If
	
	On Error Resume Next
%>
<HTML>
<HEAD>
	<Link href=style.css rel=stylesheet>
	<Title>ASPMyAdmin For SQL Server By Sukalyan Chakraborty</Title>
	<Meta Name=Description Content="SQL Server web frontend developed by Sukalyan Chakraborty for free use" />
	<Meta Name=Keywords Content="SQL Server web frontend inspired by PHPMyAdmin created by Sukalyan Chakraborty aimed to release more advanced versions in future" />
	
</HEAD>
<BODY>
<Br />
<Br /><Br />
<B>Server: <IMG src="images/server.gif" align="absbottom" ><A href='dbindex.asp'><%=sName %></A> 
&gt;&gt; <A href='server_databases.asp'>Database</A> &gt;&gt; <%=dbName %> &gt;&gt; 
View &gt;&gt; Show</B><Br />
<Br />
	<Table border=1 cellspacing=0 cellpadding=0 width=100%>
		<TR bgcolor=#666699 style='color:white'>
			<TH><A href='db_info.asp?dbName=<%=dbName %>' Style='color:white'>Informations</A></TH>
			<TH><A href='db_table.asp?dbName=<%=dbName %>' Style='color:white'>Table</A></TH>
			<TH><A href='db_view.asp?dbName=<%=dbName%>' Style='color:white'>View</A></TH>
			<TH><A href='db_procedure.asp?dbName=<%=dbName %>' Style='color:white'>Procedure</A></TH>
			<TH><A href='db_sql.asp?dbName=<%=dbName%>' Style='color:white'>SQL</A></TH>
			<TH bgcolor=red><A href='db_drop.asp?dbName=<%=dbName%>' Style='color:white'>Drop</A></TH>
		</TR>
	</Table>
	<Br /><Br /><Br />
	
	<Table Border=0 CellSpacing=0 CellPadding=0 Width=50%>
		<TR bgColor=Orange Height=20>
			<TH>View - <%=Request("vwName")%></TH>
		</TR>
<%
		Dim oConn
		Dim oView
		
		Set oConn=CreateObject("SQLDMO.SQLServer")
		oConn.Connect sName, UID, Passwd
		
		CheckErr
		
		Set oView=CreateObject("SQLDMO.View")
		Set oView=oConn.Databases(dbName).Views(Trim(cStr(Request("vwName"))))
%>
		<TR bgColor=#EEEEEE Height=150>
			<TD><%=oView.Text%></TD>
		</TR>
	</Table>
<%
	Set oView=Nothing
	oConn.Close
	Set oConn=Nothing
%>
</BODY>
</HTML>
