<%@ Language=VBScript %>
<!-- #include file="functions/function.asp" -->
<!-- #include file="config.asp" -->
<%
	Dim oConn
	
	If Request("dbName")="" Then
		Response.Write "<Table Border=0 CellSpacing=0 CellPadding=0><TR bgColor=Orange Height=20><TH>Error</TH></TR>" & vbCrlf
		Response.Write "<TR bgColor=#EEEEEE Height=100><TD Align=Center Style='Color:Red'>No Database name supplied.</TD></TR>" & vbCrlf
		Response.Write "</Table>" & vbCrlf
		Response.End
	Else
		Set oConn=CreateObject("SQLDMO.SQLServer")
		oConn.Connect sName, UID, Passwd
	
		CheckErr
		
		oConn.ExecuteImmediate "Create Database " & Trim(cStr(Request("dbName")))
		
		CheckErr
		
		oConn.Close
		Set oConn=Nothing
		
		Response.Redirect "db_info.asp?dbName=" & Trim(cStr(Request("dbName")))
		Response.End
	End If	
%>
