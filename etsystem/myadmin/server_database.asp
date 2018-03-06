<%@ Language=VBScript %>
<!-- #include file='config.asp' -->
<!-- #include file="functions/function.asp" -->
<HTML>
<HEAD>
	<link href=style.css rel=stylesheet>
	<Title>ASPMyAdmin For SQL Server By Sukalyan Chakraborty</Title>
	<Meta Name=Description Content="SQL Server web frontend developed by Sukalyan Chakraborty for free use" />
	<Meta Name=Keywords Content="SQL Server web frontend inspired by PHPMyAdmin created by Sukalyan Chakraborty aimed to release more advanced versions in future" />
	
</HEAD>
<BODY bgcolor="#666699" style="color:white">

	<Br /><Br /><Br /><Br />
<Br />
	<B>Databases:</B>
<%
	
	Dim oConn
	Dim db
	
	Set oConn=CreateObject("SQLDMO.SQLServer")
	oConn.Connect sName, UID, passwd
	If err.number<>0 Then%>
	<Table Border=1 CellSpacing=0 CellPadding=0>
		<TR bgColor=orange>
			<TH>Error - <%=err.number%></TH>
		</TR>
		<TR>
			<TD Style='color:red'><%=err.Description%></TD>
		</TR>
	</Table>
<%	End If

	If dbName="" Then%>
	<UL>
<%		For Each db In oConn.Databases
			If Not db.systemobject Then%>
		<LI><A href='db_info.asp?dbName=<%=db.Name%>' Style='color:white' Target=LeftPane><%=db.Name%></a>
<%			End If
		Next%>
	</UL>
<%	Else
		Dim tName
		Dim vName
		Dim pName
		
		Set tName=CreateObject("SQLDMO.Table")
		Set vName=CreateObject("SQLDMO.View")
		Set pName=CreateObject("SQLDMO.StoredProcedure")%>
		
	<B>Tables:</B>
	
	<UL>
<%		For Each tName In oConn.Databases(dbName).Tables
			If Not tName.SystemObject Then%>
		<LI><A href='tbl_structure.asp?dbName=<%=dbName%>&tName=<%=tName.Name%>' Style='color:white' Target=LeftPane><%=tName.Name%></A>
<%			End If
		Next%>
	</UL>
	
	<B>Views</B>
	
	<UL>
<%		For Each vName In oConn.Databases(dbName).Views
			If Not vName.SystemObject Then%>
		<LI><A href='vw_show.asp?dbName=<%=dbName%>&vwName=<%=vName.Name%>' Style='color:white' Target=LeftPane><%=vName.Name%></A>
<%			End If
		Next%>
	</UL>
	
	<B>Procedures</B>
	
	<UL>
<%		For Each pName In oConn.Databases(dbName).StoredProcedures
			If Not pName.SystemObject Then%>
		<LI><A href='pr_show.asp?dbName=<%=dbName%>&prName=<%=pName.Name%>' Style='color:white' Target=LeftPane><%=pName.Name%>
<%			End If
		Next%>
	</UL>
<%	End If%>
</BODY>
</HTML>
