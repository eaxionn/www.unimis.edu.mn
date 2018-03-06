<%@ Language=VBScript %>
<!-- #include file="functions/function.asp" -->
<!-- #include file="config.asp" -->
<%
	If Trim(cStr(Request("dbName")))<>"" Then
		dbName=Trim(cStr(Request("dbName")))
	End If
	
	Dim oConn
	
	If Request("action")<>"" Then
		If Request("action")="Drop" Then
			Set oConn=Server.CreateObject("ADODB.Connection")
			OpenDB oConn
			
			CheckErr
			
			oConn.Execute "drop table " & cStr(Request("tName"))
			
			CheckErr
			
			CloseDB oConn
			Set oConn=Nothing
		End If
		Response.Redirect "db_table.asp?dbName=" & dbName
		Response.End
	End If
%>
<HTML>
<HEAD>
	<Link Href=style.css REL=stylesheet />
	<Title>ASPMyAdmin For SQL Server By Sukalyan Chakraborty</Title>
	<Meta Name=Description Content="SQL Server web frontend developed by Sukalyan Chakraborty for free use" />
	<Meta Name=Keywords Content="SQL Server web frontend inspired by PHPMyAdmin created by Sukalyan Chakraborty aimed to release more advanced versions in future" />
	
</HEAD>
<BODY>
<Br />
<Br /><Br />
<B>Server: <IMG src="images/server.gif" align="absbottom" ><A href='dbindex.asp'><%=sName%></A> 
&gt;&gt; <A href='server_databases.asp'>Database</A> &gt;&gt; <A href='db_info.asp?dbName=<%=dbName%>'><%=dbName%></A> 
&gt;&gt; <A href='db_table.asp?dbName=<%=dbName%>'>Table</A> &gt;&gt; <%=Request("tName") %> 
&gt;&gt; Delete </B><Br />
<Br />
	<Table border=1 cellspacing=0 cellpadding=0 width=100%>
		<TR bgcolor=#666699 style='color:white'>
			<TH><A href='db_info.asp?dbName=<%=dbName%>' style='color:white'>Informations</A></TH>
			<TH bgcolor=white style='color:black'>Table</TH>
			<TH><A href='db_view.asp?dbName=<%=dbName %>' style='color:white'>View</TH>
			<TH><A href='db_procedure.asp?dbName=<%=dbName %>' style='color:white'>Procedure</A></TH>
			<TH><A href='db_sql.asp?dbName=<%=dbName%>' Style='color:white'>SQL</A></TH>
			<TH bgcolor=red><A href='db_drop.asp?dbName=<%=dbName%>' Style='color:white'>Drop</A></TH>
		</TR>
	</Table>
	<Br /><Br /><Br />
	<Form Action="" Method=Post>
	<Table Border=1>
		<TR>
			<TD>
				<Table Border=0 CellSpacing=1 CellPadding=1 Width=200>
					<TR bgColor=orange Height=30>
						<TH>Drop Table</TH>
					</TR>
					<TR bgColor=#EEEEEE Height=100>
						<TD Align=Center Style='color:red'>Are you sure you want to <Br /><B>DROP Table <%=Request("tName")%></B>?</TD>
					</TR>
					<TR bgColor=#666699 Height=30>
						<TD align=Center>
							<Input Type=Hidden Name=dbName Value=<%=dbName%> />
							<Input Type=Hidden Name=tName Value=<%=Request("tName")%> />
							<Input Type=Submit Name=action Value=Drop Style='color:red' />
							&nbsp;&nbsp;&nbsp;&nbsp;
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
