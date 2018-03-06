<%@ Language=VBScript %>
<!-- #include file="config.asp" -->
<!-- #include file="functions/function.asp" -->
<%	If Request("dbName")<>"" Then
		dbName=Trim(cStr(Request("dbName")))
	End If
	
	On Error Resume Next
	
	If Request("action")<>"" Then
		If Request("action")="Drop" Then
			Dim oConn
			
			Set oConn=Server.CreateObject("ADODB.Connection")
			OpenDB oConn

			CheckErr
						
			oConn.Execute "Drop Procedure " & Trim(cStr(Request("prName")))
			
			If err.number<>0 Then
				Response.Write "<Table Border=1 CellSpacing=0 CellPadding=0><TR bgColor=#666699><TH Style='color:white>SQL Syntax</TH></TR>" & vbCrlf
				Response.Write "<TR><TD>Drop Procedure " & Trim(cStr(Request("prName"))) & "</TD></TR></Table>"
				CheckErr
			End If
			
			CloseDB oConn
			Set oConn=Nothing
		End If
		Response.Redirect "db_procedure.asp?dbName=" & dbName
		Response.End
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
<B>Server: <IMG src="images/server.gif" align="absbottom" ><A href='dbindex.asp'><%=sName %></A> 
&gt;&gt; <A href='server_databases.asp'>Database</A> &gt;&gt; <%=dbName %> &gt;&gt; 
Stored Procedures &gt;&gt Delete</B><Br />
<Br />
	<Table Border=1 CellSpacing=0 cellPadding=0 Width=100%>
		<TR bgColor=#666699 Style='color:white'>
			<TH><A href='db_info.asp?dbName=<%=dbName %>' Style='color:white'>Informations</A></TH>
			<TH><A href='db_table.asp?dbName=<%=dbName %>' Style='color:white'>Table</A></TH>
			<TH><A href='db_view.asp?dbName=<%=dbName %>' Style='color:white'>View</A></TH>
			<TH><A href='db_Procedure.asp?dbName=<%=dbName%>' Style='color:white'>Procedure</A></TH>
			<TH><A href='db_sql.asp?dbName=<%=dbName%>' Style='color:white'>SQL</A></TH>
			<TH bgcolor=red><A href='db_drop.asp?dbName=<%=dbName%>' Style='color:white'>Drop</A></TH>
		</TR>
	</Table>
	<Br /><Br /><Br />
	
	<Form Action="" Method=Post>
	<Table Border=0 CellSpacing=0 CellPadding=0 Width=300>
		<TR bgColor=Orange Height=20>
			<TH ColSpan=3>Delete Stored Procedure</TH>
		</TR>
		<TR bgColor=#666699>
			<TD ColSpan=3>&nbsp;</TD>
		</TR>
		<TR Style='color:Red' Height=100>
			<TD bgColor=#666699>&nbsp;</TD>
			<TD Align=Center>Are you sure you want to delete the stored procedure <B><%=Trim(Request("prName"))%></B>?</TD>
			<TD bgColor=#666699>&nbsp;</TD>
		</TR>
		<TR bgColor=#666699 Height=30>
			<TD Align=Center ColSpan=3>
				<Input Type=Hidden Name=dbName Value=<%=dbName%>>
				<Input Type=Hidden Name=prName Value=<%=Trim(Request("prName"))%>>
				<Input Type=Submit Name=action Value='Drop' Style='color:red'>
				<Input Type=Submit Name=action Value='Cancel'>
			</TD>
		</TR>
	</Table>
	</Form>

</BODY>
</HTML>
