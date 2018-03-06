<%@ Language=VBScript %>
<!-- #include file="config.asp" -->
<!-- #include file="functions/function.asp" -->
<%
	If Request("dbName")<>"" Then
		dbName=cStr(Request("dbName"))
	End If
	
	On Error Resume Next
	
	Dim oConn
	Dim I
	Dim Data_Type
	Dim oRS
	
	If Request("action")="Save" Then		
		Set oConn=Server.CreateObject("ADODB.Connection")
		OpenDB oConn
		
		CheckErr
		
		Set oRS=Server.CreateObject("ADODB.Recordset")
		OpenRS oRS, oConn, "sp_datatype_info"
		
		CheckErr	
		
		I=1
		While I<=cInt(Trim(cStr(Request("fldNo"))))
			fldName="fldName_" & I
			fldType="fldType_" & I
			fldLen="fldLen_" & I
			fldNull="fldNull_" & I
			fldDefault="fldDefault_" & I
			
			If Not oRS.BOF Then
				oRS.MoveFirst
			End If
			
			Do While Not oRS.EOF
				If UCase(Trim(cStr(Request(fldType))))=UCase(oRS("Type_Name")) Then
					Exit Do
				End If
				oRS.MoveNext
			Loop
			
			strQuery="Alter Table " & Trim(cStr(Request("tName"))) & " add " & Trim(cStr(Request(fldName))) & " " & Trim(cStr(Request(fldType)))
			If oRS("Create_Params")<>"" Then
				strQuery=strQuery & "(" & Trim(cStr(Request(fldLen))) & ")"
			End If
			If Trim(cStr(Request(fldNull)))="Not Null" Then
				strQuery=strQuery & " Not Null"
			End If
			If Trim(cStr(Request(fldDefault)))<>"" Then
				strQuery=strQuery & " Default "
				If oRS("Literal_Prefix")<>"" Then
					strQuery=strQuery & oRS("Literal_Prefix") & Trim(cStr(Request(fldDefault))) & oRS("Literal_Suffix")
				Else
					strQuery=strQuery & Trim(cStr(Request(fldDefault)))
				End If
			End If
			
			oConn.Execute strQuery
			
			CheckErr
			
			I=I+1
		Wend
		
		CloseRS oRS
		Set oRS=Nothing
		CloseDB oConn
		Set oConn=Nothing
		
		Response.Redirect "tbl_structure.asp?dbName=" & dbName & "&tName=" & cStr(Request("tName"))
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
<B>Server: <IMG src="images/server.gif" align="absbottom" ><A href='dbindex.asp'><%=sName%></A> 
&gt;&gt; <A href='server_databases.asp'>Database</A> &gt;&gt; <A href='db_info.asp?dbName=<%=dbName%>'><%=dbName%></A> 
&gt;&gt; <A href='db_table.asp?dbName=<%=dbName%>'>Table</A> &gt;&gt; <%=Request("tName")%> 
&gt;&gt; Add Field</B><Br />
<Br />
	<Table border=1 cellspacing=0 cellpadding=0 width=100%>
		<TR bgcolor=#666699 style='color:white'>
			<TH><a href='tbl_browse.asp?dbName=<% Response.Write dbName %>&tName=<% Response.Write Request("tName") %>' style='color:white'>Browse</a></TH>
			<TH><A href='tbl_data_insert.asp?dbName=<%=dbName%>&tName=<%=Request("tName")%>' Style='color:white'>Insert</A></TH>
			<TH><a href='tbl_structure.asp?dbName=<% Response.Write dbName %>&tName=<% Response.Write Request("tName") %>' style='color=white'>Structure</a></TH>
			<TH><A href='tbl_empty.asp?dbName=<%=dbName%>&tName=<%=Request("tName")%>' Style='color:white'>Empty</A></TH>
			<TH><A href='db_sql.asp?dbName=<%=dbName%>' Style='color:white'>SQL</A></TH>
			<TH><A Href='tbl_create.asp?dbName=<%=dbName%>' Style='color:white'>Create</A></TH>
			<TH bgcolor=red><A href='db_drop.asp?dbName=<%=dbName%>' Style='color:white'>Drop</A></TH>
		</TR>
	</Table>
<Br /><Br />
<%
	
	Set oConn=Server.CreateObject("ADODB.Connection")
	OpenDB oConn
	
	CheckErr
	
	Set oRS=Server.CreateObject("ADODB.Recordset")
	OpenRS oRS, oConn, "sp_datatype_info"
%>
	<Form action=tbl_add_field.asp method=get name=mainform id=mainform>
	<Table border=0 cellpadding=1 cellspacing=1 width=100%>
		<TR bgcolor=#666699 style='color:white'>
			<TH>Field</TH>
			<TH>Type</TH>
			<TH>Length/<BR />Precision,Scale</TH>
			<TH>Null</TH>
			<TH>Default</TH>
		</TR>

<%	For I=1 to  Request("fldNo")%>
		<TR bgcolor=#EEEEEE align=center>
			<TD>
				<Input Type=text Name=fldName_<%=I%> />
			</TD>
			<TD>
				<Select Name=fldType_<%=I%>>
<%		If Not oRS.BOF Then
			oRS.MoveFirst
		End If
		While Not oRS.EOF%>
					<Option><%=oRS("Type_Name")%></Option>
<%			oRS.MoveNext
		Wend%>
				</Select>
			</TD>
			<TD>
				<Input Type=text Name=fldLen_<%=I%> />
			</TD>
			<TD>
				<Select Name=fldNull_<%=I%> />
					<Option>Null</Option>
					<Option>Not Null</Option>
				</Select>
			</TD>
			<TD>
				<Input Type=text Name=fldDefault_<%=I%> />
			</TD>
		</TR>
<%	Next%>
		<TR>
			<TD ColSpan=9>&nbsp
				<Input Type=Hidden Name=dbName Value='<%=dbName%>' />
				<Input Type=Hidden Name=tName Value='<%=Request("tName")%>' />
				<Input Type=Hidden Name=fldNo Value='<%=Trim(cStr(Request("fldNo")))%>' />
			</TD>
		</TR>
		<TR bgColor=#666699>
			<TD ColSpan=9 Align=center>
				<Input Type=Submit Name=action Value='Save' />
			</TD>
		</TR>
	</Form>
	</Table>
	<Br />
	<HR size=1 />
	<Form Action=tbl_add_field.asp Method=Post>
		<Input Type=Hidden Name=dbName Value=<%=dbName%> />
		<Input Type=Hidden Name=tName Value=<%=Request("tName")%> />
		Add 
		<Input Type=Text Name=fldNo Value=1 size=3 />
		 Fields &nbsp; 
		<Input Type=Submit Name=action Value='Go' />
	</Form>
<%
	CloseRS oRS
	Set oRS=Nothing
	
	CloseDB oConn
	Set oConn=Nothing
%>

</BODY>
</HTML>
