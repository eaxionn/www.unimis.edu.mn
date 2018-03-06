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
	<Title>ASPMyAdmin For SQL Server By Sukalyan Chakraborty</Title>
	<Meta Name=Description Content="SQL Server web frontend developed by Sukalyan Chakraborty for free use" />
	<Meta Name=Keywords Content="SQL Server web frontend inspired by PHPMyAdmin created by Sukalyan Chakraborty aimed to release more advanced versions in future" />
	
	<script src="functions/setPointer.js" type="text/javascript" language="javascript">
	</script>
</HEAD>
<BODY>
<Br />
<Br /><Br />
<B>Server: <IMG src="images/server.gif" align="absbottom" ><A href='dbindex.asp'><%=sName%></A> 
&gt;&gt; <A href='server_databases.asp'>Database</A> &gt;&gt; <%=dbName %> &gt;&gt; 
Table</B><Br />
<Br />
	
	<Table Border=1 CellSpacing=0 CellPadding=0 Width=100%>
		<TR bgColor=#666699 Style='color:white'>
			<TH><A href='db_info.asp?dbName=<%=dbName%>' Style='color:white'>Informations</A></TH>
			<TH bgColor=white Style='color:black'>Table</TH>
			<TH><A href='db_view.asp?dbName=<%=dbName%>' Style='color:white'>View</A></TH>
			<TH><A href='db_procedure.asp?dbName=<%=dbName%>' Style='color:white'>Procedure</A></TH>
			<TH><A href='db_sql.asp?dbName=<%=dbName%>' Style='color:white'>SQL</A></TH>
			<TH bgColor=red><A href='db_drop.asp?dbName=<%=dbName%>' Style='color:white'>Drop</A></TH>
		</TR>
	</Table>
	<Br /><Br /><Br />
	<Table Border=0 CellPadding=1 CellSpacing=1 Width=100%>
		<TR bgColor=Orange>
			<TH>Table</TH>
			<TH ColSpan=5>Action</TH>
			<TH>Records</TH>
			<TH>Owner</TH>
			<TH>Date Created</TH>
		</TR>
<%	Dim oConn
	Dim oTable
	Dim colorCheck
	Dim TableNo
	Dim RecNo
	
	Set oConn=CreateObject("SQLDMO.SQLServer")
	oConn.Connect sName, UID, passwd
	
	CheckErr
	
	Set oTable=CreateObject("SQLDMO.Table")
	
	colorCheck=0
	TableNo=0
	RecNo=0
	Dim I
	Dim colorName
	I=0
	For Each oTable In oConn.Databases(dbName).Tables
		If Not oTable.SystemObject Then
			If colorCheck=0 Then
				colorName="#EEEEEE"
				colorCheck=1
			Else
				colorName="#CCCCCC"
				colorCheck=0
			End If%>
		<TR bgcolor=<%=colorName%> onmouseover="setPointer(this, <%=I%>, 'over', '<%=colorName%>', '#CCCCFF', '#FFCC99');" onmouseout="setPointer(this, <%=I%>, 'out', '<%=colorName%>', '#CCCCFF', '#FFCC99');">
			<TD><%=oTable.Name%></TD>
			<TD><A href='tbl_browse.asp?dbName=<%=dbName%>&tName=<%=oTable.Name%>'>Browse</A></TD>
			<TD><A href='tbl_data_insert.asp?dbName=<%=dbName%>&tName=<%=oTable.Name%>'>Insert</A></TD>
			<TD><A href='tbl_structure.asp?dbName=<%=dbName%>&tName=<%=oTable.Name%>'>Structure</A></TD>
			<TD><A href='tbl_empty.asp?dbName=<%=dbName%>&tName=<%=oTable.Name%>'>Empty</A></TD>
			<TD><A href='tbl_drop.asp?dbName=<%=dbName%>&tName=<%=oTable.Name%>'>Delete</A></TD>
			<TD Align=Right><%=oTable.Rows%></TD>
			<TD><%=oTable.Owner%></TD>
			<TD><%=oTable.CreateDate%></TD>
		</TR>
<%			TableNo=TableNo+1
			RecNo=RecNo+cInt(oTable.Rows)
			I=I+1
		End If
	Next%>
		<TR bgColor=Orange>
			<TH><%=TableNo%> Tables</TH>
			<TH ColSpan=5></TH>
			<TH Align=Right><%=RecNo%></TH>
			<TH></TH>
			<TH></TH>
		</TR>
<%	
	set oTable=Nothing
	oConn.Close
	Set oConn=Nothing
	
%>
	</Table>
	<HR Size=1 />
	<Form Action=tbl_create.asp Method=post>
	<Table Border=0 width=30% CellSpacing=0 CellPadding=0>
		<TR bgcolor=#666699 style='color:white' height=30>
			<TH colspan=3>Create new table on database <%=dbName%></TH>
		</TR>
		<TR bgcolor=#EEEEEE height=30>
			<TD>Table Name: </TD>
			<TD>
				<Input Type=hidden Name=dbName Value=<%=dbName%> />
				<Input Type=text Name=tName />
			</TD>
			<TD></TD>
		</TR>
		<TR bgcolor=#EEEEEE height=30>
			<TD>Total Fields : </TD>
			<TD>
				<Input Type=text Name=fldNo Size=6 />
			</TD>
			<TD align=right>
				<Input Type=Submit Name=action Value=Go />
			</TD>
		</TR>
	</Table>
	</Form>
	<Br />
	<HR Size=1 />

</BODY>
</HTML>
