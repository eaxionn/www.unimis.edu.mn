<%@ Language=VBScript %>
<!-- #include file="config.asp" -->
<!-- #include file="functions/function.asp" -->

<%
	If Request("dbName")<>"" Then
		dbName=Trim(cStr(Request("dbName")))
	End If
	
	On Error Resume Next
	
	Dim oConn
	
	If Request("action")="Go" Then
		Set oConn=Server.CreateObject("ADODB.Connection")
		OpenDB oConn
	
		CheckErr
	
		oConn.Execute Trim(cStr(Request("prText")))
		
		If err.number<>0 Then
			Response.Write "<Table Border=1 CellSpacing=0 CellPadding=0><TR bgColor=#666699><TH Style='color:white'>SQL Syntax</TH></TR>" & vbCrlf
			Response.Write "<TR><TD>" & Trim(cStr(Request("prText"))) & "</TD></TR></Table>"
			CheckErr
		End If
		
		CloseDB oConn
		Set oConn=Nothing
	End If
%>

<HTML>
<HEAD>
	<Link href=style.css rel=stylesheet>
	<Title>ASPMyAdmin For SQL Server By Sukalyan Chakraborty</Title>
	<Meta Name=Description Content="SQL Server web frontend developed by Sukalyan Chakraborty for free use" />
	<Meta Name=Keywords Content="SQL Server web frontend inspired by PHPMyAdmin created by Sukalyan Chakraborty aimed to release more advanced versions in future" />
	
	<script src="functions/setPointer.js" type="text/javascript" language="javascript">
	</script>
</HEAD>
<BODY>
<Br />
<Br /><Br />
<B>Server: <IMG src="images/server.gif" align="absbottom" ><A href='dbindex.asp'><%=sName %></A> 
&gt;&gt; <A href='server_databases.asp'>Database</A> &gt;&gt; <%=dbName %> &gt;&gt; 
Stored Procedures</B><Br />
<Br />
	<Table Border=1 CellSpacing=0 cellPadding=0 Width=100%>
		<TR bgColor=#666699 Style='color:white'>
			<TH><A href='db_info.asp?dbName=<%=dbName %>' Style='color:white'>Informations</A></TH>
			<TH><A href='db_table.asp?dbName=<%=dbName %>' Style='color:white'>Table</A></TH>
			<TH><A href='db_view.asp?dbName=<%=dbName %>' Style='color:white'>View</A></TH>
			<TH bgColor=white Style='color:black'>Procedure</TH>
			<TH><A href='db_sql.asp?dbName=<%=dbName%>' Style='color:white'>SQL</A></TH>
			<TH bgcolor=red><A href='db_drop.asp?dbName=<%=dbName%>' Style='color:white'>Drop</A></TH>
		</TR>
	</Table>
	<Br /><Br /><Br />
	<Table border=0 cellspacing=1 cellpadding=1 width=60%>
		<TR bgcolor=orange>
			<TH>Procedure</TH>
			<TH Colspan=3>Action</TH>
			<TH>Owner</TH>
			<TH>Date Created</TH>
		</TR>
<%
	Dim oProc
	Dim ColorName
	Dim I
	
	Set oConn=CreateObject("SQLDMO.SQLServer")
	oConn.Connect sName, UID, passwd
	
	CheckErr
	
	Set oProc=CreateObject("SQLDMO.StoredProcedure")
	
	TableNo=0
	colorCheck=0
	I=0
	For Each oProc in oConn.Databases(dbName).StoredProcedures
		If not oProc.SystemObject Then
			If colorCheck=0 Then
				ColorName="#EEEEEE"
				colorCheck=1
			Else
				ColorName="#CCCCCC"
				colorCheck=0
			End If%>
		<TR bgColor=<%=ColorName%> onmouseover="setPointer(this, <%=I%>, 'over', '<%=colorName%>', '#CCCCFF', '#FFCC99');" onmouseout="setPointer(this, <%=I%>, 'out', '<%=colorName%>', '#CCCCFF', '#FFCC99');">
			<TD><%=oProc.Name%></TD>
			<TD><A href='pr_edit.asp?dbName=<%=dbName%>&prName=<%=oProc.Name%>'>Edit</A></TD>
			<TD><A href='pr_show.asp?dbName=<%=dbName%>&prName=<%=oProc.Name%>'>Show</A></TD>
			<TD><A href='pr_drop.asp?dbName=<%=dbName%>&prName=<%=oProc.Name%>'>Delete</A></TD>
			<TD><%=oProc.Owner%></TD>
			<TD><%=oProc.CreateDate%></TD>
		</TR>
<%			
			TableNo=TableNo+1
		End If
		I=I+1
	Next
	
	Set oProc=Nothing
	oConn.Close
	Set oConn=Nothing
%>
		<TR bgcolor=orange>
			<TH><%=TableNo %> Procedures</TH>
			<TH colspan=3></TH>
			<TH></TH>
			<TH></TH>
		</TR>
	</Table>
	<Br />
	<HR Size=1 />
	<Br />
	<Form Action="" Method=Post>
	<Table Border=0 CellSpacing=0 CellPadding=0>
		<TR bgColor=Orange Height=20>
			<TH ColSpan=3>Create new procedure</TH>
		</TR>
		<TR bgColor=#666699>
			<TD>&nbsp;</TD>
			<TD>
				<Textarea Name=prText cols=50 rows=10>Create Procedure </Textarea>
			</TD>
			<TD Align=Right vAlign=Bottom Width=50>
				<Input Type=Hidden Name=dbName Value=<%=dbName%>>
				<Input Type=Submit Name=action Value=Go>
			</TD>
		</TR>
		<TR bgColor=#666699>
			<TD ColSpan=3>&nbsp;</TD>
		</TR>
	</Table>
	</Form>
	
</BODY>
</HTML>
