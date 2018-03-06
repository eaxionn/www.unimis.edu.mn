<%@ Language=VBScript %>
<!-- #include file="config.asp" -->

<%

	If dbName<>"" Then
		Response.Redirect "db_info.asp"
	End If
	
	If Request("dbName")<>"" Then
		dbName=Trim(cStr(Request("dbName")))
	End If
%>


<HTML>
<HEAD>
	<Link href=style.css rel=stylesheet>
	<Title>Электрон тестийн систем - Удирдагчийн хэсэг</Title>
	<Meta Name=Description Content="SQL Server web frontend developed by Sukalyan Chakraborty for free use" />
	<Meta Name=Keywords Content="SQL Server web frontend inspired by PHPMyAdmin created by Sukalyan Chakraborty aimed to release more advanced versions in future" />
	
</HEAD>
<BODY>
<Br />
<Br />
	
<H3>Электрон тестийн систем - Удирдагчийн хэсэг</H3>
	<Font Size='2pt'><B>SQL Server is running on <%=sName%> as <%=UID%>@<%=sName%></B></Font>
	<Br /><Br /><Br /><Br />
	<Table Border=0 Width=100%>	
		<TR>
			<TH bgColor=#666699 ColSpan=2 Style="color:white" Sidth=30%>SQL server</TH>
			<TH Width=5%></TH>
			<TH bgColor=#666699 Style="color:white" Width=20%>Databases</TH>
			<TH Width=45%></TH>
		</TR>
		<TR>
			<Form Action=server_create_db.asp Method=Post>
			<TD>
				<Label For=dbName >Create new database:</Label><Br />
				<Input Type=Text ID=dbName Name=dbName />
			</TD>
			<TD>
				<Input Type=submit Name=action Value="Create" Style='color:green; font-weight:bold' />
			</TD>
			</Form>
		</TR>
	</Table>
	<Table Border=0 Style='color:#666699' Width=100%>
		<TR>
			<TD Width=30%><A href='server_info.asp'>Server Information</A></TD>
			<TD Width=5%></TD>
			<TD Width=20%><A href='server_attach_db.asp'>Attach Database</A></TD>
			<TD Width=45%>
		</TR>
		<TR>
			<TD Width=30%><A href='server_databases.asp'>Databases</A></TD>
			<TD Width=5%></TD>
			<TD Width=20%><A href='server_detach_db.asp'>Detach Databse</A></TD>
			<TD width=45%></TD>
		</TR>
		<TR>
			<TD Width=30%><A href='db_drop.asp'>Delete Database</A></TD>
			<TD Width=5%></TD>
			<TD Width=20%><A href='server_db_backup.asp'>Backup Database</A></TD>
			<TD Width=45%></TD>
		</TR>
		<TR>
			<TD Width=30%><A Href='server_export.asp'>Export</A></TD>
			<TD Width=5%></TD>
			<TD Width=20%><A href='server_db_restore.asp'>Restore Database</A></TD>
			<TD Width=45%></TD>
		</TR>
	</Table>
</BODY>
</HTML>
