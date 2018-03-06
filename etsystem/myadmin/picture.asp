<%@ LANGUAGE="VBSCRIPT" %>
<!-- #include file="config.asp" -->
<!-- #include file="functions/function.asp" -->
<%
	If Request("dbName")<>"" Then
		dbName=Trim(cStr(Request("dbName")))
	End If
	
	Dim oConn
	Dim oRS
	Dim rowNo
	Dim colName
	
	rowNo=cInt(Request("rowNo"))
	colName=cStr(Request("colName"))
	
	Set oConn=Server.CreateObject("ADODB.Connection")
	OpenDB oConn
	
	CheckErr
	
	Set oRS=Server.CreateObject("ADODB.Recordset")
	
	Response.Expires = 0
	Response.Buffer = TRUE
	Response.Clear

	' Change the HTTP header to reflect that an image is being passed.
	Response.ContentType = "image/gif"
 
	If Request("strKey")="No" Then
		oConn.Execute "Declare abc Cursor dynamic for select * from " & Request("tName")
		oConn.Execute "open abc"
		oRS.Open "fetch relative " & Request("strParam") & " from abc", oConn
	Else
		OpenRS oRS, oConn, "select " & cStr(Request("colName")) & " from " & cStr(Request("tName")) & " where " & cStr(Request("strParam")) & ";"
	End If
	
	CheckErr
 
	Response.BinaryWrite oRS(colName)
	
	CloseRS oRS
	Set oRS=Nothing
	CloseDB oConn
	Set oConn=Nothing
	Response.End
%>
