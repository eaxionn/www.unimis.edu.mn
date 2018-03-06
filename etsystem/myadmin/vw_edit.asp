<%@ Language=VBScript %>
<!-- #include file="functions/function.asp" -->
<!-- #include file="config.asp" -->
<%
	IF Trim(cStr(Request("dbName")))<>"" Then
		dbName=Trim(cStr(Request("dbName")))
	End If
	
	Dim oConn
	
	On Error Resume Next
	
	If Request("action")<>"" Then
		If Request("action")="Save" Then
			Set oConn=Server.CreateObject("ADODB.Connection")
			OpenDB oConn
			
			CheckErr
			
			oConn.Execute Trim(cStr(Request("vwText")))
			
			CheckErr
			
			CloseDB oConn
			Set oConn=Nothing
		End If
		Response.Redirect "db_view.asp?dbName=" & dbName
		Response.End
	End If
	
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
Stored Procedures &gt;&gt Edit</B><Br />
<Br />
	<Table Border=1 CellSpacing=0 cellPadding=0 Width=100%>
		<TR bgColor=#666699 Style='color:white'>
			<TH><A href='db_info.asp?dbName=<%=dbName %>' Style='color:white'>Informations</A></TH>
			<TH><A href='db_table.asp?dbName=<%=dbName %>' Style='color:white'>Table</A></TH>
			<TH><A href='db_view.asp?dbName=<%=dbName %>' Style='color:white'>View</A></TH>
			<TH><A href='db_Procedure.asp?dbName=<%=dbName%>' Style='color:white'>Procedure</A></TH>
			<TH><A href='db_sql.asp?dbName=<%=dbName%>' Style='color:white'>SQL</A></TH>
			<TH bgcolor=red><A href='db_drop.asp?dbName=<%=dbName%>' Style='color:white'>Drop</A></TH>
		</TR>
	</Table>
	<Br /><Br /><Br />
	<Form Action="" Method=Post>
	<Table Border=0 CellPadding=0 CellSpacing=0>
		<TR bgColor=Orange Height=20>
			<TH ColSpan=3>Edit view - <%=Request("vwName")%></TH>
		</TR>
		<TR bgColor=#666699>
			<TD>&nbsp;</TD>
			<TD>
<%	
	Dim oView
	Dim vwText
	
	Set oConn=CreateObject("SQLDMO.SQLServer")
	oConn.Connect sName, UID, Passwd
	
	CheckErr
	
	Set oView=CreateObject("SQLDMO.View")
	Set oView=oConn.Databases(dbName).Views(Trim(cStr(Request("vwName"))))
	
	CheckErr
	
	If UCase(Left(Trim(cStr(oView.Text)), 6))="CREATE" Then
		vwText="Alter" & Right(Trim(cStr(oView.Text)), Len(Trim(oView.Text))-6)
	Else
		vwText=Trim(cStr(oView.Text))
	End If
%>
				<Textarea Name=vwText rows=10 cols=50><%=vwText%></Textarea>
			</TD>
			<TD>&nbsp;</TD>
		</TR>
		<TR bgColor=#666699 Height=30>
			<TD Align=Center ColSpan=3>
				<Input Type=Hidden Name=vwName Value=<%=Request("vwName")%>>
				<Input Type=Hidden Name=dbName Value=<%=dbName%>>
				<Input Type=Submit Name=action Value=Save>
				<Input Type=Submit Name=action Value=Cancel>
			</TD>
		</TR>
	</Table>
	</Form>
<%
	oConn.Close
	Set oView=Nothing
	Set oConn=Nothing
%>
</BODY>
</HTML>
