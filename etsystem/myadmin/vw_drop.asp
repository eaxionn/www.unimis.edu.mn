<%@ Language=VBScript %>
<!-- #include file="functions/function.asp" -->
<!-- #include file="config.asp" -->

<%
	If Request("dbName")<>"" Then
		dbName=Trim(cStr(Request("dbName")))
	End If
	
	On Error Resume Next
	
	If Request("action")<>"" Then
		If Trim(Request("action"))="Drop" Then
			Dim oConn
			
			Set oConn=Server.CreateObject("ADODB.Connection")
			OpenDB oConn
			CheckErr
			
			oConn.Execute "Drop View " & Trim(cStr(Request("vwName")))
			
			If err.number<>0 Then
				Response.Write "<Table Border=1 CellSpacing=0 CellPadding=0><TR bgColor=#666699><TH Style='color:white>SQL Syntax</TH></TR>" & vbCrlf
				Response.Write "<TR><TD>Drop View " & Trim(cStr(Request("vwName"))) & "</TD></TR></Table>"
				CheckErr
			End If
			
			CloseDb oConn
			Set oConn=Nothing
		End If
		Response.Redirect "db_view.asp?dbName=" & dbName
		Response.End
	End If
%>
<HTML>
<HEAD>
	<Link href=style.css rel=stylesheet>
	<Title>ASPMyAdmin For SQL Server By Sukalyan Chakraborty</Title>
	<Meta Name=Description Content="SQL Server web frontend developed by Sukalyan Chakraborty for free use" />
	<Meta Name=Keywords Content="SQL Server web frontend inspired by PHPMyAdmin created by Sukalyan Chakraborty aimed to release more advanced versions in future" />
	
</HEAD>
<BODY>
<Br />
<Br /><Br />
<B>Server: <IMG src="images/server.gif" align="absbottom" ><A href='dbindex.asp'><%=sName %></A> 
&gt;&gt; <A href='server_databases.asp'>Database</A> &gt;&gt; <%=dbName %> &gt;&gt; 
View &gt;&gt; Drop</B><Br />
<Br />
	<Table border=1 cellspacing=0 cellpadding=0 width=100%>
		<TR bgcolor=#666699 style='color:white'>
			<TH><A href='db_info.asp?dbName=<%=dbName %>' Style='color:white'>Informations</A></TH>
			<TH><A href='db_table.asp?dbName=<%=dbName %>' Style='color:white'>Table</A></TH>
			<TH><A href='db_view.asp?dbName=<%=dbName%>' Style='color:white'>View</A></TH>
			<TH><A href='db_procedure.asp?dbName=<%=dbName %>' Style='color:white'>Procedure</A></TH>
			<TH><A href='db_sql.asp?dbName=<%=dbName%>' Style='color:white'>SQL</A></TH>
			<TH bgcolor=red><A href='db_drop.asp?dbName=<%=dbName%>' Style='color:white'>Drop</A></TH>
		</TR>
	</Table>
	<Br /><Br /><Br />
	<Form Action="" Method=Post>
	<Table Border=0 CellSpacing=0 CellPadding=0 width=300>
		<TR bgColor=Orange Height=20>
			<TH ColSpan=3>Delete View</TH>
		</TR>
		<TR bgColor=#666699>
			<TD ColSpan=3>&nbsp;</TD>
		</TR>
		<TR bgColor=#666699 Height=100>
			<TD>&nbsp;</TD>
			<TD align=Center bgColor=White Style='color:red'>Are you sure you want to drop the view <B><%=Request("vwName")%></B>?</TD>
			<TD>&nbsp;</TD>
		</TR>
		<TR bgColor=#666699 Height=30>
			<TD ColSpan=3 Align=Center>
				<Input Type=Hidden Name=vwName Value=<%=Request("vwName")%>>
				<Input Type=Hidden Name=dbName Value=<%=dbName%>>
				<Input Type=Submit Name=action Value=Drop Style='color:red' />
				<input Type=Submit Name=action Value=Cancel />
			</TD>
		</TR>
	</Table>
	</Form>

</BODY>
</HTML>
