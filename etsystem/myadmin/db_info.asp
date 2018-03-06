<%@ Language=VBScript %>
<!-- #include file="config.asp" -->
<!-- #include file="functions/function.asp" -->
<%
	If Request("dbName")<>"" Then
		dbName=Trim(cStr(request("dbName")))
	End If
	
	On Error Resume Next
	
%>

<HTML>
<HEAD>
	<Link href=style.css rel=stylesheet>
	<Title>ASPMyAdmin Fo SQL Server By Sukalyan Chakraborty</Title>
	<Meta Name=Description Content="SQL Server web frontend developed by Sukalyan Chakraborty for free use" />
	<Meta Name=Keywords Content="SQL Server web frontend inspired by PHPMyAdmin created by Sukalyan Chakraborty aimed to release more advanced versions in future" />
	
</HEAD>
<BODY>
<Br />
<Br /><Br />
<B>Server: <IMG src="images/server.gif" align="absbottom" ><A href='dbindex.asp'><%=sName %></A> 
&gt;&gt; <A href='server_databases.asp'>Database</A> &gt;&gt; <%=dbName %> &gt;&gt; 
Info</B><Br />
<Br />
	<Table Border=1 CellSpacing=0 CellPadding=0 Width=100%>
		<TR bgColor=#666699 Style='color:white'>
			<TH bgColor=white style='color:black'>Informations</TH>
			<TH><A href='db_table.asp?dbName=<%=dbName%>' Style='color:white'>Table</A></TH>
			<TH><A href='db_view.asp?dbName=<%=dbName%>' Style='color:white'>View</A></TH>
			<TH><A href='db_procedure.asp?dbName=<%=dbName%>' Style='color:white'>Procedure</A></TH>
			<TH><A href='db_sql.asp?dbName=<%=dbName%>' Style='color:white'>SQL</A></TH>
			<TH bgcolor=red><A href='db_drop.asp?dbName=<%=dbName%>' Style='color:white'>Drop</A></TH>
		</TR>
	</Table>
	<Br /><Br /><Br />
	<Table Border=0 CellSpacing=5 CellPadding=5>
		<TR bgColor=#666699 Style='color:white'>
			<TH>User</TH>
			<TH>Roles</TH>
			<TH>Rules</TH>
		</TR>
		<TR bgColor=#EEEEFF>
			<TD vAlign=Top>
				<Table Border=0 CellSpacing=1 CellPadding=1>
					<TR bgColor=orange>
						<TH>Name</TH>
						<TH>Login Name</TH>
						<TH>Database Access</TH>
					</TR>
	<%
		Dim oConn
		Dim oUser
		Dim oRole
		Dim colorCheck
		Dim ColorName
		
		Set oConn=CreateObject("SQLDMO.SQLServer")
		oConn.Connect sName, UID, passwd
		
		CheckErr
		
		Set oUser=CreateObject("SQLDMO.User")
		
		colorCheck=0
		ColorName=""
		
		For Each oUser in oConn.Databases(dbName).Users
			If colorCheck=0 Then
				ColorName="#EEEEEE"
				colorCheck=1
			Else
				ColorName="#CCCCCC"
				colorCheck=0
			End If%>
					<TR bgColor=<%=ColorName%>>
						<TD><%=oUser.Name%></TD>
						<TD><%=oUser.Login%></TD>
						<TD><%=oUser.HasDBAccess%></TD>
					</TR>
<%		Next
		
		Set oUser=Nothing%>
				</Table>
			</TD>
			<TD vAlign=Top>
				<Table Border=0 CellSpacing=1 CellPadding=1>
					<TR bgColor=orange>
						<TH>Name</TH>
					</TR>
<%		Set oRole=CreateObject("SQLDMO.DatabaseRole")
		
		For Each oRole in oConn.Databases(dbName).DatabaseRoles
			If colorCheck=0 Then
				ColorName="#EEEEEE"
				colorCheck=1
			Else
				ColorName="#CCCCCC"
				colorCheck=0
			End If%>
					<TR bgColor=<%=ColorName%>>
						<TD><%=oRole.Name%></TD>
					</TR>
<%		Next
		
		Set oRole=Nothing%>
				</Table>
			</TD>
			<TD vAlign=Top>
				<Table Border=0 CellSpacing=1 CellPadding=1>
					<TR bgColor=orange>
						<TH>Name</TH>
						<TH>Owner</TH>
						<TH>Create Date</TH>
					</TR>
<%
		Dim oRule
		
		Set oRule=CreateObject("SQLDMO.Rule")
		
		colorCheck=0
		
		For Each oRule in oConn.Databases(dbName).Rules
			If colorCheck=0 Then
				ColorName="#EEEEEE"
				colorCheck=1
			Else
				ColorName="#CCCCCC"
				colorCheck=0
			End If%>
					<TR bgColor=<%=ColorName%>>
						<TD><%=oRule.Name%></TD>
						<TD><%=oRule.Owner%></TD>
						<TD><%=oRule.CreateDate%></TD>
					</TR>
<%		Next
		
		Set oRule=Nothing
%>
				</Table>
			</TD>
		</TR>
	</Table>
	<br />
	<Table Border=0 CellSpacing=5 CellPadding=5>
		<TR bgColor=#666699 Style='color:white'>
			<TH>Defaults</TH>
			<TH>User Defined Functions</TH>
		</TR>
		<TR bgColor=#EEEEFF>
			<TD vAlign=Top>
				<Table Border=0 CellSpacing=1 CellPadding=1>
					<TR bgColor=orange>
						<TH>Name</TH>
						<TH>Owner</TH>
						<TH>Create Date</TH>
					</TR>
<%
		Dim oDefult
		
		Set oDefault=CreateObject("SQLDMO.Default")
		
		colorCheck=0
		For Each oDefault in oConn.Databases(dbName).Defaults
			If colorCheck=0 Then
				ColorName="#EEEEEE"
				colorCheck=1
			Else
				ColorName="#CCCCCC"
				colorCheck=0
			End If%>
					<TR bgColor=<%=ColorName%>>
						<TD><%=odefault.Name%></TD>
						<TD><%=oDefault.Owner%></TD>
						<TD><%=oDefault.CreateDate%></TD>
					</TR>
<%		Next
		
		Set oDefault=Nothing
%>
				</Table>
			</TD>
			<TD vAlign=Top>
				<Table Border=0 CellSpacing=1 CellPadding=1>
					<TR bgColor=orange>
						<TH>Name</TH>
						<TH>Owner</TH>
						<TH>Create Date</TH>
					</TR>
<%
		Dim oFunction
		
		Set oFunction=CreateObject("SQLDMO.UserDefinedFunction")
		
		For Each oFunction in oConn.Databases(cStr(Request("dbName"))).UserDefinedFunctions
			If colorCheck=0 Then
				ColorName="#EEEEEE"
				colorCheck=1
			Else
				ColorName="#CCCCCC"
				colorCheck=0
			End If%>
					<TR bgColor=<%=ColorName%>>
						<TD><%=oFunction.Name%></TD>
						<TD><%=oFunction.Owner%></TD>
						<TD><%=oFunction.CreateDate%></TD>
					</TR>
<%		Next
		
		Set oFunction=Nothing
%>
				</Table>
			</TD>
		</TR>
	</Table>
	<Table Border=0 CellSpacing=5 CellPadding=5>
		<TR bgColor=#666699 Style='color=white'>
			<TH>User Defined Data types</TH>
		</TR>
		<TR bgcolor=#EEEEFF>
			<TD>
				<Table Border=0 CellSpacing=1 CellPadding=1>
					<TR bgColor=orange>
						<TH>Name</TH>
							<TH>Owner</TH>
							<TH>Base Type</TH>
							<TH>Length</TH>
							<TH>Allow Null</TH>
							<TH>Default</TH>
							<TH>Rule</TH>
						</TR>
	<%
		colorCheck=0
		
		Dim oDtType
		
		Set oDtType=CreateObject("SQLDMO.UserDefinedDataType")
		
		For Each oDtType in oConn.Databases(dbName).UserDefinedDatatypes
			If colorCheck=0 Then
				ColorName="#EEEEEE"
				colorCheck=1
			Else
				ColorName="#CCCCCC"
				colorCheck=0
			End If%>
						<TR bgColor=<%=ColorName%>>
							<TD><%=oDtType.Name%></TD>
							<TD><%=oDtType.Owner%></TD>
							<TD><%=oDtType.BaseType%></TD>
							<TD><%=oDtType.Length%></TD>
							<TD><%=oDtType.AllowNulls%></TD>
							<TD><%=oDtType.Default%></TD>
							<TD><%=oDtType.Rule%></TD>
						</TR>
<%		Next
		
		Set oDtType=Nothing
		
%>
				</Table>
			</TD>
		</TR>
	</Table>
</BODY>
</HTML>
