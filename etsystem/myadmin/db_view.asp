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
	
		oConn.Execute Trim(cStr(Request("vwText")))
		
		If err.number<>0 Then
			Response.Write "<Table Border=1 CellSpacing=0 CellPadding=0><TR bgColor=#666699><TH Style='color:white'>SQL Syntax</TH></TR>" & vbCrlf
			Response.Write "<TR><TD>" & Trim(cStr(Request("vwText"))) & "</TD></TR></Table>"
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
View</B><Br />
<Br />
	<Table border=1 cellspacing=0 cellpadding=0 width=100%>
		<TR bgcolor=#666699 style='color:white'>
			<TH><A href='db_info.asp?dbName=<%=dbName %>' Style='color:white'>Informations</A></TH>
			<TH><A href='db_table.asp?dbName=<%=dbName %>' Style='color:white'>Table</A></TH>
			<TH bgcolor=white style='color:black'>View</TH>
			<TH><A href='db_procedure.asp?dbName=<%=dbName %>' Style='color:white'>Procedure</A></TH>
			<TH><A href='db_sql.asp?dbName=<%=dbName%>' Style='color:white'>SQL</A></TH>
			<TH bgcolor=red><A href='db_drop.asp?dbName=<%=dbName%>' Style='color:white'>Drop</A></TH>
		</TR>
	</Table>
	<Br /><Br /><Br />
	<Table border=0 cellspacing=1 cellpadding=1 width=60%>
		<TR bgcolor=orange>
			<TH>View</TH>
			<TH colspan=4>Action</TH>
			<TH>Owner</TH>
			<TH>Date Created</TH>
		</TR>
<%
	Dim oView
	Dim TableNo
	Dim colorCheck
	Dim colorName
	Dim I
	
	Set oConn=CreateObject("SQLDMO.SQLServer")
	oConn.Connect sName, UID, passwd
	
	CheckErr
	
	Set oView=CreateObject("SQLDMO.View")
	
	TableNo=0
	colorCheck=0
	I=1
	For Each oView In oConn.Databases(dbName).Views
		If Not oView.SystemObject Then
			If colorCheck=0 Then
				ColorName="#EEEEEE"
				colorCheck=1
			Else	
				ColorName="#CCCCCC"
				colorCheck=0
			End If%>
			
		<TR bgColor=<%=ColorName%> onmouseover="setPointer(this, <%=I%>, 'over', '<%=colorName%>', '#CCCCFF', '#FFCC99');" onmouseout="setPointer(this, <%=I%>, 'out', '<%=colorName%>', '#CCCCFF', '#FFCC99');">
			<TD><%=oView.Name%></TD>
			<TD><A href='vw_browse.asp?dbName=<%=dbName%>&vwName=<%=oView.Name%>'>Browse</A></TD>
			<TD><A href='vw_edit.asp?dbName=<%=dbName%>&vwName=<%=oView.Name%>'>Edit</A></TD>
			<TD><A href='vw_show.asp?dbName=<%=dbName%>&vwName=<%=oView.Name%>'>Show</A></TD>
			<TD><A href='vw_drop.asp?dbName=<%=dbName%>&vwName=<%=oView.Name%>'>Delete</A></TD>
			<TD><%=oView.Owner%></TD>
			<TD><%=oView.CreateDate%></TD>
		</TR>
<%			TableNo=TableNo+1
		End If
		I=I+1
	Next
	
	Set oView=Nothing
	oConn.Close
	Set oConn=Nothing
%>
		<TR bgcolor=orange>
			<TH><%=TableNo %> views</TH>
			<TH colspan=4></TH>
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
			<TH ColSpan=3>Create New View</TH>
		</TR>
		<TR bgColor=#666699>
			<TD>&nbsp;</TD>
			<TD>
				<Textarea Name=vwText rows=10 cols=50>Create View </Textarea>
			</TD>
			<TD vAlign=Bottom Align=Right Width=50>
				<Input Type=Hidden Name=dbName Value=<%=dbName%> >
				<Input Type=Submit Name=action Value=Go>
			</TD>
		</TR>
		<TR bgColor=#666699>
			<TD ColSpan=3>&nbsp;</TD>
		</TR>
	</Table>
	</Form>
	
	<Br />
</BODY>
</HTML>
