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
	
	On Error Resume Next
	
	Set oConn=Server.CreateObject("ADODB.Connection")
	OpenDB oConn
	
	CheckErr
	
	Set oRS=Server.CreateObject("ADODB.Recordset")
	Set oRS1=Server.CreateObject("ADODB.Recordset")
	
	If Request("action")="Save" Then
		Dim strQuery
		
		strQuery="Alter table " & Request("tName") & " alter column " & Request("colName") & " " & Request("fldType")
		OpenRS oRS1, oConn, "sp_datatype_info"
		
		CheckErr
		
		Do While Not oRS1.EOF
			If oRS1("Type_Name")=Request("fldType") Then
				Exit Do
			End If
			oRS1.MoveNext
		Loop
		
		If Not IsNull(oRS1("Create_Params")) Then
			strQuery=strQuery & "(" & Trim(cStr(Request("fldLen"))) & ")"
		End If
		If Request("fldNull")="Not Null" Then
			strQuery=strQuery & " Not Null"
		End If
		
		oConn.Execute strQuery
		If err.number<>0 Then
			Response.Write "<Table border=1 CellSpacing=0 CellPadding=0 Width=500><TR bgColor=#666699><TH Style='color:white'>SQL Syntax</TH></TR>"
			Response.Write "<TR><TD>" & strQuery & "</TD></TR></Table><Br />"
			CheckErr
		End If
		
		CloseRS oRS1
		Set oRS1=Nothing
	
		CloseRS oRS
		Set oRS=Nothing
	
		CloseDB oCOnn
		Set oConn=Nothing
		
		Response.Redirect "tbl_structure.asp?dbName=" & dbName & "&tName=" & Request("tName")
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
&gt;&gt; <A href='server_databases.asp'>Database</A> &gt;&gt; <A href='db_info.asp?dbName=<%=dbName%>'><%=dbName %></A> 
&gt;&gt; <A href='db_table.asp?dbName=<%=dbName %>'>Table</A> &gt;&gt; <%=Request("tName") %> 
&gt;&gt; Modify </B><Br />
<Br />
	<Table border=1 cellspacing=0 cellpadding=0 width=100%>
		<TR bgcolor=#666699 style='color:white'>
			<TH><A Href='tbl_browse.asp?dbName=<%=dbName%>&tName=<%=Request("tName")%>' Style='color:white'>Browse</a></TH>
			<TH><A href='tbl_data_insert.asp?dbName=<%=dbName%>&tName=<%=Request("tName")%>' Style='color:white'>Insert</A></TH>
			<TH><A href='tbl_structure.asp?dbName=<%=dbName %>&tName=<%=Request("tName") %>' style='color:white'>Structure</a></TH>
			<TH><A Href='tbl_empty.asp?dbName=<%=dbName%>&tName=<%=Request("tName")%>' Style='Color:white'>Empty</a></TH>
			<TH><A href='db_sql.asp?dbName=<%=dbName%>' Style='color:white'>SQL</A></TH>
			<TH><A href='tbl_create.asp?dbName=<%=dbName%>' Style='color:white'>Create</A></TH>
			<TH bgcolor=red><A href='db_drop.asp?dbName=<%=dbName%>' Style='color:white'>Drop</A></TH>
		</TR>
	</Table>
	
	<Form Action="" Method=Post>
	<Table Border=1 CellSpacing=0 CellPadding=0>
		<TR ColSpan=8 bgColor=#666699>
			<TH Style='color:white' ColSpan=4>Modify Table <%=Request("tName")%> -> <%=Request("colName")%></TH>
		</TR>
		<TR bgColor=orange>
			<TH>Field</TH>
			<TH>Type</TH>
			<TH>Length/Precision, scale</TH>
			<TH>Not Null</TH>
		</TR>
		<TR bgColor=#EEEEEE>
			<TD><%=Request("colName")%></TD>
			<TD>
		<%
			Dim HasKey
			Dim pk_key
			Dim u_key
			
			OpenRS oRS, oConn, "sp_columns @table_name=" & Request("tName") & ", @column_name=" & Request("colName")
			
			CheckErr
			
			OpenRS oRS1, oConn, "sp_datatype_info"
			
			CheckErr%>
			
				<Select Name=fldType>

<%				While Not oRS1.EOF%>
					<Option <% IF oRS("Type_Name")=oRS1("Type_Name") Then%> Selected <%End If%>><%=oRS1("Type_Name")%></Option>
<%					oRS1.MoveNext
				Wend%>
				</Select>
			</TD>
			<TD>
				<Input Type=Text Name=fldLen Value=<% If Not IsNull(oRS("Char_Octet_Length")) Then Response.Write oRS("Length") End IF%>>
			</TD>
			<TD>
				<Select Name=fldNull>
					<Option <%If oRS("nullable")=1 Then%>Selected<% End If%>>Null</Option>
					<Option <%If oRS("nullable")=0 Then%>Selected<% End If%>>Not Null</Option>
				</Select>
			</TD>
		</TR>
		<TR bgColor=#666699>
			<TH ColSpan=4>
				<Input Type=Hidden Name=colName Value=<%=Request("colName")%> />
				<Input Type=Hidden Name=tName Value=<%=Request("tName")%> />
				<Input Type=Hidden Name=dbName Value=<%=Request("dbName")%> />
				<Input Type=Submit Name=action Value=Save />
			</TH>
		</TR>
	</Table>
	</Form>
<%	
	CloseRS oRS1
	Set oRS1=Nothing
	
	CloseRS oRS
	Set oRS=Nothing
	
	CloseDB oConn
	Set oConn=Nothing
%>
</BODY>
</HTML>
