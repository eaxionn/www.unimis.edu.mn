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
<B>Server: <IMG src="images/server.gif" align="absbottom" ><A href='dbindex.asp'>
<% Response.Write sName %>
</A> &gt;&gt; <A href='server_databases.asp'>Database</A> &gt;&gt; <A href='db_info.asp?dbName=<% Response.Write dbName %>'>
<% Response.Write dbName %>
</A> &gt;&gt; <A href='db_table.asp?dbName=<% Response.Write dbName %>'>Table</A> 
&gt;&gt; 
<% Response.Write request("tName") %>
&gt;&gt; Browse </B><Br />
<Br />
	<Table border=1 cellspacing=0 cellpadding=0 width=100%>
		<TR bgcolor=#666699 style='color:white'>
			<TH bgcolor=white style='color:black'>Browse</TH>
			<TH><A href='tbl_data_insert.asp?dbName=<%=dbName%>&tName=<%=Request("tName")%>' Style='color:white'>Insert</A></TH>
			<TH><A href='tbl_structure.asp?dbName=<%=dbName %>&tName=<%=Request("tName") %>' style='color:white'>Structure</A></TH>
			<TH><A href='tbl_empty.asp?dbName=<%=dbName%>&tName=<%=Request("tName")%>' Style='color:white'>Empty</A></TH>
			<TH><A href='db_sql.asp?dbName=<%=dbName%>' Style='color:white'>SQL</A></TH>
			<TH><A href='tbl_create.asp?dbName=<%=dbName%>' Style='color:white'>Create</A></TH>
			<TH bgcolor=red><A href='db_drop.asp?dbName=<%=dbName%>' Style='color:white'>Drop</A></TH>
		</TR>
	</Table>
<%	
	Dim oConn
	Dim oRS
	Dim oRS1
	Dim oRS2
	Dim currPage
	Dim SQLString
	Dim PageCount
	Dim I
	Dim Records
	Dim colorCheck
	Dim rowNo
	Dim colorName	
	Dim strKey
	Dim strParam
	Dim strAnd
	
	Set oConn=Server.CreateObject("ADODB.Connection")
	OpenDB oConn
	
	CheckErr
	
	Set oRS=Server.CreateObject("ADODB.Recordset")
	Set oRS1=Server.CreateObject("ADODB.Recordset")
	Set oRS2=Server.CreateObject("ADODB.Recordset")	
	oRS.CursorLocation = 3
	oRS.PageSize = 25
	
	SQLString="select * from " & cStr(request("tName")) & ";"

	OpenRS oRS, oConn, SQLString
	CheckErr%>

	<Br />
	<B>Total <%=oRS.RecordCount%> Records</B>
	<Br />
	
<%	If oRS.RecordCount<=0 Then
		Response.Write "</BODY>" & vbCrlf & "</HTML>"
		Response.End
	End If
	
	PageCount=oRS.PageCount	

	If Request("pgNo")="" Then
		currPage=1
	Else
		currPage=cInt(Request("pgNo"))
	End If

	If 1>currPage Then currPage=1
	If currPage>PageCount Then currPage=PageCount
	

	oRS.AbsolutePage = CurrPage%>

	<Br />
	Page <%=CurrPage%> of <%=PageCount%> Pages
	<Br />
	
<%	If CurrPage=1 And PageCount>1 Then%>
	<A href='tbl_browse.asp?dbName=<%=dbName%>&tName=<%=Request("tName")%>&pgNo=<%=CurrPage+1%>'>Next</A>
	<Br />
<%	ElseIf CurrPage>1 And CurrPage<PageCount Then%>
	<A href='tbl_browse.asp?dbName=<%=dbName%>&tName=<%=Request("tName")%>&pgNo=<%=CurrPage-1%>'>Previous</A>&nbsp&nbsp
	&nbsp&nbsp<A href='tbl_browse.asp?dbName=<%=dbName%>&tName=<%=Request("tName")%>&pgNo=<%=CurrPage+1%>'>Next</A>
	<Br />
<%	ElseIf currPage=PageCount And PageCount>1 Then%>
	<A href='tbl_browse.asp?dbName=<%=dbName%>&tName=<%=Request("tName")%>&pgNo=<%=CurrPage-1%>'>Previous</A>
	<Br />
<%	End If

	If PageCount>1 Then
		For I=1 To PageCount
			If currPage=I Then
				Response.Write I
			Else%>
	<A href='tbl_browse.asp?dbName=<%=dbName%>&tName=<%=Request("tName")%>&pgNo=<%=I%>'> <%=I%> </A>&nbsp;&nbsp;
			<%End If
		Next 
	End If%>

	<Table Border=0 CellSpacing=1 CellPadding=1>
		<TR bgColor=Orange Align=Center>
			<TH ColSpan=2>Action</TH>
<%	For I=0 To oRS.Fields.Count-1%>
			<TH><%=oRS.Fields(I).Name%></TH>
<%	Next%>
		</TR>
	
<%	OpenRS oRS1, oConn,"sp_columns " & Request("tName")
	
	CheckErr
	
	OpenRS oRS2, oConn, "sp_indexes_rowset " & Request("tName")
	
	CheckErr
		
	colorCheck=0
	Records=0
	I=0
	
	rowNo=(currPage*25)-24
	
	While Records < 25 And Not oRS.EOF
			If colorCheck=0 Then
				colorName="#EEEEEE"
				colorCheck=1
			Else
				colorName="#CCCCCC" 
				colorCheck=0
			End If%>
		<TR bgColor=<%=colorName%> onMouseOver="setPointer(this, <%=I%>, 'over', '<%=colorName%>', '#CCCCFF', '#FFCC99');" onMouseOut="setPointer(this, <%=I%>, 'out', '<%=colorName%>', '#CCCCFF', '#FFCC99');">
<%			If Not oRS2.BOF Then
				oRS2.MoveFirst
			End If
			strKey=""
			strParam=""
			
			If Not oRS2.EOF Then
				Do While Not oRS2.EOF
					If oRS2("Unique") Then
						strKey="Yes"
						Exit Do
					End If
					oRS2.MoveNext
				Loop
			End If
			
			If strKey="Yes" Then
				strKey="Yes"
				strAnd=""
				strParam=""
				While Not oRS2.EOF
					
					
					If oRS2("Unique") Then
						If Not oRS1.BOF Then
							oRS1.MoveFirst
						End If
						Do While Not oRS1.EOF
							If oRS1("Column_Name")=oRS2("Column_Name") Then
								If IsNull(oRS1("Scale")) Then
									strParam= strParam & strAnd & oRS2("Column_Name") & "='" & Replace(cStr(oRS(cStr(oRS2.Fields("Column_Name")))),"'","''") & "'"
								Else
									strParam= strParam & strAnd & oRS2("Column_Name") & "=" & oRS(cStr(oRS2("Column_Name")))
								End If
								strAnd=" And "
								Exit Do
							End If
							oRS1.MoveNext
						Loop
					End If
					
					oRS2.MoveNext
					
				Wend
			Else
				strKey="No"
				strParam=rowNo
			End If
			
			If Not oRS1.BOF Then
				oRS1.MoveFirst
			End If%>
			
			<TD><A href="tbl_data_edit.asp?dbName=<%=dbName%>&tName=<%=Request("tName")%>&strKey=<%=strKey%>&strParam=<%=Replace(strParam,"""","%22")%>">Edit</A></TD>
			<TD><A href="tbl_del.asp?dbName=<%=dbName%>&tName=<%=Request("tName")%>&strKey=<%=strKey%>&strParam=<%=Replace(strParam,"""", "%22")%>">Delete</A></TD>
		
<%		For I=0 To oRS.Fields.Count-1%>
			<TD>
<%			If oRS1("Type_Name")="image" Then%>
				<A href='tbl_img.asp?dbName=<%=dbName%>&tName=<%=Request("tName")%>&strKey=<%=strKey%>&strParam=<%=strParam%>&colName=<%=oRS.Fields(I).Name%>' Target='_blank'>Image</A>
<%			ElseIf oRS1("Type_Name")="binary" Or oRS1("Type_Name")="varbinary" Then%>
				&lt;Binary&gt;
<%			Else
				If Len(oRS.Fields(I))>100 Then%>
				<%=Left(oRS.Fields(I),80)%>....  <A href="tbl_browse_col.asp?dbName=<%=dbName%>&tName=<%=Request("tName")%>&colName=<%=oRS.Fields(I).Name%>&strKey=<%=strKey%>&strParam=<%=Replace(strParam, """","%22")%>" Target='_blank'>&lt;Show All&gt;</A>
<%				Else%>
					<%=oRS.Fields(I)%>
<%				End If				
			End If
%>			</TD>
<%			oRS1.MoveNext
		Next%>
		</TR>
<%		oRS.MoveNext
		oRS1.MoveFirst
		Records=Records+1
		I=I+1
		rowNo=rowNo+1
	Wend
%>
	</Table>

<%	If CurrPage=1 And PageCount>1 Then%>
	<A href='tbl_browse.asp?dbName=<%=dbName%>&tName=<%=Request("tName")%>&pgNo=<%=CurrPage+1%>'>Next</A>
	<Br />
<%	ElseIf CurrPage>1 And CurrPage<PageCount Then%>
	<A href='tbl_browse.asp?dbName=<%=dbName%>&tName=<%=Request("tName")%>&pgNo=<%=CurrPage-1%>'>Previous</A>&nbsp&nbsp
	&nbsp&nbsp<A href='tbl_browse.asp?dbName=<%=dbName%>&tName=<%=Request("tName")%>&pgNo=<%=CurrPage+1%>'>Next</A>
	<Br />
<%	ElseIf currPage=PageCount And PageCount>1 Then%>
	<A href='tbl_browse.asp?dbName=<%=dbName%>&tName=<%=Request("tName")%>&pgNo=<%=CurrPage-1%>'>Previous</A>
	<Br />
<%	End If

	If PageCount>1 Then
		For I=1 To PageCount
			If currPage=I Then
				Response.Write I
			Else%>
	<A href='tbl_browse.asp?dbName=<%=dbName%>&tName=<%=Request("tName")%>&pgNo=<%=I%>'> <%=I%> </A>&nbsp;&nbsp;
			<%End If
		Next 
	End If

	CloseRS oRS2
	Set oRS2=Nothing
	
	CloseRS oRS1
	Set oRS1=Nothing
	
	CloseRS oRS
	Set oRS=Nothing

	CloseDB oConn
	Set oConn=Nothing

%>
</BODY>
</HTML>
