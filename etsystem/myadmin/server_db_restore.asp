<%@ Language=VBScript %>
<!-- #include file="config.asp" -->
<!-- #include file="functions/function.asp" -->
<%
	If Request("action")<>"" Then
		If Trim(cStr(Request("dbFile")))<>"" And Trim(cStr(Request("dbName")))<>"" Then
			If Trim(Request("action"))="Restore" Then
				Dim oConn
				Dim oRestDev
				Dim oRestore
				
				Set oConn=CreateObject("SQLDMO.SQLServer")
				oConn.Connect sName, UID, Passwd
				
				Set oRestore=CreateObject("SQLDMO.Restore")
				Set oRestDev=CreateObject("SQLDMO.BackupDevice")
				
				oRestDev.Name="Rest1"
				strPath=Server.MapPath(".") & "\backup\" & Trim(cStr(Request("dbFile")))
				oRestDev.PhysicalLocation=strPath
				oRestDev.Type=2
				
				oConn.BackupDevices.Add oRestDev
				CheckErr
				
				oRestore.Action=0
				oRestore.Devices="Rest1"
				oRestore.Database=Trim(cStr(Request("dbName")))
				oRestore.FileNumber=1
				oRestore.ReplaceDatabase=True
				
				oRestore.SQLRestore oConn
				oConn.BackupDevices.Remove "Rest1"
				CheckErr
				
				Set oRestDev=Nothing
				Set oRestore=Nothing
				oConn.Close
				Set oConn=Nothing
				
				Response.Redirect "db_info.asp?dbName=" & Trim(cStr(Request("dbName")))
				Response.End
				
			End If
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
<Br /><Br />
<B>Server: <IMG src="images/server.gif" align="absbottom" ><A href='dbindex.asp'><%=sName %></A></B> 
<Br />
<Br /><Br />
	
	<Form Action="" Method=Post id=form1 name=form1>
	<Table Border=1 CellSpacing=1 CellPadding=1>
		<TR>
			<TD>
				<Table Border=0 CellSpacing=0 CellPadding=0 Width=300>
					<TR bgColor=Orange Height=20>
						<TH ColSpan=2>Restore Database</TH>
					</TR>
					<TR Height=50>
						<TD>Backup File Name : </TD>
						<TD>
							<Input Type=Text Name=dbFile />
						</TD>
					</TR>
					<TR Height=50>
						<TD>Restore As Database : </TD>
						<TD>
							<Input Type=Text Name=dbName />
						</TD>
					</TR>
					<TR Height=30 bgColor=Green>
						<TD ColSpan=2 Align=Center>
							<Input Type=Submit Name=action Value="Restore" />
							<Input Type=Submit Name=action Value="Cancel" />
						</TD>
					</TR>
				</Table>
			</TD>
		</TR>
	</Table>
	</Form>
	
	<Br /><Br /><Br />
	<B>*</B> Please upload the backupfile to the <B>Backup</B> folder under ASPMyAdmin.
	<Br />
	<B>**</B> Don't give the full path of the file. Give only the name of the backup file.
</BODY>
</HTML>
