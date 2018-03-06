<%@ Language=VBScript %>
<!-- #include file="functions/function.asp" -->
<!-- #include file="config.asp" -->
<%
	If Request("dbName")<>"" Then
		dbName=Trim(cStr(Request("dbName")))
	End If
	
	Dim oConn
	Dim oTable
	
	On Error Resume Next
		
	
	Set oConn=CreateObject("SQLDMO.SQLServer")
	oConn.Connect sName, UID, Passwd
	CheckErr
	
	Set oTable=CreateObject("SQLDMO.Table")
	
	IF Request("action")="Save" Then
		Dim oKey
		
		Set oKey=CreateObject("SQLDMO.Key")
		Set oTable=oConn.Databases(dbName).Tables(cStr(Request("tName")))
		CheckErr
		
		oKey.Type=3
		oKey.KeyColumns.Add cStr(Request("fldName"))
		oKey.ReferencedTable=cStr(Request("RefTName"))
		oKey.ReferencedColumns.Add cStr(Request("RefFldName"))
		
		oTable.BeginAlter
		oTable.Keys.Add oKey
		oTable.DoAlter
		CheckErr
		
		Set oKey=Nothing
		oConn.Close
		Response.Redirect "tbl_structure.asp?dbName=" & dbName & "&tName=" & Request("tName")
		Response.End
	End If
	
%>
<HTML>
<HEAD>
	<Link Href=style.css Rel=stylesheet />
	<Title>ASPMyAdmin For SQL Server By Sukalyan Chakraborty</Title>
	<Meta Name=Description Content="SQL Server web frontend developed by Sukalyan Chakraborty for free use" />
	<Meta Name=Keywords Content="SQL Server web frontend inspired by PHPMyAdmin created by Sukalyan Chakraborty aimed to release more advanced versions in future" />
	
</HEAD>
<BODY>
<Br />
<Br /><Br />
<B>Server: <IMG src="images/server.gif" align="absbottom" ><A href='dbindex.asp'><%=sName %></A> 
&gt;&gt; <A href='server_databases.asp'>Database</A> &gt;&gt; <A href='db_info.asp?dbName=<%=dbName %>'><%=dbName %></A> 
&gt;&gt; <A href='db_table.asp?dbName=<%=dbName %>'>Table</A> &gt;&gt; 
<% =Request("tName") %>
&gt;&gt; Structure &gt;&gt; Foreign Key</B><Br />
<Br />
	<Table border=1 cellspacing=0 cellpadding=0 width=100%>
		<TR bgcolor=#666699 style='color:white'>
			<TH><A href='tbl_browse.asp?dbName=<%=dbName %>&tName=<%=Request("tName") %>' Style='color:white'>Browse</A></TH>
			<TH><A href='tbl_data_insert.asp?dbName=<%=dbName%>&tName=<%=Request("tName")%>' Style='color:white'>Insert</A></TH>
			<TH><A href='tbl_structure.asp?dbName=<%=dbName %>&tName=<%=Request("tName") %>' Style='color:white'>Structure</A></TH>
			<TH><A href='tbl_empty.asp?dbName=<%=dbName%>&tName=<%=Request("tName")%>' Style='color:white'>Empty</A></TH>
			<TH><A href='db_sql.asp?dbName=<%=dbName%>' Style='color:white'>SQL</A></TH>
			<TH><A href='tbl_create.asp?dbName=<%=dbName%>' Style='color:white'>Create</A></TH>
			<TH bgcolor=red><A href='db_drop.asp?dbName=<%=dbName%>' Style='color:white'>Drop</A></TH>
		</TR>
	</Table>
	<Br /><Br />
	<i>Table - <%=Request("tName")%><br />Field - <%=Request("fldName")%></i><Br />
<%	
	If Request("action")="" Then%>
	<Form Action=tbl_foreign_key_add.asp method=post>
		<Input Type=Hidden Name=dbName value=<%=dbName%> />
		<Input Type=Hidden Name=tName Value=<%=Request("tName")%> />
		<Input Type=Hidden Name=fldName Value=<%=Request("fldName")%> />
		<Table border=0 cellpadding=1 cellspacing=1>
			<TR>
				<TH bgcolor=#666699 style='color:white'>Select the table you want to refer</TH>
			</TR>
			<TR bgcolor=orange>
				<TH>Tables</TH>
			</TR>
	<%		
		Dim ColorName
		
		For Each oTable in oConn.Databases(dbName).Tables
			If Not oTable.SystemObject Then
				If colorCheck=0 Then
					ColorName="#EEEEEE"
					colorCheck=1
				Else	
					ColorName="#CCCCCC"
					colorCheck=0
				End If%>
			<TR bgColor=<%=ColorName%>>
				<TD>
					<Input Type=Radio Name=RefTName Value=<%=oTable.Name%> /><%=oTable.Name%>
				</TD>
			</TR>
			<%End If
		Next%>
		
			<TR bgcolor=#666699>
				<TH>
					<Input Type=Submit Name=action Value=Go />
				</TH>
			</TR>
		</Table>
	</Form>
<%	ElseIf Request("action")="Go" Then%>
	<Form Action=tbl_foreign_key_add.asp method=post>
		<Input Type=Hidden name=dbName value=<%=dbName%> />
		<Input Type=Hidden Name=tName value=<%=Request("tName")%> />
		<Input Type=Hidden Name=fldName Value=<%=Request("fldName")%> />
		<Input Type=Hidden Name=RefTName Value=<%=Request("RefTName")%> />
		<Table border=0 cellpadding=1 cellspacing=1>
			<TR bgcolor=#666699>
				<TH ColSpan=2 style='color:white'>Select the column</TH>
			</TR>
			<TR bgcolor=orange>
				<TH>Table</TH>
				<TH>Field</TH>
			</TR>
				<TD>
					<Label for=RefFldName><%=Request("RefTName")%>"</Label>
				</TD>
				<TD>
					<Select Name=RefFldName id=RefFldName>
<%		For Each oCol in oConn.Databases(dbName).Tables(cStr(Request("RefTName"))).Columns %>
						<Option><%=oCol.Name%></Option>
<%		Next%>
					</Select>
				</TD>
			</TR>
			<TR bgcolor=#666699>
				<TH ColSpan=2>
					<Input Type=Submit Name=action value=Save />
				</TH>
			</TR>
		</Table>
	</Form>
<%	End If
	
	Set oTable=Nothing
	oConn.Close
	Set oConn=Nothing
%>

</BODY>
</HTML>
