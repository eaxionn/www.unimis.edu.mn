<%@ Language=VBScript %>
<!-- #include file="config.asp" -->
<!-- #include file="functions/function.asp" -->
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
<B>Server: <IMG src="images/server.gif" align="absbottom" ><A href='dbindex.asp'><%=sName %></A></B> 
<Br />
<Br /><Br />
	
	<Table Border=0 CellSpacing=1 CellPadding=1>
		<TR Height=20 bgColor=Orange>
<%
	Dim oConn
	Dim oRS
	Dim ColorCheck
	Dim ColorName
	
	On Error Resume Next
	
	Set oConn=CreateObject("ADODB.Connection")
	oConn.ConnectionString="Provider=SQLOLEDB;Data Source=" & sName & ";UID=" & UID & ";PWD=" & Passwd & ";"
	oConn.Open
	CheckErr
	
	Set oRS=Server.CreateObject("ADODB.Recordset")
	OpenRS oRS, oConn, "sp_server_info"
	CheckErr
	
	For I=0 To oRS.Fields.Count-1%>	
			<TH><%=UCase(oRS.Fields(I).Name)%></TH>
<%	Next%>
		</TR>
<%	ColorCheck=1
	While Not oRS.EOF
		If ColorCheck=1 Then
			ColorName="#EEEEEE"
			ColorCheck=0
		Else
			ColorName="#CCCCCC"
			ColorCheck=1
		End If%>
		<TR bgColor=<%=ColorName%>>
<%		For I=0 To oRS.Fields.Count-1%>
			<TD><%=oRS.Fields(I)%></TD>
<%		Next%>
		</TR>
<%		oRS.MoveNext
	Wend
	
	CloseRS oRS
	Set oRS=Nothing
	CloseDB oConn
	Set oConn=Nothing
%>
	</Table>
</BODY>
</HTML>
