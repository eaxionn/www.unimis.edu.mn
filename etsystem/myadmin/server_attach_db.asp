<%@ Language=VBScript %>
<!-- #include file="config.asp" -->
<!-- #include file="functions/function.asp" -->
<%
	On Error Resume Next
	
	If Request("action")<>"" Then
		If Trim(Request("action"))="Attach" Then
			If Trim(Request("dbName"))<>"" And trim(Request("dbFile"))<>"" Then
				Dim oConn
				'Dim fso
				'Dim f
				
				Set oConn=CreateObject("SQLDMO.SQLServer")
				oConn.Connect sName, UID, Passwd
				CheckErr
			
				'Set fso=CreateObject("Scripting.FileSystemObject")
				'Set f=fso.GetFile(Trim(cStr(Request("dbFile"))))
				oConn.AttachDB Trim(cStr(Request("dbName"))), Server.MapPath(".") & "\" & Trim(cStr(Request("dbFile")))
				CheckErr
			
				oConn.Close
				Set oConn=Nothing
				Response.Redirect "db_info.asp?dbName=" & Trim(cStr(Request("dbName")))
				Response.End
			Else
				HasError=1
			End If
		Else
			Response.Redirect "dbindex.asp"
			Response.End
		End If
	End If
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
<Br /><Br /><B>
Server: <IMG src="images/server.gif" align="absbottom" ><A href='dbindex.asp'><%=sName %></A> 
<Br />
<Br /><Br />
	
	
	<% If HasError=1 Then%>
	<Font color=red><B>Please enter all the fields.</B></Font><Br /><Br />
	<% End If%>
	
	
	<Form Action="" Method=Post>
	<Table Border=1 CellSpacing=1 CellPadding=1>
		<TR>
			<TD>
				<Table Border=0 CellSpacing=0 CellPadding=0 Width=400>
					<TR bgColor=Orange Height=20>
						<TH ColSpan=2>Attach Database</TH>
					</TR>
					<TR Height=40>
						<TD>File name & path : </TD>
						<TD>
							<Input Type=Text Name=dbFile Size=40 />
						</TD>
					</TR>
					<TR Height=40>
						<TD>Database Name : </TD>
						<TD>
							<Input Type=Text Name=dbName />
						</TD>
					</TR>
					<TR bgColor=#666699 Height=30>
						<TD ColSpan=2 Align=Center>
							<Input Type=Submit Name=action Value="Attach" />
							<Input Type=Submit Name=action Value="Cancel" />
						</TD>
					</TR>
				</Table>
			</TD>
		</TR>
	</Table>
	</Form>
	
	<Br /><Br />
	<B>* Please enter the path of the "mdf" file relative to the root directory of ASPMyAdmin<Br />
	e.g. - <I>database\example.mdf</I> when the <U>virtual file path</U> is <I>http://localhost/ASPMyAdmin/database/example.mdf</I></B>
</BODY>
</HTML>
