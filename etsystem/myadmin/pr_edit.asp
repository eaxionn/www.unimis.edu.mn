<%@ Language=VBScript %>
<!-- #include file="config.asp" -->
<!-- #include file="functions/function.asp" -->
<%
	If Request("dbName")<>"" Then
		dbName=Trim(cStr(Request("dbName")))
	End If
	
	On Error Resume Next
	
	
	
	If Request("action")<>"" Then
		Dim oConn2
		
		Set oConn2=Server.CreateObject("ADODB.Connection")
		
		If Request("action")="Save" Then
			OpenDB oConn2
			
			CheckErr
			
			If UCase(Left(Trim(Request("prText")), 6))="CREATE" Then
				strQuery="Alter " & Right(Trim(Request("prText")), Len(Trim(Request("prText")))-6)
			Else
				strQuey=cStr(Request("prText"))
			End If
			
			oConn2.Execute strQuery
			
			CheckErr
			
			CleseDB oConn2
			
		End If
		Set oConn2=Nothing
		Response.Redirect "db_Procedure.asp?dbName=" & dbName
		Response.End
	End If
%>
<HTML>
<HEAD>
	<Link href=style.css rel=stylesheet />
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
	<Table border=0 cellspacing=0 cellpadding=0>
		<TR bgColor=orange Height=20>
			<TH ColSpan=3>Procedure - <%=Request("prName")%></TH>
		</TR>
		<TR bgColor=#666699>
			<TD>&nbsp;</TD>
			<TD>
<%
	Dim oProc
	Dim oConn
		
	Set oConn=CreateObject("SQLDMO.SQLServer")
	oConn.Connect sName, UID, Passwd
	
	CheckErr
	
	Set oProc=CreateObject("SQLDMO.StoredProcedure")
	Set oProc=oConn.Databases(dbName).StoredProcedures(cStr(Request("prName")))
	
%>
				<Textarea rows=10 cols=50 Name=prText><%=oProc.Text%></Textarea>
<%	Set oProc=Nothing
	oConn.Close
	Set oConn=Nothing
%>
			</TD>
			<TD>&nbsp;</TD>
		</TR>
		<TR bgColor=#666699>
			<TD Align=Center ColSpan=3 Height=30>
				<Input Type=Hidden Name=dbName Value=<%=dbName%>>
				<Input Type=Hidden Name=prName Value=<%=Request("prName")%>>
				<Input Type=Submit Name=action Value=Save>
				<Input Type=Submit Name=action Value=Cancel>
			</TD>
		</TR>
	</Table>
	</Form>
	<Br /><Br />
	<B>*</B> Please make it sure that there is only one or no "GO" statement at the end of the procedure before saving.
</BODY>
</HTML>
