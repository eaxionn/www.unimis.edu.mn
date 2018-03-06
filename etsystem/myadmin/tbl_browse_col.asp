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
	<Link href=style.css rel=stylesheet />
	<Title>ASPMyAdmin For SQL Server By Sukalyan Chakraborty</Title>
	<Meta Name=Description Content="SQL Server web frontend developed by Sukalyan Chakraborty for free use" />
	<Meta Name=Keywords Content="SQL Server web frontend inspired by PHPMyAdmin created by Sukalyan Chakraborty aimed to release more advanced versions in future" />
	
</HEAD>
<BODY>
<Br />
<Br /><Br />
<%
	Dim oConn
	Dim oRS
		
	Set oConn=Server.CreateObject("ADODB.Connection")
	OpenDB oConn
	
	CheckErr
	
	Set oRS=Server.CreateObject("ADODB.Recordset")
	
	If Request("strKey")="Yes" Then
		OpenRS oRS, oConn, "select " & Request("colName") & " from " & Request("tName") & " where " & Request("strParam")
	Else
		oConn.Execute "Declare abc Cursor Dynamic for select " & cStr(Request("colName")) & " from " & cStr(Request("tName")) & " Open abc"
		OpenRS oRS, oConn, "Fetch Relative " & cStr(Request("strParam")) & " from abc"
	End If
	
	CheckErr
	
	Response.Write oRS(cStr(Request("colName")))
	
	CloseRS oRS
	Set oRS=Nothing
	
	CloseDB oConn
	Set oConn=Nothing
%>	
</BODY>
</HTML>
