<%@ Language=VBScript %>
<!-- #include file="config.asp" -->
<!-- #include file="functions/function.asp" -->
<%	If Request("dbName")<>"" Then
		dbName=cStr(Trim(Request("dbName")))
	End If
	
	On Error Resume Next
%>
<HTML>
<HEAD>
	<Link href=style.css rel=stylesheet />
	<Title>ASPMyAdmin For SQL Server By Sukalyan Chakraborty</Title>
	<Meta Name=Description Content="SQL Server web frontend developed by Sukalyan Chakraborty for free use" />
	<Meta Name=Keywords Content="SQL Server web frontend inspired by PHPMyAdmin created by Sukalyan Chakraborty aimed to release more advanced versions in future" />
	
</HEAD>
<BODY>
<Br />
<Br /><Br />
<B>Server: <IMG src="images/server.gif" align="absbottom" ><A href='dbindex.asp'><%=sName %></A> 
&gt;&gt; <A href='server_databases.asp'>Database</A> &gt;&gt; <%=dbName %> &gt;&gt; 
Stored Procedures &gt;&gt Show</B><Br />
<Br />
	<Table Border=1 CellSpacing=0 cellPadding=0 Width=100%>
		<TR bgColor=#666699 Style='color:white'>
			<TH><A href='db_info.asp?dbName=<%=dbName %>' Style='color:white'>Informations</A></TH>
			<TH><A href='db_table.asp?dbName=<%=dbName %>' Style='color:white'>Table</A></TH>
			<TH><A href='db_view.asp?dbName=<%=dbName %>' Style='color:white'>View</A></TH>
			<TH><A href='db_Procedure.asp?dbName=<%=dbName%>' Style='color:white'>Procedure</A></TH>
			<TH><A href='db_sql.asp?dbName=<%=dbName%>' Style='color:white'>SQL</A></TH>
			<TH bgcolor=red>Drop</TH>
		</TR>
	</Table>
	<Br /><Br /><Br />
	
	<Table Border=0 CellSpacing=0 CellPadding=0 Width=50%>
		<TR bgColor=Orange Height=20>
			<TH>Stored Procedure - <%=Trim(Request("prName"))%></TH>
		</TR>
		<TR bgColor=#EEEEEE Height=150>
<%
		Dim oConn
		Dim oProc
		
		Set oConn=CreateObject("SQLDMO.SQLServer")
		oConn.Connect sName, UID, Passwd
		
		CheckErr
		
		Set oProc=CreateObject("SQLDMO.StoredProcedure")
		Set oProc=oConn.Databases(dbName).StoredProcedures(cStr(Trim(Request("prName"))))
%>
			<TD><%=oProc.Text%></TD>
<%
		Set oProc=Nothing
		oConn.Close
		Set oConn=Nothing
%>
		</TR>
	</Table>
</BODY>
</HTML>
