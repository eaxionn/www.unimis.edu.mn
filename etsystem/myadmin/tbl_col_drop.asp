<%@ Language=VBScript %>
<!-- #include file="config.asp" -->
<!-- #include file="functions/function.asp" -->
<%
	If Trim(cStr(Request("dbName"))) <> "" Then
		dbName=Trim(cStr(Request("dbName")))
	End If
	
	If Request("action")<>"" Then
		If Request("action")="Yes" Then
			On Error Resume Next 
			
			Dim oConn
			Dim oTable
			
			Set oConn=CreateObject("SQLDMO.SQLServer")
			oConn.Connect sName, UID, Passwd
			
			CheckErr
			
			Set oTable=CreateObject("SQLDMO.Table")
			Set oTable=oConn.Databases(dbName).Tables(cStr(Request("tName")))
			
			oTable.BeginAlter
			oTable.Columns(cStr(Request("colName"))).Remove
			oTable.DoAlter
			
			CheckErr
			
			Set oTable=Nothing
			oConn.Close
			Set oConn=Nothing
			
			Response.Redirect "tbl_Structure.asp?dbName=" & dbName & "&tName=" & Request("tName")
			Response.End
		Else
			Response.Redirect "tbl_Structure.asp?dbName=" & dbName & "&tName=" & Request("tName")
			Response.End
		End If
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
&gt;&gt; <a href='server_databases.asp'>Database</A> &gt;&gt; <A href='db_info.asp?dbName=<%=dbName %>'><%=dbName %></A> 
&gt;&gt; <A href='db_table.asp?dbName=<%=dbName %>'>Table</A> &gt;&gt; <%=Request("tName") %> 
&gt;&gt; Column Drop</B><Br />
<Br />
	<Table border=1 cellspacing=0 cellpadding=0 width=100%>
		<TR bgcolor=#666699 style='color:white'>
			<TH><A href='tbl_browse.asp?dbName=<%=dbName %>&tName=<%=Request("tName") %>' style='color:white'>Browse</a></TH>
			<TH><A href='tbl_data_insert.asp?dbName=<%=dbName%>&tName=<%=Request("tName")%>' Style='color:white'>Insert</A></TH>
			<TH><A href='tbl_structure.asp?dbName=<%=dbName %>&tName=<%=Request("tName") %>' style='color=white'>Structure</a></TH>
			<TH><A href='tbl_empty.asp?dbName=<%=dbName%>&tName=<%=Request("tName")%>' Style='color:white'>Empty</A></TH>
			<TH><A href='db_sql.asp?dbName=<%=dbName%>' Style='color:white'>SQL</A></TH>
			<TH><A href='tbl_create.asp?dbName=<%=dbName%>&tName=<%=Request("tName")%>' Style='color:white'>Create</A></TH>
			<TH bgcolor=red><A href='db_drop.asp?dbName=<%=dbName%>' Style='color:white'>Drop</A></TH>
		</TR>
	</Table>
	<br /><br />
	<Form Action=tbl_col_drop.asp Method=post>
	<Table Border=1 CellPadding=0 CellSpacing=0 Height=100 Width=300>
		<TR>
			<TD>
				<Table Border=0 CellSpacing=0 CellPadding=0 Width=100%>
					<TR bgColor=orange Height=50>
						<TH ColSpan=2>Drop Column</TH>
					</TR>
					<TR bgColor=white Height=100>
						<TD ColSpan=2 Align=center Style='color:red'>Are you sure you want to delete <Br /><I><B><%=Request("colName")%></B></I> from table <I><B><%=Request("tName")%></B></I>?</TD>
					</TR>
					<TR bgcolor=#666699 Height=50>
						<TD align=center>
							<Input type=hidden name=colName value=<%=Request("colName")%> />
							<Input type=hidden name=tName value=<%=Request("tName")%> />
							<Input type=hidden name=dbName value=<%=dbName%> />
							<Input type=submit name=action value='Yes' />
						</TD>
						<TD align=center>
							<Input type=submit name=action value='No' />
						</TD>
					</TR>
				</Table>
			</TD>
		</TR>
	</Table>
	</Form>
</BODY>
</HTML>
