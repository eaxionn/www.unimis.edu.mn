<%@ Language=VBScript %>
<!-- #include file="config.asp" -->
<!-- #include file="functions/function.asp" -->
<%
	If dbName<>"" Then
		Response.Redirect "db_info.asp"
		Response.End
	End If
%>
<HTML>
<HEAD>
	<Link href=style.css rel=stylesheet>
	<Title>ASPMyAdmin For SQL Server By Sukalyan Chakraborty</Title>
	<Meta Name=Description Content="SQL Server web frontend developed by Sukalyan Chakraborty for free use" />
	<Meta Name=Keywords Content="SQL Server web frontend inspired by PHPMyAdmin created by Sukalyan Chakraborty aimed to release more advanced versions in future" />
	<Script src="functions/setPointer.js" Type="text/javascript" Language="javascript">
	</Script>
</HEAD>
<BODY>
<Br />
<Br /><Br />
<B>Server: <IMG src="images/server.gif" align="absbottom" ><A href='dbindex.asp'><%=sName %></A> 
&gt;&gt; Databases</B><Br />
<Br />
	<H4>Databases</H4>
	<FORM Action=db_drop.asp Method=Post>
	<TABLE Border=0 CellPadding=1 CellSpacing=1>
		<TR bgColor=orange>
			<TH></TH>
			<TH Width=150>Databases</TH>
			<TH Width=50></TH>
			<TH Width=50></TH>
			<TH Width=50></TH>
		</TR>
<%
	Dim oConn
	Dim db
	Dim colorCheck
	Dim colorName
	Dim I
	
	On Error Resume Next
	
	Set oConn=CreateObject("SQLDMO.SQLServer")
	oConn.Connect sName, UID, passwd
	
	CheckErr
	
	colorCheck=0
	I=0
	For Each db In oConn.Databases
		If Not db.SystemObject Then
			If colorCheck=0 Then
				colorName="#EEEEEE"
				colorCheck=1
			Else
				colorName="#CCCCCC"
				colorCheck=0
			End If%>
		<TR bgcolor=<%=colorName%> onmouseover="setPointer(this, <%=I%>, 'over', '<%=colorName%>', '#CCCCFF', '#FFCC99');" onmouseout="setPointer(this, <%=I%>, 'out', '<%=colorName%>', '#CCCCFF', '#FFCC99');">
			<TD>
				<Input Type=CheckBox Name=dbName Value=<%=db.Name%>>
			</TD>
			<TD><A href='db_info.asp?dbName=<%=db.Name%>'><%=db.Name%></A></TD>
			<TD Align=center><A href='db_table.asp?dbName=<%=db.Name%>'>Table</A></TD>
			<TD Align=center><A href='db_view.asp?dbName=<%=db.Name%>'>View</A></TD>
			<TD Align=center><A href='db_procedure.asp?dbName=<%=db.Name%>'>Procedure</A></TD>
		</TR>
<%			I=I+1
		End If
	Next
	
	oConn.Close
	Set oConn=Nothing
%>
	</TABLE>
	<Br /><Br />
	<B>Drop selected databases</B>
	<Br /><Br />
		<Input Type=Submit Name=action Value='Drop' Style="WIDTH: 100px; color:red; font-weight:bold">
	</FORM>
	<Form Action=server_create_db.asp Method=Post>
		<Label for=dbName>Create Database</Label><Br />
		<Input Type=Text Name=dbName ID=dbName />
		<Input Type=Submit Name=action Value=Create Style='width:75px; color:green; font-weight:bold'>
	</Form>
</BODY>
</HTML>
