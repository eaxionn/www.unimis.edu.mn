<%@ Language=VBScript %>
<!-- #include file="config.asp" -->
<!-- #include file="functions/function.asp" -->
<%
	If Request("action")="Cancel" Then
		Response.Redirect "dbindex.asp"
		Response.End
	End If
	
	On Error Resume Next
	
	Dim oConn
	Dim ColorCheck
	Dim ColorName
	Dim oTable
	
	Set oConn=CreateObject("SQLDMO.SQLServer")
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
	<B>Server: <IMG src="images/server.gif" ><A href='dbindex.asp'><%=sName %></A> &gt;&gt; Export/Import</B>
	<Br /><Br /><Br />
<%	If Request("action")="" Then%>	
	<Form Action="" Method=Post>
	<Table Border=1 cellSpacing=1 CellPadding=1>
		<TR>
			<TD>
				<Table Border=0 CellSpacing=1 CellPadding=1 Width=500>
					<TR bgColor=#666699 Height=20 Style='color:white'>
						<TH ColSpan=2>Export/Import Data</TH>
					</TR>
					<TR bgColor=Orange>
						<TH Align=Center width=250>Source Database</TH>
						<TH Align=Center width=250>Destination Database</TH>
					</TR>
					<TR Height=100>
						<TD Align=Center>
							<Select Name=sDBName><%
					Dim db
					
					oConn.Connect sName, UID, Passwd
					CheckErr
					
					For Each db In oConn.Databases
						If Not db.SystemObject Then%>
								<Option><%=db.Name%></Option><%
						End If
					Next%>
							</Select>
						</TD>
						<TD Align=Center>
							<Select Name=dDBName><%
					For Each db In oConn.Databases
						If Not db.SystemObject Then%>
								<Option><%=db.Name%></Option><%
						End If
					Next%>
							</Select>
						</TD>
					</TR>
					<TR bgColor=Green Height=30>
						<TD ColSpan=2 Align=Center>
							<Input Type=Submit Name=action Value="Continue" />
							<Input Type=Submit Name=action Value="Cancel" />
						</TD>
					</TR>
				</Table>
			</TD>
		</TR>
	</Table>
	</Form>
	<%	oConn.Close
		Set oConn=Nothing
	ElseIf Request("action")="Continue" Then
		If Request("sDBName")=Request("dDBName") Then%>
	<Table Border=1 CellSpacing=1 CellPadding=1>
		<TR>
			<TD>
				<Table Border=0 CellPadding=0 CellSpacing=0 Width=300>
					<TR bgColor=Orange Height=20>
						<TH>Error</TH>
					</TR>
					<TR Height=100>
						<TD Align=Center Style='Color:Red'>Source and Destination database cannot be same.<BR>Please choose different databases.</TD>
					</TR>
					<TR bgColor=Green Height=20>
						<TD Align=Center><A href='server_export.asp' Style='Color:White'>Try Again</A></TD>
					</TR>
				</Table>
			</TD>
		</TR>
	</Table>
</BODY>
</HTML>
<%			Response.End
		End If%>
	<B>Source Database - <I><%=Request("sDBName")%></I><Br />
	Destination Database - <I><%=Request("dDBName")%></I></B><Br /><Br />
	<Form Action="" Method=Post>
	<Table Border=1 CellSpacing=1 CellPadding=1>
		<TR>
			<TD>
				<Table Border=0 CellSpacing=1 CellPadding=1 Width=300>
					<TR bgColor=#666699 Height=20>
						<TH ColSpan=2 Style='color:white'>Export/Import Data</TH>
					</TR>
					<TR bgColor=Orange Height=20>
						<TH ColSpan=2>Select Tables</TH>
					</TR><%
		oConn.Connect sName, UID, Passwd
		CheckErr
		
		Dim I
		
		ColorCheck=1
		I=0
		
		For Each oTable In oConn.Databases(cStr(Request("sDBName"))).Tables
			If Not oTable.SystemObject Then
				If ColorCheck=1 Then
					ColorName="#EEEEEE"
					ColorCheck=0
				Else
					ColorName="#CCCCCC"
					ColorCheck=1
				End If%>
					<TR bgColor='<%=colorName%>' onMouseOver="setPointer(this, <%=I%>, 'over', '<%=colorName%>', '#CCCCFF', '#FFCC99');" onMouseOut="setPointer(this, <%=I%>, 'out', '<%=colorName%>', '#CCCCFF', '#FFCC99');">
						<TD>
							<Input Type=CheckBox  Name=<%=oTable.Name%> />
						</TD>
						<TD><%=oTable.Name%></TD>
					</TR><%
				I=I+1
			End If
		Next%>
					<TR bgColor=Orange Height=20>
						<TH ColSpan=2>Options</TH>
					</TR>
					<TR>
						<TD>
							<Input Type=Radio Name=exptType Value="Both" Checked />
						</TD>
						<TD>Export/Import Table Structure and Data</TD>
					</TR>
					<TR>
						<TD>
							<Input Type=Radio Name=exptType Value="struct" />
						</TD>
						<TD>Export/Import Table Structure Only</TD>
					</TR>
					<TR bgColor=Green Height=30>
						<TD Align=Center ColSpan=2>
							<Input Type=Hidden Name=sDBName Value="<%=Request("sDBName")%>" />
							<Input Type=Hidden Name=dDBName Value="<%=Request("dDBName")%>" />
							<Input Type=Submit Name=action Value="Go" />
							<Input Type=Submit Name=action Value="Cancel" />
						</TD>
					</TR>
				</Table>
			</TD>
		</TR>
	</Table>
	</Form>
<%	ElseIF Request("action")="Go" Then%>
	<Table Border=1 CellSpacing=1 CellPadding=1>
		<TR>
			<TD>
				<Table Border=0 CellSpacing=1 CellPadding=1 Width=450>
					<TR bgColor=#666699 Height=20>
						<TH ColSpan=4>Data Export/Import Report</TH>
					</TR>
					<TR bgColor=Orange Height=20>
						<TH Width=200>Table</TH>
						<TH>Structure</TH>
						<TH>Index</TH>
						<TH>Data</TH>
					</TR>
<%		Dim oConn1
		Dim oConn2
		Dim oConn3
		Dim oRS1
		Dim oRS2
		Dim oRS3
		Dim oDtType
		Dim HasType
		Dim HasIdentity
		Dim Data_Type
		Dim IdxName
		Dim strIndex
		Dim HasError
		
		
		ColorCheck=1
		
		Set oConn1=CreateObject("SQLDMO.SQLServer")
		oConn1.Connect sName, UID, Passwd
		CheckErr
		
		Set oConn2=CreateObject("ADODB.Connection")
		oConn2.ConnectionString="Provider=SQLOLEDB;Data Source=" & sName & ";UID=" & UID & ";PWD=" & Passwd & ";DATABASE=" & Trim(cStr(Request("sDBName"))) & ""
		oConn2.Open
		CheckErr
		
		Set oConn3=CreateObject("ADODB.Connection")
		oConn3.ConnectionString="Provider=SQLOLEDB;Data Source=" & sName & ";UID=" & UID & ";PWD=" & Passwd & ";DATABASE=" & Trim(cStr(Request("dDBName"))) & ""
		oConn3.Open
		CheckErr
		
		Set oRS1=Server.CreateObject("ADODB.Recordset")
		Set oRS2=Server.CreateObject("ADODB.Recordset")
		Set oRS3=Server.CreateObject("ADODB.Recordset")
		
		oRS3.Open "sp_datatype_info", oConn3
		
		For Each oTable In oConn1.Databases(Trim(cStr(Request("sDBName")))).Tables
			If Not oTable.SystemObject Then
				If Request(oTable.Name)="on" Then
					
					If ColorCheck=1 Then
						ColorName="#EEEEEE"
						ColorCheck=0
					Else
						ColorName="#CCCCCC"
						ColorCheck=1
					End If
%>
					<TR bgColor=<%=ColorName%>><%					
					
					CloseRS oRS1
					CloseRS oRS2
					oRS1.Open "sp_columns " & oTable.Name, oConn2
					oRS2.Open "sp_indexes_rowset " & oTable.Name, oConn2
					
					HasError=0
					HasComma=""
					strQuery="Create Table " & oTable.Name & "("
					strPrimary=""
					HasPriComma=""
					While Not oRS1.EOF
						HasType=0
						If Not oRS3.BOF Then
							oRS3.MoveFirst
						End If
					
						Do While Not oRS3.EOF
							If oRS3("Type_Name")=oRS1("Type_Name") Then
								HasType=1
								Exit Do
							End If
							oRS3.MoveNext
						Loop
						
						If HasType=0 Then
							Set oDtType=CreateObject("SQLDMO.UserDefinedDataType")
							Set oDtType=oConn1.Databases(cStr(Request("sDBName"))).UserDefinedDatatypes(cStr(oRS1("Type_Name")))
							Data_Type=cStr(oDtType.BaseType)
							Set oDtType=Nothing
						Else
							Data_Type=oRS1("Type_Name")
						End If
						'Response.Write Data_Type & " " & oRS1("Type_Name") & " " & HasType & "<Br />"
						strQuery=strQuery & HasComma & oRS1("Column_Name") & " " & Data_Type
						
						If HasType=0 Then
							If Not oRS3.BOF Then
								oRS3.MoveFirst
							End If
							
							Do While Not oRS3.EOF
								If oRS3("Type_Name")=Data_Type Then
									Exit Do
								End If
								oRS3.MoveNext
							Loop
						End If
						
						If Not IsNull(oRS3("Create_Params")) Then
							strQuery=strQuery & "(" & oRS1("Length") & ")"
						End If
						If oRS1("Is_Nullable")="NO" Then
							strQuery=strQuery & " Not Null"
						End If
						If Not IsNull(oRS1("Column_Def")) Then
							strQuery = strQuery & " Default " & oRS1("Column_Def")
						End If
						If oRS2.State=1 Then
							If Not oRS2.BOF Then
								oRS2.MoveFirst
							End If
							
							Do While Not oRS2.EOF
								If oRS2("Column_Name")=oRS1("Column_Name") Then
									If oRS2("Primary_Key") Then
										strPrimary=strPrimary & HasPriComma & oRS1("Column_Name")
										HasPriComma=", "
									ElseIf oRS2("Unique") Then
										strQuery=strQuery & " Unique"
									End If
									Exit Do
								End If
								oRS2.MoveNext
							Loop
						End If
						HasComma=", "
						oRS1.MoveNext
					Wend
					If strPrimary<>"" Then
						strQuery=strQuery & ", Primary Key(" & strPrimary & "))"
					Else
						strQuery=strQuery & ")"
					End If
					oConn3.Execute strQuery
					
					If Err.number<>0 Then%>
						<TD><%=oTable.Name%></TD>
						<TD Align=Center Style='color:red'>Table Failed</TD><%
					Else%>
						<TD><%=oTable.Name%></TD>
						<TD Align=Center Style='Color:Green'>Table Done</TD><%
					End If
					
					If Not oRS2.BOF Then
						oRS2.MoveFirst
					End If
					IdxName=""
					
					While Not oRS2.EOF
						If oRS2("index_Name")<>IdxName Then
							If Not oRS2("Primary_Key") And Not oRS2("Unique") Then
								CloseRS oRS1
								oRS1.Open "sp_indexes_rowset @table_Name='" & oTable.Name & "', @Index_Name='" & oRS2("Index_Name") & "'", oConn2
								strIndex="Create Index " & oRS2("Index_Name") & " On " & oTable.Name & "("
								HasComma=""
								While Not oRS1.EOF
									strIndex=strIndex & HasComma & oRS1("Column_Name")
									HasComma=", "
									oRS1.MoveNext
								Wend
								strIndex=strIndex & ")"
								oConn3.Execute strIndex
								
							End If
						End If
						IdxName=oRS2("Index_Name")
						oRS2.MoveNext
					Wend
					If Err.number<>0 Then%>
						<TD Align=Center Style='color:red'>Index Failed</TD><%
					Else%>
						<TD Align=Center Style='Color:Green'>Index Done</TD><%
					End IF
					
					
					If Request("exptType")="Both" Then
					
						oRS1.Close
						oRS1.Open "sp_columns " & oTable.Name, oConn3
						oRS2.Close
						oRS2.Open "Select * From " & oTable.Name, oConn2
						
						Do While Not oRS2.EOF
							If Not oRS1.BOF Then
								oRS1.MoveFirst
							End If
							
							strQuery="Insert into " & oTable.Name & "("
							strQuery1=" Values("
							HasComma=""
							While Not oRS1.EOF
								If Right(cStr(oRS1("Type_Name")), 8)<>"identity" And oRS1("Type_Name")<>"timestamp" And oRS1("Type_Name")<>"sql_variant" Then
									If oRS1("Type_Name")<>"image" And oRS1("Type_Name")<>"binary" And oRS1("Type_Name")<>"varbimary" Then
										If Not IsNull(oRS2(cStr(oRS1("Column_Name")))) Then
											strQuery=strQuery & HasComma & oRS1("Column_Name")
											If Not oRS3.BOF Then
												oRS3.MoveFirst
											End If
											Do While Not oRS3.EOF
												If oRS3("Type_Name")=oRS1("Type_Name") Then
													Exit Do
												End If
												oRS3.MoveNext
											Loop
											If oRS1("Type_Name")="image" Or oRS1("Type_Name")="binary" Or oRS1("Type_Name")="varbinary" Then
												strQuery1=strQuery1 & HasComma & oRS3("Literal_Prefix") & oRS2(cStr(oRS1("Column_Name"))) & oRS3("Literal_Suffix")
											ElseIf oRS1("Type_Name")="bit" Then
												strQuery1=strQuery1 & HasComma & oRS3("Literal_Prefix") & cInt(oRS2(cStr(oRS1("Column_Name")))) & oRS3("Literal_Suffix")
											Else
												strQuery1=strQuery1 & HasComma & oRS3("Literal_Prefix") & Replace(oRS2(cStr(oRS1("Column_Name"))), "'", "''") & oRS3("Literal_Suffix")
											End If
											HasComma=", "
										End If
									End If
								End If
								oRS1.MoveNext
							Wend
								strQuery=strQuery & ")" & strQuery1 & ")"
								'Response.Write strQuery & "<BR><BR>"
								oConn3.Execute strQuery
							
								If Err.number<>0 Then
									HasError=1
								End If
												
								oRS2.MoveNext
						Loop
						
						If HasError <> 0 Then%>
						<TD Align=Center Style='Color:Red'>Data Failed</TD><%
						Else%>
						<TD Align=Center Style='Color:Green'>Data Done</TD><%
						End If
					Else%>
						<TD Align=Center>Aborted</TD><%
					End If%>
					</TR><%
				End If
			End If
		Next
		
		CloseRS oRS1
		Set oRS1=Nothing
		
		CloseRS oRS2
		Set oRS2=Nothing
		
		CloseRS oRS3
		Set oRS3=Nothing
		
		oConn1.Close
		Set oConn1=Nothing
		
		oConn2.Close
		Set oConn2=Nothing
		
		oConn3.Close
		Set oConn3=Nothing
		
		Set oConn=Nothing%>
				</Table>
			</TD>
		</TR>
	</Table>
		
<%	End If
%>
</BODY>
</BODY>
</HTML>
