<%@ Language=VBScript %>
<!-- #include file="config.asp" -->
<!-- #include file="functions/function.asp" -->
<%
	Dim oConn
	
	Set oConn=CreateObject("SQLDMO.SQLServer")
	
	If Request("action")<>"" Then
		If Trim(cStr(Request("action")))="Detach" Then
			If Request("dbName")<>"" Then
				oConn.Connect sName, UID, Passwd
				CheckErr
				
				oConn.DetachDB Trim(cStr(Request("dbName")))
				CheckErr
				
				oConn.Close
				Set oConn=Nothing
				
				Response.Redirect "dbindex.asp"
				Response.End
			End If
		ElseIf Trim(cStr(Request("action")))="Cancel" Then
				Set oConn=Nothing
				
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
	
	<script src="functions/setPointer.js" type="text/javascript" language="javascript">
	</script>
</HEAD>
<BODY>
<Br />
<Br /><Br /><B>
Server: <IMG src="images/server.gif" align="absbottom" ><A href='dbindex.asp'><%=sName %></A> 
<Br />
<Br /><Br />
	
	<Form Action="" Method=Post>
	<Table Border=1 CellSpacing=1 CellPadding=1>
		<TR>
			<TD>
				<Table Border=0 CellSpacing=0 CellPadding=0 Width=300>
					<TR bgColor=Orange Height=20>
						<TH ColSpan=2>Detach Database</TH>
					</TR>
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
			If Not db.SystemObject Then
				If ColorCheck=1 Then
					ColorName="#EEEEEE"
					ColorCheck=0
				Else
					ColorName="#CCCCCC"
					ColorCheck=1
				End If%>
					<TR bgcolor=<%=ColorName%> onmouseover="setPointer(this, <%=I%>, 'over', '<%=colorName%>', '#CCCCFF', '#FFCC99');" onmouseout="setPointer(this, <%=I%>, 'out', '<%=ColorName%>', '#CCCCFF', '#FFCC99');">
						<TD Align=Right>
							<Input Type=Radio Name=dbName Value=<%=db.Name%> />
						</TD>
						<TD><%=db.Name%></TD>
					</TR>
<%				I=I+1
			End If
		Next
		
		oConn.Close
		Set oConn=Nothing%>
					<TR bgColor=#666699 Height=30>
						<TD Align=Center ColSpan=2>
							<Input Type=Submit Name=action Value="Detach" />
							<Input Type=Submit Name=action Value="Cancel" />
						</TD>
					</TR>
				</Table>
			</TD>
		</TR>
	</Table>
	</Form>
	
</BODY>
</HTML>
