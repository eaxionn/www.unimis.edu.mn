<%@ Language=VBScript %>
<!-- #include file="functions/function.asp" -->
<!-- #include file="config.asp" -->
<% 
	If Request("dbName")<>"" Then
		dbName=Trim(cStr(Request("dbName")))
	End If
	
	On Error Resume Next
	
	If Request("action")<>"" Then
		If Request("action")="Empty" Then
			Dim oConn
			
			Set oConn=Server.CreateObject("ADODB.Connection")
			OpenDB oConn
			
			CheckErr
			
			oConn.Execute "delete " & cStr(Request("tName"))
			
			CheckErr
			
			CloseDb oConn
			Set oConn=Nothing
		End If
		Response.Redirect "db_table.asp?dbName=" & dbName
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
&gt;&gt; <A href='server_databases.asp'>Database</A> &gt;&gt; <A href='db_info.asp?dbName=<%=dbName %>'><%=dbName %></A> 
&gt;&gt; <A href='db_table.asp?dbName=<%=dbName %>'>Table</A> &gt;&gt; <%=Request("tName") %> 
&gt;&gt; Empty </B><Br />
<Br />
	<Table border=1 cellspacing=0 cellpadding=0 width=100%>
		<TR bgcolor=#666699 style='color:white'>
			<TH><A href='tbl_browse.asp?dbName=<%=dbName %>&tName=<%=Request("tName") %>' Style='color:white'>Browse</A></TH>
			<TH><A href='tbl_data_insert.asp?dbName=<%=dbName%>&tName=<%=Request("tName")%>' Style='color:white'>Insert</A></TH>
			<TH><A href='tbl_structure.asp?dbName=<%=dbName%>&tName=<%=Request("tName") %>' style='color:white'>Structure</A></TH>
			<TH bgColor=White Style='color:black'>Empty</TH>
			<TH><A href='db_sql.asp?dbName=<%=dbName%>' Style='color:white'>SQL</A></TH>
			<TH><A href='tbl_create.asp?dbName=<%=dbName%>' Style='color:white'>Create</A></TH>
			<TH bgcolor=red><A href='db_drop.asp?dbName=<%=dbName%>' Style='color:white'>Drop</A></TH>
		</TR>
	</Table>
	
	<Form Action="" Method=Post>
	<Table Border=1>
		<TR>
			<TD>
				<Table Border=0 Cellspacing=1 Cellpadding=1 width=300>
					<TR bgColor=orange Height=30>
						<TH>Empty Table</TH>
					</TR>
					<TR height=100>
						<TD Style='color:red' align=center>Are you sure you want to delete <Br />all data(s) from table - <b><% Response.Write Request("tName") %></b>?</TD>
					</TR>
					<TR bgColor=#666699 Height=30>
						<TD Align=center>
							<Input Type=Hidden Name=dbName Value=<%=dbName%> />
							<Input Type=Hidden Name=tName Value=<%=Request("tName")%> />
							<Input Type=Submit Name=action Value=Empty />&nbsp;&nbsp;&nbsp;
							<Input Type=Submit Name=action Value=Cancel />
						</TD>
					</TR>
				</Table>
			</TD>
		</TR>
	</Table>
	</Form>
</BODY>
</HTML>
