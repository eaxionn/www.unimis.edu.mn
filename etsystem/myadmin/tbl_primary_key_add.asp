<%@ Language=VBScript %>
<!-- #include file="config.asp" -->
<!-- #include file="functions/function.asp" -->
<%
	On Error Resume Next
	
	If Request("dbName")<>"" Then
		dbName=Trim(cStr(Request("dbName")))
	End If
	
	Dim oConn
	Set oConn=Server.CreateObject("ADODB.Connection")
	OpenDB oConn
	
	CheckErr
	
	oConn.Execute "Alter Table " & cStr(Request("tName")) & " Add Primary Key(" & cStr(Request("fldName")) & ");"
	
	CheckErr
	
	CloseDB oConn
	Set oConn=Nothing
	
	Response.Redirect "tbl_structure.asp?dbName=" & dbName & "&tName=" & Request("tName")
	Response.End
%>