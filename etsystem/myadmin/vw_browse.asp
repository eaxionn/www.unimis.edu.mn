<%@ Language=VBScript %>
<!-- #include file="functions/function.asp" -->
<!-- #include file="config.asp" -->
<%
	IF Trim(cStr(Request("dbName")))<>"" Then
		dbName=Trim(cStr(Request("dbName")))
	End If
	
	On Error Resume Next
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
&gt;&gt; <A href='server_databases.asp'>Database</A> &gt;&gt; <%=dbName %> &gt;&gt; 
Stored Procedures &gt;&gt Show</B><Br />
<Br />
	<Table Border=1 CellSpacing=0 cellPadding=0 Width=100%>
		<TR bgColor=#666699 Style='color:white'>
			<TH><A href='db_info.asp?dbName=<%=dbName %>' Style='color:white'>Informations</A></TH>
			<TH><A href='db_table.asp?dbName=<%=dbName %>' Style='color:white'>Table</A></TH>
			<TH><A href='db_view.asp?dbName=<%=dbName %>' Style='color:white'>View</A></TH>
			<TH><A href='db_Procedure.asp?dbName=<%=dbName%>' Style='color:white'>Procedure</A></TH>
			<TH><A href='db_sql.asp?dbName=<%=dbName%>' Style='color:white'>SQL</A></TH>
			<TH bgcolor=red><A href='db_drop.asp?dbName=<%=dbName%>' Style='color:white'>Drop</A></TH>
		</TR>
	</Table>
	<Br />
<%
		Dim oConn
		Dim oRS
		Dim CurrPage
		Dim colorCheck
		Dim colorName
		Dim rowCount
		Dim I
		
		Set oConn=Server.CreateObject("ADODB.Connection")
		OpenDB oConn
		CheckErr
		
		Set oRS=Server.CreateObject("ADODB.Recordset")
		oRS.CursorLocation=3
		OpenRS oRS, oConn, Trim(cStr(Request("vwName")))
		
		CheckErr
		
		oRS.PageSize=25
		
		If Request("pgNo")<>"" Then
			CurrPage=cInt(Trim(Request("pgNo")))
		Else
			CurrPage=1
		End If
		
		oRS.AbsolutePage=CurrPage %>
		Total <%=oRS.RecordCount%> Records
		<Br /><Br />
		Page <%=CurrPage%> of <%=oRS.PageCount%> pages<BR /><Br />
<%		IF CurrPage=1 And oRS.PageCount>1 Then%>
		<A href='vw_browse.asp?dbName=<%=dbName%>&vwName=<%=Request("vwName")%>&pgNo=<%=CurrPage+1%>'>Next</A>
<%		ElseIf CurrPage>1 And CurrPage < oRS.PageCount Then%>
		<A hRef='vw_browse.asp?dbName=<%=dbName%>&vwName=<%=Request("vwName")%>&pgNo=<%=CurrPage-1%>'>Previous</A>
		<A href='vw_browse.asp?dbName=<%=dbName%>&vwName=<%=Request("vwName")%>&pgNo=<%=CurrPage+1%>'>Next</A>
<%		ElseIF CurrPage > 1 And CurrPage=oRS.PageCount Then %>
		<A href='vw_browse.asp?dbName=<%=dbName%>&vwName=<%=Request("vwName")%>&pgNo=<%=CurrPage-1%>'>Previous</A>
<%		End If %>
		<Br />
<%		If oRS.PageCount>1 Then
			For I=1 To oRS.PageCount
				If CurrPage<>I Then%>
		<A Href='vw_browse.asp?dbName=<%=dbName%>&vwName=<%=Request("vwName")%>&pgNo=<%=I%>'><%=I%></A>
<%				Else%>
		<%=I%>
<%				End If
			Next
		End If%>
		<Br /><Br /><Br />
		<Table Border=0 CellSpacing=1 CellPadding=1>
		<TR bgColor=#666699>
			<TH ColSpan=<%=oRS.Fields.Count%> Style='color:white'><%=Request("vwName")%></TH>
		</TR>
		<TR bgColor=Orange>			
<%		For I=0 To oRS.Fields.Count-1%>
			<TH><%=oRS.Fields(I).Name%></TH>
<%		Next%>
		</TR>
<%		
		colorCheck=0
		rowCount=1
		While rowCount<=25 And Not oRS.EOF
			If colorCheck=0 Then
				colorName="#EEEEEE"
				colorCheck=1
			Else
				colorName="#CCCCCC"
				colorCheck=0
			End If
%>
		<TR bgColor=<%=colorName%>>
<%			For I=0 To oRS.Fields.Count-1%>
			<TD><% If Len(oRS.Fields(I))>100 Then%>
				<%=Left(oRS.Fields(I), 80) & "..."%>
				<%Else%>
				<%=Server.HTMLEncode(oRS.Fields(I))%>&nbsp;
			<%End If%>
			</TD>
<%			Next%>
		</TR>
<%			rowCount=rowCount+1
			oRS.MoveNext
		Wend
		CloseRS oRS
		Set oRS=Nothing
		CloseDB oConn
		Set oConn=Nothing
%>
	</Table>
</BODY>
</HTML>
