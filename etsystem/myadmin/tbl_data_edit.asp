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
	Dim I
	Dim strQuery
	Dim Data_Type_Field
	Dim QueryCounter
	Dim errText
	Dim taRows
	Dim taCols
	
	On Error Resume Next
	
	Set oConn=Server.CreateObject("ADODB.Connection")
	OpenDB oConn
	
	CheckErr
	
	Set oRS=Server.CreateObject("ADODB.Recordset")
	Set oRS1=Server.CreateObject("ADODB.Recordset")
	
	If Request("action")<>"" Then
		If Request("action")="Save" Then
			
			OpenRS oRS, oConn, "sp_columns " & cStr(Request("tName"))
			
			CheckErr
			
			OpenRS oRS1, oConn, "sp_datatype_info"
			
			CheckErr
			
			strQuery="Update " & cStr(Request("tName")) & " set "
			QueryCounter=0
			errText=""
			QueryCounter=""
			
			While Not oRS.EOF
				If Right(oRS("TYPE_NAME"),8)<>"identity" And oRS("TYPE_NAME")<>"image" Then
					If oRS("nullable")=0 And Request(oRS("column_name"))="" Then
						errText="<Br /><Font color=red><B>All * marked fields are NOT NULL columns. You can't leave them empty</B></Font><Br />"
					End If
					
					strQuery=strQuery & QueryCounter & oRS("column_name") & "="
					
					If Not oRS1.BOF Then
						oRS1.MoveFirst
					End If
					
					Do While Not oRS1.EOF
						If oRS1("TYPE_NAME")=oRS("TYPE_NAME") Then
							Exit Do
						End If
						oRS1.MoveNext
					Loop
					
					If Not IsNull(oRS1("Literal_Prefix")) Then
						strQuery=strQuery & oRS1("literal_prefix")
					End If
						
					strQuery=strQuery & Replace(Trim(cStr(Request(oRS("column_name")))),"'","''")
					
					If Not IsNull(oRS1("Literal_Suffix")) Then
						strQuery=strQuery & oRS1("Literal_Suffix")
					End If
					QueryCounter=", "
				End If
				oRS.MoveNext
			Wend
			
			If errText="" Then
				If Request("strKey")="No" Then
					strQuery=strQuery & " WHERE CURRENT OF abc"
					oConn.Execute "Declare abc Cursor Dynamic for select * from " & cStr(Request("tName")) & " open abc"
					oConn.Execute "Fetch relative " & cStr(Request("strParam")) & " from abc"
					CheckErr
				Else
					strQuery=strQuery & " Where " & Replace(cStr(Request("strParam")), "%22", """")

				End If
				
				oConn.Execute strQuery
				CheckErr
			End If
		End If
			CloseRS oRS1
			Set oRS1=Nothing
		
			CloseRS oRS
			Set oRS=Nothing
		
			CloseDB oConn
			Set oConn=Nothing
				
			Response.Redirect "tbl_browse.asp?dbName=" & Request("dbName") & "&tName=" & Request("tName")
			
			Response.End
			
	End If
%>
<HTML>
<HEAD>
	<Link Href=style.css REL=StyleSheet />
	<Title>ASPMyAdmin For SQL Server By Sukalyan Chakraborty</Title>
	<Meta Name=Description Content="SQL Server web frontend developed by Sukalyan Chakraborty for free use" />
	<Meta Name=Keywords Content="SQL Server web frontend inspired by PHPMyAdmin created by Sukalyan Chakraborty aimed to release more advanced versions in future" />
	
</HEAD>
<BODY>
<Br />
<Br /><Br />
<B>Server: <IMG src="images/server.gif" align="absbottom" ><A href='dbindex.asp'><%=sName%></A> 
&gt;&gt; <A href='server_databases.asp'>Database</A> &gt;&gt; <A href='db_info.asp?dbName=<%=Request("dbName")%>'><%=Request("dbName")%></A> 
&gt;&gt; <A href='db_table.asp?dbName=<%=Request("dbName")%>'>Table</A> &gt;&gt; 
<%=Request("tName")%> &gt;&gt; Edit </B><Br />
<Br />
	<Table border=1 cellspacing=0 cellpadding=0 width=100%>
		<TR bgcolor=#666699 style='color:white'>
			<TH><A href='tbl_browse.asp?dbName=<%=Request("dbName")%>&tName=<%=Request("tName")%>&pgNo=<%=Request("pgNo")%>' Style='color:white'>Browse</A></TH>
			<TH><A href='tbl_data_insert.asp?dbName=<%=Request("dbName")%>&tName=<%=Request("tName")%>' Style='color:white'>Insert</A></TH>
			<TH><A href='tbl_structure.asp?dbName=<%=Request("dbName") %>&tName=<%=Request("tName") %>' style='color:white'>Structure</A></TH>
			<TH><A href='tbl_empty.asp?dbName=<%=Request("dbName")%>&tName=<%=Request("tName")%>' Style='color:white'>Empty</A></TH>
			<TH><A href='db_sql.asp?dbName=<%=dbName%>' Style='color:white'>SQL</A></TH>
			<TH><A href='tbl_create.asp?dbName=<%=dbName%>' Style='color:white'>Create</A></TH>
			<TH bgcolor=red><A href='db_drop.asp?dbName=<%=dbName%>' Style='color:white'>Drop</A></TH>
		</TR>
	</Table>
	<%=errText %>
	<Form Action="" Method=Post>
	<Table border=0 cellpadding=1 cellspacing=1>
		<TR bgcolor=#666699>
			<TH style='color:white' ColSpan=3>Edit Data</TH>
		</TR>
		<TR bgcolor=orange>
			<TH>Field</TH>
			<TH>Value</TH>
			<TH>Data Type</TH>
		</TR>
<%
	
	CheckErr	
	
	If Request("strKey")="No" Then
		oConn.Execute "Declare abc Cursor Dynamic for select * from " & cStr(Request("tName")) & " open abc"
		OpenRS oRS, oConn, "Fetch relative " & cStr(Request("strParam")) & " from abc"
	Else
		OpenRS oRS, oConn, "Select * from " & Trim(cStr(Request("tName"))) & " Where " & Replace(cStr(Request("strParam")),"&quot", "\&quot")
	End If
	
	CheckErr
	
	OpenRS oRS1, oConn, "sp_columns " & Trim(cStr(Request("tName")))
	
	CheckErr
	
	For I=0 to oRS.Fields.Count-1
		
		If oRS1("TYPE_NAME")<>"image" And oRS1("TYPE_NAME")<>"binary" And oRS1("TYPE_NAME")<>"varbinary" Then
			If oRS1("Type_Name")<>"sysname" And oRS1("Type_Name")<>"timestamp" Then%>
		<TR bgcolor=#EEEEEE>
			<TD><% Response.Write oRS.Fields(I).Name
				If oRS1("nullable")=0 Then%>
				<Font color=red><B>*</B></Font><%End If%></TD>
			<TD><%	If Right(oRS1("TYPE_NAME"),8)="identity" Then%>
				<%=oRS.Fields(I)%></TD>
			<%	ElseIF oRS1("TYPE_NAME")<>"image" Then
					If oRS1("Length")>100 Then
						If oRS1("Length")<=1000 Then
							taRows=7
							taCols=40
						ElseIf oRS1("Length")>1000 And oRS1("Length")<=5000 Then
							taRows=10
							taCols=55
						Else
							taRows=15
							taCols=75
						End If%>
				<Textarea Name=<%=oRS.Fields(I).Name%> rows=<%=taRows%> cols=<%=taCols%>><%=Replace(oRS.Fields(I), """", "&quot;")%></Textarea>
				
			</TD>
				<%	Else%>
				<Input type=text name=<%=oRS.Fields(I).Name%> 
					<%	If oRS.Fields(I)<>"" Then%>
						Value="<%=Replace(oRS.Fields(I), """", "&quot;")%>">
			</TD>
					<%	Else%>
						 >
			</TD>
					<%	End If
					End If
				End If%>
			<TD>
				<Input Type=Hidden Name='<% Response.Write oRS.Fields(I).Name & "_type"%>' Value=<%=oRS1("Data_Type")%> /><%=oRS1("TYPE_NAME")%>(<%=oRS1("Length")%>)
			</TD>
		</TR>
		<%	End If
		End If
		oRS1.MoveNext
	Next
	
	CloseRS oRS1
	Set oRS1=Nothing
	
	CloseRS oRS
	Set oRS=Nothing
	
	CloseDB oConn
	Set oConn=Nothing
%>
		<TR bgcolor=#666699>
			<TH>
				<Input Type=Hidden Name=strParam Value="<%=Replace(Request("strParam"),"""","%22") %>" />
				<Input Type=Hidden Name=strKey Value=<%=Request("strKey")%> />
				<Input Type=Hidden Name=dbName Value=<%=Request("dbName")%> />
				<Input Type=Hidden Name=tName Value=<%=Request("tName")%> />
				<Input Type=Hidden Name=rowNo Value=<%=Request("rowNo")%> />
				<Input Type=Hidden Name=pgNo Value=<%=Request("pgNo")%> />
			</TH>
			<TH>
				<Input Type=Submit name=action value=Save />
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
