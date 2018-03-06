<%@ Language=VBScript %>
<!-- #include file="functions/function.asp" -->
<!-- #include file="config.asp" -->
<%
	If Request("dbName")<>"" Then
		dbName=Trim(cStr(Request("dbName")))
	End IF
	
	On Error Resume Next
	
	Dim oConn	
	
	Set oConn=CreateObject("SQLDMO.SQLServer")
	oConn.Connect sName, UID, Passwd
	
	CheckErr
	
	If Request("idxType")<>"Primary Key" And Request("idxType")<>"FKey" Then
		
		oConn.Databases(dbName).Tables(cStr(Request("tName"))).Indexes(cStr(Request("idxName"))).Remove
		CheckErr
	Else
		oConn.Databases(dbName).Tables(cStr(Request("tName"))).BeginAlter
		oConn.Databases(dbName).Tables(cStr(Request("tName"))).Keys(cStr(Request("idxName"))).Remove
		oConn.Databases(dbName).Tables(cStr(Request("tName"))).DoAlter
		CheckErr
	End If
	
	
	oConn.Close
	Set oConn=Nothing
	
	Response.Redirect "tbl_structure.asp?dbName=" & Request("dbName") & "&tName=" & Request("tName")
	Response.End
%>