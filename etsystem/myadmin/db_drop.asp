<%@ Language=VBScript %>
<!-- #include file="functions/function.asp" -->
<!-- #include file="config.asp" -->
<%
	If Trim(cStr(Request("dbName")))<>"" Then
		dbName=Trim(cStr(Request("dbName")))
	End If
	
	On Error Resume Next
	
	If Request("action")<>"" Then
		If Trim(Request("action"))="Drop" Then
			Dim oConn
			
			Set oConn=CreateObject("SQLDMO.SQLServer")
			oConn.Connect sName, UID, Passwd

			CheckErr
			
			oConn.ExecuteImmediate "Drop database " & dbName
			CheckErr
			
			CloseDB oConn
			Set oConn=Nothing
			Response.Redirect "server_databases.asp"
			Response.End
		End If
		Response.Redirect "db_table.asp?dbName=" & dbName
		Response.End
	End If
%>
<HTML>
<HEAD>
	<Link href=style.css rel=stylesheet>
	<Title>ASPMyAdmin For SQL Server By Sukalyan Chakraborty</Title>
	<Meta Name=Description Content="SQL Server web frontend developed by Sukalyan Chakraborty for free use" />
	<Meta Name=Keywords Content="SQL Server web frontend inspired by PHPMyAdmin created by Sukalyan Chakraborty aimed to release more advanced versions in future" />
	
	<script src="functions/setPointer.js" type="text/javascript" language="javascript">
	</script>
</HEAD>
<BODY>
	Please send me your feedback, comments, bug reports at <A href="mailto:sukalyanc@gmail.com">sukalyanc@gmail.com</A> or call me on +91 9830365429
	<HR Size=1 />
	<Br /><Br /><Br />
<%	If Request("dbName")<>"" Then%>
<B>Server: <IMG src="images/server.gif" align="absbottom" ><A href='dbindex.asp'><%=sName %></A> 
&gt;&gt; <A href='server_databases.asp'>Database</A> &gt;&gt; <%=dbName %> &gt;&gt; 
Drop</B><Br />
<Br />
		<Table border=1 cellspacing=0 cellpadding=0 width=100%>
			<TR bgcolor=#666699 style='color:white'>
				<TH><A href='db_info.asp?dbName=<%=dbName %>' Style='color:white'>Informations</A></TH>
				<TH><A href='db_table.asp?dbName=<%=dbName %>' Style='color:white'>Table</A></TH>
				<TH><A href='db_view.asp?dbName=<%=dbName%>' style='color:white'>View</A></TH>
				<TH><A href='db_procedure.asp?dbName=<%=dbName %>' Style='color:white'>Procedure</A></TH>
				<TH><A href='db_sql.asp?dbName=<%=dbName%>' Style='color:white'>SQL</A></TH>
				<TH bgcolor=red>Drop</TH>
			</TR>
		</Table>
		<Br /><Br /><Br />
	
		<Form Action="" Method=Post>
		<Table Border=0 CellPadding=0 CellSpacing=0 Width=300>
		<TR bgColor=Orange Height=20>
				<TH>Drop Database</TH>
			</TR>
			<TR bgColor=#EEEEEE Height=100>
				<TD Align=Center Style='color:red'>Are you sure you want to drop database <B><%=dbName%></B>?</TD>
			</TR>
			<TR bgColor=#666699 Height=30>
				<TD Align=Center>
					<Input Type=Hidden Name=dbName Value=<%=dbName%> />
					<Input Type=Submit Name=action Value="Drop" Style='color:red;font-weight:bold' />
					<Input Type=Submit Name=action Value="Cancel" />
				</TD>
			</TR>
		</Table>
		</Form>
<%	Else
		Dim db
		
		Set oConn=CreateObject("SQLDMO.SQLServer")
		oConn.Connect sName, UID, Passwd
		CheckErr%><B>
Server: <IMG src="images/server.gif" align="absbottom" ><A href='dbindex.asp'><%=sName %></A> 
<Br />
<Br /><Br />
		<Form Action="" Method=Post>
		<Table Border=1 CellSpacing=1 CellPadding=1>
			<TR>
				<TD>
					<Table Border=0 CellSpacing=0 CellPadding=0 Width=300>
						<TR bgColor=Orange Height=20>
							<TH ColSpan=2>Delete Database</TH>
						</TR>
						<TR Height=100>
							<TD Align=Right>Database : </TD>
							<TD>
								<Select Name=dbName><% For Each db In oConn.Databases
								If Not db.SystemObject Then%>
									<Option><%=db.Name%></Option><% End If
									Next %>
								</select>
<%		oConn.Close
		Set oConn=Nothing%>								
							</TD>
						</TR>
						<TR bgColor=Green Height=30>
							<TD Align=Center ColSpan=2>
								<Input Type=Submit Name=action Value=Drop />
								<Input Type=Submit Name=action Value=Cancel />
							</TD>
						</TR>
					</Table>
				</TD>
			</TR>
		</Table>
		</Form>
<%	End If%>		
</BODY>
</HTML>
