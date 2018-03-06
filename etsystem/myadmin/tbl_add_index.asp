<%@ Language=VBScript %>
<!-- #include file="config.asp" -->
<!-- #include file="functions/function.asp" -->
<%
	If Request("dbName")<>"" Then
		dbName=Trim(cStr(Request("dbName")))
	End If
	
	On Error Resume Next
	
	Dim oConn
	
	If Request("action")="Create Index" then
		If Trim(cStr(Request("idxName")))<>"" Then
						
			Dim strQuery
	
			Set oConn=Server.CreateObject("ADODB.Connection")
			OpenDB oConn

			CheckErr
						
			strQuery="Create "
			If Trim(cStr(Request("idxType")))<>"" Then
				strQuery=strQuery & Trim(cStr(Request("idxType"))) & " "
			End If
		
			strQuery=strQuery & "Index " & Trim(cStr(Request("idxName"))) & " on " & Trim(cStr(Request("tName"))) & "(" & Trim(cStr(Request("colName")))
			
			If Trim(cStr(Request("idxOrder")))<>"" Then
				strQuery=strQuery & " " & Trim(cStr(Request("idxOrder")))
			End If
			strQuery=strQuery & ") "
			
			If Trim(cStr(Request("idxOpt")))<>"" Then
				strQuery=strQuery & "With " & Trim(cStr(Request("idxOpt")))
			End If
			
			oConn.Execute strQuery
			
			CheckErr
			
			CloseDB oConn
			Set oConn=Nothing
			Response.Redirect "tbl_structure.asp?dbName=" & dbName & "&tName=" & Request("tName") 
			Response.End
		Else
			Response.Write "<Font color=red><B>Please enter the index name</B></Font><BR />"
		End If
	End If
%>
<HTML>
<Head>
	<Link Href=style.css rel=stylesheet />
	<Title>ASPMyAdmin For SQL Server By Sukalyan Chakraborty</Title>
	<Meta Name=Description Content="SQL Server web frontend developed by Sukalyan Chakraborty for free use" />
	<Meta Name=Keywords Content="SQL Server web frontend inspired by PHPMyAdmin created by Sukalyan Chakraborty aimed to release more advanced versions in future" />
	
</Head>
<Body>
<Br />
<Br /><Br />
<b>Server: <IMG src="images/server.gif" align="absbottom" ><a href='dbindex.asp'>
<% Response.Write sName %>
</a> &gt&gt <a href='server_databases.asp'>Database</a> &gt&gt <a href='db_info.asp?dbName=<% Response.Write dbName %>'>
<% Response.Write dbName %>
</a> &gt&gt <a href='db_table.asp?dbName=<% Response.Write dbName %>'>Table</a> 
&gt&gt 
<% Response.Write request("tName") %>
&gt&gt Create Index</b><br />
<br />
	<Table border=1 cellspacing=0 cellpadding=0 width=100%>
		<TR bgcolor=#666699 style='color:white'>
			<TH><a href='tbl_browse.asp?dbName=<% Response.Write dbName %>&tName=<% Response.Write Request("tName") %>' style='color:white'>Browse</a></TH>
			<TH><A href='tbl_data_insert.asp?dbName=<%=dbName%>&tName=<%=Request("tName")%>' style='color:white'>Insert</A></TH>
			<TH><A href='tbl_structure.asp?dbName=<%=dbName%>&tName=<%=Request("tName")%>' Style='color:white'>Structure</A></TH>
			<TH><A href='tbl_empty.asp?dbName=<%=dbName%>&tName=<%=Request("tName")%>' Style='color:white'>Empty</A></TH>
			<TH><A href='db_sql.asp?dbName=<%=dbName%>' Style='color:white'>SQL</A></TH>
			<TH><A href='tbl_create.asp?dbName=<%=dbName%>' Style='color:white'>Create</A></TH>
			<TH bgcolor=red><A href='db_drop.asp?dbName=<%=dbName%>' Style='color:white'>Drop</A></TH>
		</TR>
	</Table>
<br /><br />
<Center>
	<Form action=tbl_add_index.asp method=post>
	<Table border=0 cellpadding=1 cellspacing=1 width=50%>
		<TR bgcolor=#666699>
			<TH Style='color:white' ColSpan=2>Create Index on <%=Request("tName")%> (<%=Request("colName")%>) </TH>
		</TR>
		<%
			If Request("action")="Go" Then
				Set oConn=CreateObject("SQLDMO.SQLServer")
				oConn.Connect sName, UID, Passwd
				CheckErr%>
						
		<TR bgcolor=#CCCCCC>
			<TD><B>Index Column</B></TD>
			<TD>
<%				For I=1 To cInt(Trim(cStr(Request("fldNo"))))%>
				<Select Name=colName>
<%					For Each fName In oConn.Databases(dbName).Tables(cStr(Request("tName"))).Columns%>
					<Option><%=fName.Name%></Option>
<%					Next%>
				</Select>
				<Br />
<%				Next%>
			</TD>
		</TR>
<%				oConn.Close
				Set oConn=Nothing
			End If
%>
		<TR bgcolor=#EEEEEE>
			<TD><B>Index Name:</B></TD>
			<TD>
				<Input type=text name=idxName />
			</TD>
		</TR>
		<TR bgcolor=#CCCCCC>
			<TD><B>Index Type:</B></TD>
			<TD>
				<Select name=idxType>
					<Option></Option>
					<Option>Unique</Option>
					<Option>Clustered</Option>
					<Option>Nonclustered</Option>
				</Select>
			</TD>
		</TR>
		<TR bgcolor=#EEEEEE>
			<TD><B>Index Order:</B></TD>
			<TD>
				<Select name=idxOrder>
					<Option></Option>
					<Option>ASC</Option>
					<Option>DESC</Option>
				</Select>
			</TD>
		</TR>
		<TR bgcolor=#CCCCCC>
			<TD><B>Index Option:</B></TD>
			<TD>
				<Select name=idxOpt>
					<Option></Option>
					<Option>Pad_Index</Option>
					<Option>Ignore_Dup_Key</Option>
					<Option>Drop_Existing</Option>
					<Option>Statistics_NoRecompute</Option>
					<Option>Sort_In_TempDB</Option>
				</Select>
			</TD>
		</TR>
		<TR bgcolor=#EEEEEE>
			<TD colspan=2>&nbsp
				<Input type=Hidden name=dbName value=<%=dbName%> />
				<Input type=hidden name=tName value=<%=Request("tName")%> />
		<%
			If Request("action")<>"Go" Then%>
				<Input Type=Hidden Name=colName Value=<%=Request("colName")%> />
<%			End If%>
			</TD>
		</TR>
		<TR bgcolor=#666699>
			<TD align=center colspan=2>
				<Input type=submit name=action value='Create Index' />
			</TD>
		</TR>
	</Table>
	</Form>
</Body>
</HTML>

