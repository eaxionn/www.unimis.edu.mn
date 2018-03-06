<%@ Language=VBScript %>
<!-- #include file="config.asp" -->
<!-- #include file="functions/function.asp" -->
<%
	If Trim(cStr(Request("dbName")))<>"" Then
		dbName=Trim(cStr(Request("dbName")))
	End If
	
	Dim oConn
	Dim oRS
	Dim I
	Dim fldNo
	
	On Error Resume Next
	
	Set oConn=Server.CreateObject("ADODB.Connection")
	OpenDB oConn
		
	CheckErr
	
	Set oRS=server.CreateObject("ADODB.Recordset")
		
	If Request.Form("action")<>"" Then
		If Request.Form("action")=" Yes " Then
			If Request("strKey")="No" Then
				oConn.Execute "Declare abc Cursor dynamic for select * from " & cStr(Request("tName")) & " open abc"
				oConn.Execute "fetch relative " & cInt(Request("strParam")) & " from abc"
				oConn.Execute "delete " & cStr(Request("tName")) & " where current of abc"
			Else
				oConn.Execute "Delete " & cStr(Request("tName")) & " Where " & Replace(Trim(cStr(Request("strParam"))), "%22", """") & ";"
			End If
			
			CheckErr
			
		End If
		Set oRS=Nothing
		CloseDB oConn
		Set oConn=Nothing
		Response.Redirect "tbl_browse.asp?dbName=" & dbName & "&tName=" & Request("tName")
		Response.End
	End If
	
	If Request("strKey")="No" Then
		oConn.Execute "Declare abc Cursor dynamic for select * from " & cStr(Request("tName")) & " open abc"
		CheckErr
		OpenRS oRS, oConn, "fetch relative " & cInt(Request("strParam")) & " from abc"
		CheckErr
	Else
		OpenRS oRS, oConn, "select * from " & Request("tName") & " Where " & Replace(cStr(Request("strParam")), "%22", """")
		CheckErr
	End If
	
	fldNo=oRS.Fields.Count
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
<B>Server: <IMG src="images/server.gif" align="absbottom" ><a href='dbindex.asp'><%=sName %></a> 
&gt&gt <a href='server_databases.asp'>Database</a> &gt&gt <a href='db_info.asp?dbName=<%=dbName %>'><%=dbName %></a> 
&gt&gt <a href='db_table.asp?dbName=<%=dbName %>'>Table</a> &gt&gt <%=Request("tName") %> 
&gt&gt Delete </B><Br />
<Br />
	<Table border=1 cellspacing=0 cellpadding=0 width=100%>
		<TR bgcolor=#666699 style='color:white'>
			<TH><A href='tbl_browse.asp?dbName=<%=dbName %>&tName=<%=Request("tName") %>' Style='color:white'>Browse</a></TH>
			<TH><A href='tbl_data_insert.asp?dbName=<%=dbName%>&tName=<%=Request("tName")%>' Style='color:white'>Insert</a></TH>
			<TH><A href='tbl_structure.asp?dbName=<%=dbName %>&tName=<%=Request("tName") %>' style='color:white'>Structure</a></TH>
			<TH><A Href='tbl_empty.asp?dbName=<%=dbName%>&tName=<%=Request("tName")%>' Style='color:white'>Empty</a></TH>
			<TH><A href='db_sql.asp?dbName=<%=dbName%>' Style='color:white'>SQL</A></TH>
			<TH><A href='tbl_create.asp?dbName=<%=dbName%>' Style='color:white'>Create</A></TH>
			<TH bgcolor=red><A href='db_drop.asp?dbName=<%=dbName%>' Style='color:white'>Drop</A></TH>
		</TR>
	</Table>
	<Br /><Br />
	<Form Action="" Method=Post>
	<Table Border=1>
		<TR>
			<TD>
				<Table Border=1 CellPadding=0 CellSpacing=0>
					<TR>
						<TH ColSpan=<%=fldNo%>>
							<Input Type=Hidden Name=strParam Value="<%=Replace(cStr(Request("strParam")), """", "%22") %>" />
							<Input Type=Hidden Name=strKey Value="<%=Request("strKey") %>" />
							<Input Type=Hidden Name=dbName Value=<%=Request("dbName") %> />
							<Input Type=Hidden Name=tName Value=<%=Request("tName") %> />
							<Input Type=Hidden Name=pgNo Value=<%=Request("pgNo") %> />
						</TH>
					</TR>
					<TR bgColor=orange Height=30>
						<TH ColSpan=<%=fldNo %> Style='color:white'>Delete Record</TH>
					</TR>
					<TR>
						<TD Colspan=<%=fldNo %> Height=100 Align=center vAlign=center Style="color:red">Are you sure you want to delete the following data?</TD>
					</TR>
					<TR>
<%
	For I=0 To oRS.Fields.Count-1%>
						<TD><B><%=oRS.Fields(I).Name%></B></TD>
<%	Next%>
					</TR>
					<TR>
<%
	For I=0 To oRS.Fields.Count-1 %>
						<TD><%=oRS.Fields(I)%>&nbsp;</TD>
<%	Next
				
	
	CloseRS oRS
	Set oRS=Nothing
	CloseDB oConn
	Set oConn=Nothing
%>
					</TR>
					<TR bgColor=#666699 Height=30>
						<TD Align=center ColSpan=<%=fldNo %> Height=40>
							<Input Type=Submit Name=action Value=" Yes " />&nbsp;&nbsp;&nbsp;&nbsp;
							<Input Type=Submit Name=action Value=" No " />
						</TD>
					</TR>
				</Table>
			</TD>
		</TR>
	</Table>
	</Form>
		

</BODY>
</HTML>
