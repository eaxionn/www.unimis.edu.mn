<%@ Language=VBScript %>
<!-- #include file="functions/function.asp" -->
<!-- #include file="config.asp" -->
<%
	If Request("dbName")<>"" Then
		dbName=Trim(cStr(Request("dbName")))
	End If
	
	On Error Resume Next	
%>
<HTML>
<HEAD>
	<Link href=style.css rel=stylesheet>
	<Title>ASPMyAdmin For SQL Server By Sukalyan Chakraborty</Title>
	<Meta Name=Description Content="SQL Server web frontend developed by Sukalyan Chakraborty for free use" />
	<Meta Name=Keywords Content="SQL Server web frontend inspired by PHPMyAdmin created by Sukalyan Chakraborty aimed to release more advanced versions in future" />
	
	<script src="functions/setPointer.js" type="text/javascript" language="javascript">
	</script>
</HEAD>
<BODY>
<Br />
<Br /><Br />
<B>Server: <IMG src="images/server.gif" align="absmiddle" ><A href='dbindex.asp'><%=sName %></A> 
&gt;&gt; <A href='server_databases.asp'>Database</A> &gt;&gt; <A href='db_info.asp?dbName=<%=dbName %>'><%=dbName %></A> 
&gt;&gt; <A href='db_table.asp?dbName=<%=dbName %>'>Table</A> &gt;&gt; <%=Request("tName") %> 
&gt;&gt; Structure </B><Br />
<Br />
	<Table border=1 cellspacing=0 cellpadding=0 width=100%>
		<TR bgcolor=#666699 style='color:white'>
			<TH><A href='tbl_browse.asp?dbName=<%=dbName %>&tName=<%=Request("tName") %>' Style='color:white'>Browse</A></TH>
			<TH><A Href='tbl_data_insert.asp?dbName=<%=dbName%>&tName=<%=Request("tName")%>' Style='color:white'>Insert</A></TH>
			<TH bgcolor=white style='color:black'>Structure</TH>
			<TH><A Href='tbl_empty.asp?dbName=<%=dbName%>&tName=<%=Request("tName")%>' Style='color:white'>Empty</a></TH>
			<TH><A href='db_sql.asp?dbName=<%=dbName%>' Style='color:white'>SQL</A></TH>
			<TH><A href='tbl_create.asp?dbName=<%=dbName%>' Style='color:white'>Create</A></TH>
			<TH bgcolor=red><A href='db_drop.asp?dbName=<%=dbName%>' Style='color:white'>Drop</A></TH>
		</TR>
	</Table>
	<br /><br />
	<TABLE BORDER=0 cellspacing=1 cellpadding=1 >
		<TR bgcolor=orange>
			<TH>Field Name</TH>
			<TH>Data type</TH>
			<TH>Length</TH>
			<TH>Null</TH>
			<TH>Default</TH>
			<TH ColSpan=5>Action</Th>
		</TR>
<%
	Dim oConn
	Dim oRS
	Dim colorCheck
	Dim dataSpace
	Dim colorName
	Dim I
	
	Set oConn=Server.CreateObject("ADODB.Connection")
	OpenDB oConn
	CheckErr
	
	Set oRS=Server.CreateObject("ADODB.Recordset")
	OpenRS oRS, oConn, "sp_columns " & cStr(Request("tName"))
	
	CheckErr
	
	colorCheck=0
	I=0
	
	While Not oRS.EOF
		If colorCheck=0 Then
			colorName="#EEEEEE"
			colorCheck=1
		Else
			colorName="#CCCCCC"
			colorCheck=0
		End If%>
		<TR bgcolor=<%=colorName%> onmouseover="setPointer(this, <%=I%>, 'over', '<%=colorName%>', '#CCCCFF', '#FFCC99');" onmouseout="setPointer(this, <%=I%>, 'out', '<%=colorName%>', '#CCCCFF', '#FFCC99');">
			<TD><%=oRS("Column_Name")%></TD>
			<TD><%=oRS("Type_Name")%></TD>
			<TD Align=Right><%=oRS("Length")%></TH>
			<TD>
		<%If oRS("nullable")=1 Then%>
			&nbsp</TD>
			<TD>
		<%Else%>
			Not Null</TD>
			<TD>
		<%End If%>
		
			<%=oRS("Column_Def")%>&nbsp</TD>
		
			<TD><A href='tbl_col_modify.asp?dbName=<%=dbName%>&tName=<%=Request("tName")%>&colName=<%=oRS("Column_Name")%>'>Edit</A></TD>
			<TD><A href='tbl_col_drop.asp?dbName=<%=dbName%>&tName=<%=Request("tName")%>&colName=<%=oRS("Column_Name")%>'>Delete</A></TD>
			<TD><A href='tbl_primary_key_add.asp?dbName=<%=dbName%>&tName=<%=Request("tName")%>&fldName=<%=oRS("Column_Name")%>'>Primary</A></TD>
			<TD><A href='tbl_foreign_key_add.asp?dbName=<%=dbName%>&tName=<%=Request("tName")%>&fldName=<%=oRS("Column_Name")%>'>Foreign</A></TD>
			<TD><A href='tbl_add_index.asp?dbName=<%=dbName%>&tName=<%=Request("tName")%>&colName=<%=oRS("Column_Name")%>'>Index</A></TD>
		</TR>
		<%oRS.MoveNext
		I=I+1
	Wend%>
	</Table>
	<HR size=1 />
	<Form action=tbl_add_field.asp method=Post>
		<Input Type=Hidden Name=dbName Value=<%=dbName%> />
		<Input Type=Hidden Name=tName Value=<%=Request("tName")%> />
		Add <Input Type=Text Name=fldNo Value='1' Size=3 /> Fields 
		&nbsp <Input Type=Submit Name=action value='Go' />
	</Form>
	<HR size=1 />
	<Table Border=0>
	<TR>
		<TD vAlign=Top>
			<Table Border=0 CellPadding=1 CellSpacing=1 Style='color:black'>
				<TR bgColor=#666699>
					<TH ColSpan=7 Style='color:white'>Indexes:</TH>
				</TR>
				<TR bgColor=orange>
					<TH>Key Name</TH>
					<TH>Type</TH>
					<TH>Field</TH>
					<TH>Cardinality</TH>
					<TH>Action</TH>
				</TR>
<%
	CloseRS oRS
	
	OpenRS oRS, oConn, "sp_indexes_rowset " & cStr(Request("tName"))
	CheckErr
	
	Dim idxType
	I=0
	While Not oRS.EOF
		If colorCheck=0 Then
			colorName="#EEEEEE"
			colorCheck=1
		Else
			colorName="#CCCCCC"
			colorCheck=0
		End If%>
				<TR bgcolor=<%=colorName%>  onmouseover="setPointer(this, <%=I%>, 'over', '<%=colorName%>', '#CCCCFF', '#FFCC99');" onmouseout="setPointer(this, <%=I%>, 'out', '<%=colorName%>', '#CCCCFF', '#FFCC99');">
					<TD><%=oRS("Index_Name")%></TD>
					<TD>
		<%If oRS("Primary_Key") Then
			idxType="Primary Key"
		ElseIf oRS("Unique") Then
			idxType="Unique"
		Else
			idxType="Index"
		End If%>
					<%=idxType%></TD>
					<TD><%=oRS("Column_Name")%></TD>
					<TD Align=Right ><%=oRS("Cardinality")%></TD>
					<TD><A href='tbl_drop_index.asp?dbName=<%=dbName%>&tName=<%=Request("tName")%>&idxName=<%=oRS("Index_Name")%>&idxType=<%=idxType%>'>Delete</A></TD>
				</TR>
		<%oRS.MoveNext
		I=I+1
	Wend%>
					<Form action=tbl_add_index.asp method=Post><tr bgcolor=#666699>
						<Input Type=Hidden Name=dbName Value=<%=dbName %> />
						<Input Type=Hidden Name=tName Value=<%=Request("tName") %> />
					<TH ColSpan=6 Style='color:white'>Create an index on 
						<Input Type=Text Name=fldNo Size=2 Value=1 /> Columns 
						<Input Type=Submit Name=action Value='Go' />
					</TH>
					</Form>
				</TR>
			</Table>
		</TD>
		<TD vAlign=Top>
			<Table Border=0 CellSpacing=1 CellPadding=1 Width=150>
				<TR bgcolor=#666699>
					<TH ColSpan=2 Style='color:white'>Space usage:</Th>
				</TR>
				<TR bgcolor=orange>
					<TH>Type</TH>
					<TH>Usage</TH>
				</TR>
<%
	CloseRS oRS
	OpenRS oRS, oConn, "sp_spaceused " & cStr(Request("tName"))
	CheckErr
%>	
				<TR bgColor=#EEEEEE>
					<TD>Data</TD>
					<TD Align=Right><%=oRS("data")%></TD>
				</TR>
				<TR bgColor=#CCCCCC>
					<TD>Index</TD>
					<TD Align=Right><%=oRS("index_size")%></TD>
				</TR>
				<TR bgColor=#EEEEEE>
					<TD>Total</TD>
					<TD Align=Right><%=oRS("Reserved")%></TD>
				</TR>
			</Table>
		</TD>
	</TR>
	<TR>
		<TD ColSpan=2>
			<Table Border=0 CellSpacing=1 CellPadding=1>
				<TR bgColor=#666699>
					<TH ColSpan=6 Style='color:white'>Relationships</TH>
				</TR>
				<TR bgColor=orange>
					<TH>Key Name</TH>
					<TH>Primary Key Table</TH>
					<TH>Primary Key Field</TH>
					<TH>Foreign Key Table</TH>
					<TH>Foreign Key Field</TH>
					<TH>Action</TH>
				</TR>
<%	CloseRS oRS
	OpenRS oRS, oConn, "sp_fKeys @fkTable_Name='" & cStr(Request("tName")) & "';"
	CheckErr
	I=0
	
	While Not oRS.EOF
		If colorCheck=0 Then
			colorName="#EEEEEE"
			colorCheck=1
		Else
			colorName="#CCCCCC"
			colorCheck=0
		End If%>
				<TR bgColor=<%=colorName%> onmouseover="setPointer(this, <%=I%>, 'over', '<%=colorName%>', '#CCCCFF', '#FFCC99');" onmouseout="setPointer(this, <%=I%>, 'out', '<%=colorName%>', '#CCCCFF', '#FFCC99');">
					<TD><%=oRS("fk_Name")%></TD>
					<TD><%=oRS("pkTable_Name")%></TD>
					<TD><%=oRS("pkColumn_Name")%></TD>
					<TD><%=oRS("fkTable_Name")%></TD>
					<TD><%=oRS("fkColumn_Name")%></TD>
					<TD><A href='tbl_drop_index.asp?dbName=<%=dbName%>&tName=<%=Request("tName")%>&idxName=<%=oRS("fk_Name")%>&idxType=FKey'>Delete</A></TD>
				</TR>
		<%oRS.MoveNext
		I=I+1
	Wend
	
	CloseRS oRS
	
	OpenRS oRS, oConn, "sp_fkeys @pkTable_Name='" & cStr(Request("tName")) & "';"
	CheckErr
	
	While Not oRS.EOF
		If colorCheck=0 Then
			colorName="#EEEEEE"
			colorCheck=1
		Else
			colorName="#CCCCCC"
			colorCheck=0
		End If%>
				<TR bgColor=<%=colorName%> onmouseover="setPointer(this, <%=I%>, 'over', '<%=colorName%>', '#CCCCFF', '#FFCC99');" onmouseout="setPointer(this, <%=I%>, 'out', '<%=colorName%>', '#CCCCFF', '#FFCC99');">
					<TD><%=oRS("fk_Name")%></TD>
					<TD><%=oRS("pkTable_Name")%></TD>
					<TD><%=oRS("pkColumn_Name")%></TD>
					<TD><%=oRS("fkTable_Name")%></TD>
					<TD><%=oRS("fkColumn_Name")%></TD>
					<TD><A href='tbl_drop_index.asp?dbName=<%=dbName%>&tName=<%=Request("tName")%>&idxName=<%=oRS("fk_Name")%>&idxType=FKey'>Delete</A></TD>
				</TR>
<%		oRS.MoveNext
		I=I+1
	Wend
	
	CloseRS oRS
	Set oRS=Nothing
	CloseDB oConn
	Set oConn=Nothing
%>
			</Table>
		</TD>
	</TR>
</Table>
</BODY>
</HTML>
