<%@ Language=VBScript %>

<!-- #include file="config.asp" -->
<!-- #include file="functions/function.asp" -->

<%
	If Request("dbName")<>"" Then
		dbName=cStr(Request("dbName"))
	End If

	On Error Resume Next
%>
<HTML>
<HEAD>
	<Link href=style.css rel=stylesheet>
	<Title>ASPMyAdmin For SQL Server By Sukalyan Chakraborty</Title>
	<Meta Name=Description Content="SQL Server web frontend developed by Sukalyan Chakraborty for free use" />
	<Meta Name=Keywords Content="SQL Server web frontend inspired by PHPMyAdmin created by Sukalyan Chakraborty aimed to release more advanced versions in future" />
	
</HEAD>
<BODY>
<Br />
<Br /><Br />
<B>Server: <IMG src="images/server.gif" align="absbottom" ><A href='dbindex.asp'><%=sName %></A> 
&gt;&gt; <A href='server_databases.asp'>Database</A> &gt;&gt; <%=dbName %> &gt;&gt; 
Query Analyzer</B><Br />
<Br />
	<Table border=1 cellspacing=0 cellpadding=0 width=100%>
		<TR bgcolor=#666699 style='color:white'>
			<TH><A href='db_info.asp?dbName=<%=dbName %>' Style='color:white'>Informations</A></TH>
			<TH><A href='db_table.asp?dbName=<%=dbName %>' Style='color:white'>Table</A></TH>
			<TH><A href='db_view.asp?dbName=<%=dbName%>' Style='color:white'>View</A></TH>
			<TH><A href='db_procedure.asp?dbName=<%=dbName %>' Style='color:white'>Procedure</A></TH>
			<TH bgColor=white Style='color:black'>SQL</TH>
			<TH bgcolor=red><A href='db_drop.asp?dbName=<%=dbName%>' Style='color:white'>Drop</A></TH>
		</TR>
	</Table>
	<Br /><Br /><Br />
	
	<Table border=0 CellPadding=0 CellSpacing=0>
		<TR>
			<TD vAlign=Top>
<%
	If Trim(cStr(Request("sqlText")))<>"" Then
%>	
				<Table Border=0 CellSpacing=0 CellPadding=0 width=300>
					<TR bgColor=#666699 Height=20>
						<TH Style='color:white'>SQL - Syntax</TH>
					</TR>
					<TR bgColor=#EEEEEE Height=100>
						<TD><%=Trim(cStr(Request("sqlText")))%></TD>
					</TR>
				</Table>
<%
		Dim oConn
		Dim oRS
		
		Set oConn=Server.CreateObject("ADODB.Connection")
		OpenDB(oConn)
		CheckErr
		
		Set oRS=Server.CreateObject("ADODB.Recordset")
		oRS.CursorLocation=3
		OpenRS oRS, oConn, Trim(cStr(Request("sqlText")))
		If err.number<>0 Then%>

				<Br />
				<Table Border=0 CellSpacing=0 CellPadding=0 Width=300>
					<TR bgColor=Orange Height=20>
						<TH>Error - <%=err.number%></TH>
					</TR>
					<TR bgColor=#EEEEEE Height=60>
						<TD Style='color:red; font-weight:bold'><%=err.Description%></TD>
					</TR>
				</Table>
				<Br />
<%			HasError=1
		Else%>
				<Br />
				<%
					Dim RecNo
					
					If oRS.State<>1 Then
						RecNo=0
					Else
						RecNo=oRS.RecordCount
					End If
				%>
				<Table Border=0 CellSpacing=0 CellPadding=0 Width=300>
					<TR bgColor=Orange Height=20>
						<TH>The Command(s) completed successfully</TH>
					</TR>
					<TR bgColor=#EEEEEE Height=60>
						<TD Align=Center Style='color:green; font-weight:bold'>Command(s) return <%=RecNo%> rows</TD>
					</TR>
				</Table>
<%			HasError=0
		End IF%>
			</TD>
			<TD Width=10>&nbsp; &nbsp; &nbsp;
<%	End If%>
			</TD>
			<TD vAlign=Top>
				<Form Action="" Method=Post>
				<Table Border=0 CellSpacing=0 CellPadding=0 Width=460>
					<TR bgColor=Orange Height=20>
						<TH ColSpan=3>Enter Your SQL Query Here</TH>
					</TR>
					<TR bgColor=#666699>
						<TD ColSpan=3>&nbsp;</TD>
					</TR>
					<TR bgColor=#666699>
						<TD>&nbsp;</TD>
						<TD>
							<Textarea Name=sqlText rows=10 cols=50><%=Trim(cStr(Request("sqlText")))%></Textarea>
						</TD>
						<TD vAlign=Bottom Align=Right Width=50>
							<Input Type=Hidden Name=dbName Value=<%=dbName%> >
							<Input Type=Submit Name=action Value=Go>
						</TD>
					</TR>
					<TR bgColor=#666699>
						<TD ColSpan=3>&nbsp;</TD>
					</TR>
				</Table>
				</Form>
			</TD>
		</TR>
	</Table>
	<HR Size=1 />
<% 	
	If Trim(cStr(Request("sqlText")))<>"" Then
		If HasError=0 Then
			If oRS.State=1 Then%>
				
	<Table border=0 CellSpacing=1 CellPadding=1>
		<TR bgColor=orange>
<%				For I=0 To oRS.Fields.Count-1%>
			<TH><%=oRS.Fields(I).Name%></TH>
<%				Next%>
		</TR>
<%				ColorCheck=0
				ColorName=""
		
				While Not oRS.EOF
					If ColorCheck=0 Then
						ColorName="#EEEEEE"
						ColorCheck=1
					ElseIf ColorCheck=1 Then
						ColorName="#CCCCCC"
						ColorCheck=0
					End If%>
		<TR bgColor=<%=ColorName%>>
<%					For I=0 to oRS.Fields.Count-1%>
			<TD><%		If Not IsNull(oRS.Fields(I)) Then
							If Len(cStr(oRS.Fields(I)))>100 Then
								Response.Write Left(oRS.Fields(I), 80) & "..." 
							Else
								Response.Write Server.HTMLEncode(oRS.Fields(I))
							End If
						End If%>&nbsp;</TD>
<%					Next%>
		</TR>
<%					oRS.MoveNext
				Wend%>
	</Table>
<%			End If
		End If
		CloseRS oRS
		CloseDB oConn
	End If%>
	
		
</BODY>
</HTML>
