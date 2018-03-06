<%@ Language=VBScript %>
<!-- #include file="config.asp" -->
<!-- #include file="functions/function.asp" -->
<%

	If sName="" Or UID="" Then
		Response.Redirect "install.asp"
		Response.End
	End If
	
	Dim oConn
	
	On Error Resume Next	
	
	Set oConn=CreateObject("SQLDMO.SQLServer")
	oConn.connect sName, UID, passwd
	
	If Err.number<>0 Then
		Response.Write "<HTML><Head><Link href=style.css rel=stylesheet /><Title>ASPMyAdmin For SQL Server By Sukalyan Chakraborty</Title></Head><Body>"
		Response.Write "<Table Border=1 CellSpacing=1 CellPadding=1><TR><TD>" & vbCrlf
		Response.Write "<Table Border=0 CellSpacing=0 CellPadding=0 Width=300><TR bgColor=orange Height=20>" & vbCrlf
		Response.Write "<TH>Error</TH></TR><TR Height=100><TD Style='Color:Red'>Either the SQL Server is stopped or the server name and user id is wrong in config.asp.<Br /><Br />" & vbCrlf
		Response.Write "You can change the server name, user id and password manually in the config.asp file or run the install.asp file.</TD></TR>" & vbCrlf
		Response.Write "<TR bgColor=Green Height=20><TD Align=Center><A href='install.asp' Style='Color:White'>Install ASPMyadmin</A></TD></TR></Table>" & vbCrlf
		Response.Write "</TD></TR></Table></Body></HTML>"
	End If
	
	oConn.Close
	Set oConn=Nothing
%>
<HTML>
<HEAD>
	<Link href=style.css rel=stylesheet>
	<Title>ASPMyAdmin For SQL Server By Sukalyan Chakraborty</Title>
	<Meta Name=Description Content="SQL Server web frontend developed by Sukalyan Chakraborty for free use" />
	<Meta Name=Keywords Content="SQL Server web frontend inspired by PHPMyAdmin created by Sukalyan Chakraborty aimed to release more advanced versions in future" />
	
</HEAD>
	<Frameset cols="180,*" border=0>
		<Frame name=dbList target=main src="server_database.asp">
<% 	If dbName="" Then %>
		<Frame name=LeftPane src='dbindex.asp'>
<%	Else %>
		<Frame name=LeftPane src='db_info.asp'>
<%	End If %>

	</Frameset>

</HTML>
