<%@ Language=VBScript %>
<!-- #include file="config.asp" -->
<!-- #include file="functions/function.asp" -->
<%
	If Trim(cStr(Request("dbName")))<>"" Then
		dbName=Trim(cStr(Request("dbName")))
	End If
	
	Dim oConn
	Dim oRS
	Dim oRS1
	Dim strQuery
	Dim strQuery1
	Dim strQuery2
	Dim errText
	Dim HasComma
	Dim colName
	
	On Error Resume Next
	
	set oConn=Server.CreateObject("ADODB.Connection")
	Set oRS=Server.CreateObject("ADODB.Recordset")
	Set oRS1=Server.CreateObject("ADODB.Recordset")
	
	If Request("action")<>"" Then
		If Left(cStr(Request("action")),4)="Save" Then
			OpenDB oConn
			
			CheckErr
			
			OpenRS oRS, oConn, "sp_columns " & cStr(Request("tName"))
			
			CheckErr
			
			OpenRS oRS1, oConn, "sp_datatype_info"
			
			CheckErr
			
			strQuery1="insert into " & cStr(Request("tName")) & "("
			strQuery2="values("
			errText=""
			HasComma=""
			
			While Not oRS.EOF
				If oRS("Type_Name")<>"image" And oRS("Type_Name")<>"binary" And oRS("Type_Name")<>"varbinary" And Right(cStr(oRS("Type_Name")),8)<>"identity" Then
					If oRS("nullable")=0 And Request(oRS("column_name"))="" Then
						errText="<Br /><Font color=red><B>All * marked fields are NOT NULL columns. You can't leave them empty</B></Font><Br />"
					End If
					If Right(oRS("TYPE_NAME"),8)<>"identity" Or oRS("TYPE_NAME")<>"sysname" oR oRS("TYPE_NAME")<>"timestamp" Then
						IF oRS("TYPE_NAME")<>"image" And oRS("TYPE_NAME")<>"binary" And oRS("TYPE_NAME")<>"varbinary" Then
							IF Request(oRS("COLUMN_NAME"))<>"" Then
								strQuery1=strQuery1 & HasComma & oRS("COLUMN_NAME")
							
								colName=oRS("COLUMN_NAME") & "_type"
								If Not oRS1.BOF Then
									oRS1.MoveFirst
								End If
								
								Do While Not oRS1.EOF
									If oRS1("TYPE_NAME")=oRS("TYPE_NAME") Then
										Exit Do
									End If
									oRS1.MoveNext
								Loop
								strQuery2=strQuery2 & HasComma & oRS1("LITERAL_PREFIX") & Replace(Trim(cStr(Request(oRS("COLUMN_NAME")))),"'","''") & oRS1("LITERAL_SUFFIX")
								HasComma=", "
							End If
						End If
					End If
				End If
				oRS.MoveNext
			Wend
			strQuery=strQuery1 & ") " & strQuery2 & ")"
			If errText="" Then
				oConn.Execute strQuery
				CheckErr
			Else
				CloseRS oRS
				Set oRS=Nothing
				CloseRS oRS1
				Set oRS1=Nothing
				CloseDB oConn
				Set oConn=Nothing
				Response.Redirect "tbl_data_insert.asp?dbName=" & dbName & "&tName=" & Request("tName") & "&errText=" & errText
				Response.End
			End If
		End If
		If Request("action")="Save & Continue" Then
			CloseRS oRS
			Set oRS=Nothing
			CloseRS oRS1
			Set oRS1=Nothing
			CloseDB oConn
			Set oConn=Nothing
			Response.Redirect "tbl_data_insert.asp?dbName=" & dbName & "&tName=" & Request("tName")
			Response.End
		End If
		Set oRS=Nothing
		Set oRS1=Nothing
		Set oConn=Nothing
		Response.Redirect "tbl_browse.asp?dbName=" & dbName & "&tName=" & Request("tName")
		Response.End
	End If
%>
<HTML>
<HEAD>
	<Link Href=style.css rel=stylesheet />
	<Title>ASPMyAdmin For SQL Server By Sukalyan Chakraborty</Title>
	<Meta Name=Description Content="SQL Server web frontend developed by Sukalyan Chakraborty for free use" />
	<Meta Name=Keywords Content="SQL Server web frontend inspired by PHPMyAdmin created by Sukalyan Chakraborty aimed to release more advanced versions in future" />
	
</HEAD>
<BODY>
<Br />
<Br /><Br />
<B>Server: <IMG src="images/server.gif" align="absbottom" ><A href='dbindex.asp'><%=sName %></A> 
&gt;&gt; <A href='server_databases.asp'>Database</A> &gt;&gt; <A href='db_info.asp?dbName=<%=dbName%>'><%=dbName %></A> 
&gt;&gt; <A href='db_table.asp?dbName=<%=dbName %>'>Table</A> &gt;&gt; <%=Request("tName") %> 
&gt;&gt; Insert </B><Br />
<Br />
	<Table border=1 cellspacing=0 cellpadding=0 width=100%>
		<TR bgcolor=#666699 style='color:white'>
			<TH><A Href='tbl_browse.asp?dbName=<%=dbName%>&tName=<%=Request("tName")%>' Style='color:white'>Browse</a></TH>
			<TH bgcolor=white style='color:black'>Insert</TH>
			<TH><A href='tbl_structure.asp?dbName=<%=dbName %>&tName=<%=Request("tName") %>' style='color:white'>Structure</a></TH>
			<TH><A Href='tbl_empty.asp?dbName=<%=dbName%>&tName=<%=Request("tName")%>' Style='Color:white'>Empty</a></TH>
			<TH><A href='db_sql.asp?dbName=<%=dbName%>' Style='color:white'>SQL</A></TH>
			<TH><A href='tbl_create.asp?dbName=<%=dbName%>' Style='color:white'>Create</A></TH>
			<TH bgcolor=red><A href='db_drop.asp?dbName=<%=dbName%>' Style='color:white'>Drop</A></TH>
		</TR>
	</Table>
	<br /><br /><br />
	<% Response.Write Request("errText") %>
	<Form Action="" Method=Post>
	<Table Border=0 CellPadding=1 CellSpacing=1>
		<TR bgColor=#666699>
			<TH Style='color:white' ColSpan=3>Insert Data</TH>
		</TR>
		<TR bgColor=orange>
			<TH>Field</TH>
			<TH>Value</TH>
			<TH>Data Type</TH>
		</TR>
<%
	
	OpenDB oConn
	
	CheckErr

	
	OpenRS oRS1, oConn, "sp_columns @table_name='" & cStr(Request("tName")) & "'"
	
	CheckErr
	
	While Not oRS1.EOF%>	
		<TR bgcolor=#EEEEEE>
			<TD><%=oRS1("COLUMN_NAME")%>
		<%If oRS1("nullable")=0 Then%>
				<Font color=red><B>*</B></Font>
		<%End If%>
			</TD>
			<TD>
		<%If Right(oRS1("TYPE_NAME"),8)="identity" Or oRS1("TYPE_NAME")="sysname" oR oRS1("TYPE_NAME")="timestamp" Then%>
			</TD>
		<%ElseIF oRS1("TYPE_NAME")<>"image" And oRS1("TYPE_NAME")<>"binary" And oRS1("TYPE_NAME")<>"varbinary" Then
			If oRS1("Length")>=150 Then
				If oRS1("Length")<=1000 Then
					taRows=5
					taCols=40
				ElseIf oRS1("Length")>1000 And oRS1("Length")<=5000 Then
					taRows=10
					taCols=55
				Else
					taRows=15
					taCols=75
				End If%>
				<Textarea Name=<%=oRS1("COLUMN_NAME")%> rows=<%=taRows%> cols=<%=taCols%>></Textarea>
			</TD>
			<%Else%>
				<Input type=text name=<%=oRS1("COLUMN_NAME")%> />
			</TD>
			<%End If
		End If%>
			<TD>
				<Input Type=Hidden Name=<% Response.Write oRS1("COLUMN_NAME") & "_type"%> Value=<%=oRS1("Data_Type")%> /><%=oRS1("TYPE_NAME")%>(<%=oRS1("Length")%>)
			</TD>
		</TR>
		<%oRS1.MoveNext
	Wend
	

	CloseRS oRS1
	Set oRS1=Nothing
	CloseDB oConn
	Set oConn=Nothing
%>
		<TR bgcolor=#666699>
			<TH>
				<Input Type=Hidden Name=dbName Value='<%=Request("dbName")%>' />
				<Input Type=Hidden Name=tName Value='<%=Request("tName")%>' />
				<Input Type=Submit name=action value=Save />
			</TH>
			<TH>
				<Input Type=Submit name=action value="Save & Continue" />
			</TH>
			<TH>
				<Input Type=Submit Name=action Value=Cancel />
			</TH>
		</TR>
	</Table>
	</Form>
	<UL>
		<LI /><Font color=red>*</Font> marked field(s) are <B>NOT NULL</B> field(s). Please don't leave those field(s) blank.
		<LI />Please don't add ( ' ) for the charecter fields at the begining or end as done in the insert command.
	</UL>
</BODY>
</HTML>
