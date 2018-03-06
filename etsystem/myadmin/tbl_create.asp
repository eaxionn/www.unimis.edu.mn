<%@ Language=VBScript %>
<!-- #include file="config.asp" -->
<!-- #include file="functions/function.asp" -->
<%
	If Trim(cStr(Request("dbName")))<>"" Then
		dbName=Trim(cStr(Request("dbName")))
	End If
	
	Dim fldNo
	Dim oConn
	Dim oRS
	Dim I
	Dim errText
	
	Set oConn=Server.CreateObject("ADODB.Connection")
	Set oRS=Server.CreateObject("ADODB.Recordset")
	
	On Error Resume Next
	
	If Request("action")="Save" Then
		Dim strComma
		Dim strPrComms
		Dim StrQuery
		Dim strPrimary
		Dim fldName
		Dim fldType
		Dim fldLen
		Dim fldNull
		Dim fldDefault
		Dim fldKey

	
		fldNo=cInt(Request("fldNo"))
		
		CheckErr
		
		OpenDB oConn
		
		CheckErr
		
		OpenRS oRS, oConn, "sp_datatype_info"
		
		CheckErr
		
		strQuery="Create Table " & Trim(cStr(Request("tName"))) & "("
		strPrimary = ", Primary Key("
		strComma=""
		strPrComma=""
		
		For I=1 To fldNo
			fldName="fldName_" & I
			fldType="fldType_" & I
			fldLen="fldLen_" & I
			fldNull="fldNull_" & I
			
			fldDefault="fldDefault_" & I
			fldKey="fld_Key_" & I
			strQuery=strQuery & strComma & Trim(cStr(Request(fldName))) & " "
			strQuery=strQuery & cStr(Request(fldType))
			
			If Not oRS.BOF Then
				oRS.MoveFirst
			End If
			
			Do While Not oRS.EOF
				If oRS("Type_Name")=cStr(Request(fldType)) Then
					Exit Do
				End If
				oRS.MoveNext
			Loop
			
			If Not IsNull(oRS("Create_Params")) Then
				strQuery=strQuery & "(" & Trim(cStr(Request(fldLen))) & ")"
			End If
			
			If Request(fldNull)="Not Null" Then
				strQuery=strQuery & " Not Null"
			End If
			
			If Request(fldDefault)<>"" Then
				strQuery=strQuery & " Default " & oRS("Literal_Prefix") & Trim(cStr(Request(fldDefault))) & oRS("Literal_Suffix")
			End If
			
			If Request(fldKey)="Primary" Then
				strPrimary = strPrimary & strPrComma & Request(fldName)
				strPrComma=", "
			ElseIF Request(fldKey)="Unique" Then
				strQuery = strQuery & " Unique"
			End If
			
			strComma=", "			
		Next
		
		If strPrimary<>", Primary Key(" Then
			strQuery = strQuery & strPrimary & "))"
		Else
			strQuery = strQuery & ")"
		End If
		
		oConn.Execute strQuery
		If err.Number<>0 Then
			Response.Write "<Table Border=1 CellSpacing=0 CellPadding=0><TR bgColor=#666699 Style='color:white'><TH>SQL - Syntax</TH></TR>"
			Response.Write "<TR><TD>" & strQuery & "</TD></TR></Table><Br />"
			CheckErr
		End If
		
		CloseRS oRS
		Set oRS=Nothing
		CloseDB oConn
		Set oConn=Nothing
		
		Response.Redirect "tbl_structure.asp?dbName=" & dbName & "&tName=" & Request("tName")
		Response.End
	End If
%>
<HTML>
<HEAD>
	<Link Href=style.css rel=stylesheet />
	<Title>ASPMyAdmin For SQL Server By Sukalyan Chakraborty</Title>
	<Meta Name=Description Content="SQL Server web frontend developed by Sukalyan Chakraborty for free use" />
	<Meta Name=Keywords Content="SQL Server web frontend inspired by PHPMyAdmin created by Sukalyan Chakraborty aimed to release more advanced versions in future" />
	
</HEAD>
<BODY>
<Br />
<Br /><Br />
<B>Server: <IMG src="images/server.gif" align="absbottom" ><A href='dbindex.asp'>
<% Response.Write sName %>
</A> &gt&gt <A href='server_databases.asp'>Database</A> &gt&gt <A href='db_info.asp?dbName=<% Response.Write dbName %>'>
<% Response.Write dbName %>
</A> &gt&gt <A href='db_table.asp?dbName=<% Response.Write dbName %>'>Table</A> 
&gt&gt Create</B><Br />
<Br />
<%
	If Trim(cStr(Request("tName")))="" Or Trim(cStr(Request("fldNo")))="" Then
	%>
	<Form Action=tbl_create.asp Method=post>
	<Table Border=0 width=250 CellSpacing=0 CellPadding=0>
		
		<TR bgcolor=#666699 Style='color:white' height=30>
			<TH colspan=3>Create new table on database <%= dbName %></TH>
		</TR>
		<TR bgcolor=#EEEEEE height=30>
			<TD>Name : </TD>
			<TD>
				<Input Type=hidden Name=dbName Value=<%=dbName %>>
				<Input Type=text Name=tName />
			</TD>
			<TD></TD>
		</TR>
		<TR bgcolor=#EEEEEE height=30>
			<TD>Fields : </TD>
			<TD>
				<Input Type=text Name=fldNo Size=6 />
			</TD>
			<TD align=right>
				<Input Type=Submit Name=action Value=Go />
			</TD>
		</TR>
	</Table>
	</Form>
<%
	ElseIf Request("action")="Add" Then
		fldNo=cInt(Trim(cStr(Request("fldNo")))) + cInt(Trim(cStr(Request("addFldNo"))))
		CheckErr
		FieldShow
	ElseIf Request("action")="Remove" Then
		fldNo=cInt(Trim(cStr(Request("fldNo"))))-cInt(Trim(cStr(Request("removeFldNo"))))
		CheckErr
		FieldShow
	Else
		fldNo=cInt(Trim(cStr(Request("fldNo"))))
		CheckErr
		FieldShow
	End If
	
	Function FieldShow()
%>
	<Form Action="" Method=post>
	<%=errText%>
	<Table border=0 width=700>
		<TR bgColor=#666699 Style='color:white' Height=30>
			<TH ColSpan=8>Create Table : 
				<Input Type=text Name=tName Value=<%=Request("tName")%> />
			</TH>
		</TR>	
		<TR bgColor=orange>
			<TH>Field</TH>
			<TH>Type</TH>
			<TH>Length/Precision, scale</TH>
			<TH>Not Null</TH>
			<TH>Default</TH>
			<TH>Primary</TH>
			<TH>Unique</TH>
			<TH>....</TH>
		</TR>

<%		OpenDB oConn
		
		CheckErr
		
		OpenRS oRS, oConn, "sp_datatype_info"
		
		CheckErr
		
		For I=1 To fldNo
%>
		<TR bgColor=#EEEEEE>
			<TD Align=Center>
				<Input Type=Text Name=fldName_<%=I%> />
			</TD>
			<TD Align=Center>
				<Select Name=fldType_<%=I%> ><% While Not oRS.EOF %>
					<Option><%=oRS("TYPE_NAME")%></Option><% oRS.MoveNext
					Wend %>
				</Select>
			</TD>
			<TD Align=Center>
				<Input Type=Text Name=fldLen_<%=I%> size=10 />
			</TD>
			<TD Align=Center>
				<Select Name=fldNull_<%=I%> />
					<Option>Not Null</Option>
					<Option>Null</Option>
				</Select>
			</TD>
			<TD Align=Center>
				<Input Type=Text Name=fldDefault_<%=I%> />
			</TD>
			<TD>
				<Input Type=Radio Name=fld_Key_<%=I%> Value="Primary" />
			</TD>
			<TD>
				<Input Type=Radio Name=fld_Key_<%=I%> Value="Unique" />
			</TD>
			<TD>
				<Input Type=Radio Name=fld_Key_<%=I%> Value="Nill" Checked />
			</TD>
		</TR>
<%
		oRS.MoveFirst
		Next				
		CloseRS oRS
		Set oRS=Nothing
		
		CloseDb oConn
		Set oConn=Nothing
%>
		<TR bgColor=#666699 Align=Center>
			<TD ColSpan=8>
				<Input Type=Hidden Name=dbName Value=<%=dbName%> />
				<Input Type=Hidden Name=fldNo Value=<%=fldNo%> />
				<Input Type=Submit Name=action Value=Save />
			</TD>
		<TR>
	</Table>
	<Br />
	<HR Size=1 />
	<Br />
	Add another <Input Type=Text Name=addFldNo Size=2 /> Fields <Input Type=Submit Name=action Value=Add />
	<Hr Size=1 />
	Remove <Input Type=Text Name=removeFldNo Size=2 /> Fields <Input Type=Submit Name=action Value="Remove" />
	</Form>
<%		
	End Function
%>
</BODY>
</HTML>
