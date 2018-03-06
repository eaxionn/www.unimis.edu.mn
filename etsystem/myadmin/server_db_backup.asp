<%@ Language=VBScript %>
<!-- #include file="config.asp" -->
<!-- #include file="functions/function.asp" -->
<%
	Dim oConn
	
	On Error Resume Next
	
	Set oConn=CreateObject("SQLDMO.SQLServer")
	
	If Request("action")<>"" Then
		If Request("action")="Backup" Then
			If Trim(cStr(Request("dbName")))<>"" Then
				Dim oBackup
				Dim oBackDev
				
				Set oBackup=CreateObject("SQLDMO.Backup")
				Set oBackDev=CreateObject("SQLDMO.BackupDevice")
				
				oConn.Connect sName, UID, Passwd
				CheckErr
				
				
					Dim strPath
										
					oBackDev.Name="Back1"
					strPath=Server.MapPath(".") & "\Backup\" & Trim(Request("dbName")) & ".bak"
					oBackDev.PhysicalLocation=strPath
					oBackDev.Type=2
					
					oConn.BackupDevices.Add oBackDev
					CheckErr
					
					oBackup.Devices="Back1"
					
				If Trim(Request("bkType"))="Complete" Then	
					oBackup.Action=0
				Else
					oBackup.Action=1
					If Trim(cStr(Request("bkName")))<>"" Then
						oBackup.MediaName=Trim(cStr(Request("bkName")))
					End If
				End If
				
				oBackup.Database=Trim(cStr(Request("dbName")))
				
				If Trim(cStr(Request("bkName")))<>"" Then
					oBackup.BackupSetName=Trim(cStr(Request("bkName")))
				End If
				
				If Trim(cStr(Request("bkDesc")))<>"" Then
					oBackup.BackupSetDescription=Trim(cStr(Request("bkDesc")))
				End If
				
				If request("oWrite")="Overwrite" Then
					oBackup.Initialize=True
				Else
					oBackup.Initialize=False
				End If
				
				If err.number<>0 Then
					oConn.BackupDevices.Remove "Back1"
					CheckErr
				End If
				
				oBackup.SQLBackup oConn
				CheckErr
				
				oConn.BackupDevices.Remove "Back1"
				CheckErr
				
				Set oBackup=Nothing
				Set oBackDev=Nothing
				oConn.Close
				Set oConn=Nothing
				
				Response.Redirect "db_info.asp?dbName=" & Trim(cStr(Request("dbName")))
				Response.End
			End If
		End If
		Set oConn=Nothing
		Response.Redirect "dbindex.asp"
		Response.End
	End If
	
%>
<HTML>
<HEAD>
	<Link href=style.css rel=stylesheet />
	<Title>ASPMyAdmin For SQL Server By Sukalyan Chakraborty</Title>
	<Meta Name=Description Content="SQL Server web frontend developed by Sukalyan Chakraborty for free use" />
	<Meta Name=Keywords Content="SQL Server web frontend inspired by PHPMyAdmin created by Sukalyan Chakraborty aimed to release more advanced versions in future" />
	
	<script src="functions/setPointer.js" type="text/javascript" language="javascript">
	</script>
</HEAD>
<BODY>
<Br />
<Br /><Br />
<B>Server: <IMG src="images/server.gif" align="absbottom" ><A href='dbindex.asp'><%=sName %></A></B> 
<Br />
<Br /><Br />
	
	<Form Action="" Method=Post>
	<Table Border=1 CellSpacing=1 CellPadding=1>
		<TR>
			<TD>
				<Table Border=0 CellSpacing=0 CellPadding=0 Width=300>
					<TR bgColor=Orange Height=20>
						<TH ColSpan=2>Backup Database</TH>
					</TR>
					<TR>
						<TD ColSpan=2>&nbsp;</TD>
					</TR>
					<TR>
						<TD>Database : </TD>
						<TD>
							<Select Name=dbName>
	<%
		Dim db
		Dim ColorCheck
		Dim ColorName
		Dim I
		
		oConn.Connect sName, UID, Passwd
		CheckErr
		ColorCheck=1
		I=1
		
		For Each db In oConn.Databases
			If Not db.SystemObject Then%>
								<Option><%=db.Name%></Option>
<%			End If
		Next%>				</Select>
						</TD>
					</TR>
					<TR>
						<TD>Name : </TD>
						<TD>
							<Input Type=Text Name=bkName />
						</TD>
					</TR>
					<TR>
						<TD>Description : </TD>
						<TD>
							<Input Type=Text Name=bkDesc />
						</TD>
					</TR>
					<TR>
						<TD ColSpan=2>&nbsp;</TD>
					</TR>
					<TR>
						<TH ColSpan=2 bgColor=Orange>Backup Type</TH>
					</TR>
					<TR>
						<TD ColSpan=2>&nbsp;</TD>
					</TR>
					<TR>
						<TD Align=Right>
							<Input Type=radio Name=bkType Value="Complete" Checked />
						</TD>
						<TD>Complete Backup</TD>
					</TR>
					<TR>
						<TD Align=Right>
							<Input Type=radio Name=bkType Value="Differential" />
						</TD>
						<TD>Differential Backup</TD>
					</TR>
					<TR>
						<TD ColSpan=2>&nbsp;</TD>
					</TR>
					<TR bgColor=Orange>
						<TH ColSpan=2>Overwrite</TH>
					</TR>
					<TR>
						<TD ColSpan=2>&nbsp;</TD>
					</TR>
					<TR>
						<TD Align=Right>
							<Input Type=Radio Name=oWrite Value="Overwrite" Checked/>
						</TD>
						<TD>Overwrite</TD>
					</TR>
					<TR>
						<TD Align=Right>
							<Input Type=Radio Name=oWrite Value="Append" />
						</TD>
						<TD>Append<TD>
					</TR>
					<TR>
						<TD ColSpan=2>&nbsp;</TD>
					</TR>
<%		oConn.Close
		Set oConn=Nothing
%>
					<TR bgColor=Green Height=30>
						<TD Align=Center ColSpan=2>
							<Input Type=Submit Name=action Value="Backup" />
							<Input Type=Submit Name=action Value="Cancel" />
						</TD>
					</TR>
				</Table>
			</TD>
		</TR>
	</Table>
	</Form>
	<Br /><Br /><Br />
	<B>*</B> You can find the backup file in the <B>backup</B> folder under ASPMyAdmin after backing up the database.
</BODY>
</HTML>
