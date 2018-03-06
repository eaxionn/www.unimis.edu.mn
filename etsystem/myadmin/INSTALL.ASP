<%@ Language=VBScript %>
<!-- #include file="functions/function.asp" -->
<%
	If Request("action")="Save" Then
		Dim fso
		Dim f
		
		Set fso=CreateObject("Scripting.FileSystemObject")
		
		Set f=fso.CreateTextFile(Server.MapPath("config.asp"))
		
		f.WriteLine "<%"
		f.WriteLine vbTab & "Dim sName"
		f.WriteLine vbTab & "Dim UID"
		f.WriteLine vbTab & "Dim passwd"
		f.WriteLine vbTab & "Dim dbName"
		f.WriteLine vbCrlf
		f.WriteLine vbTab & "sName=""" & Trim(cStr(Request("sName"))) & """"
		f.WriteLine vbTab & "UID=""" & Trim(cStr(Request("UID"))) & """"
		f.WriteLine vbTab & "passwd=""" & Trim(cStr(Request("passwd"))) & """"
		f.WriteLine vbTab & "dbName=""" & Trim(cStr(Request("dbName"))) & """"
		f.WriteLine "%\>"
		f.Close
		
		CheckErr
		
		Set f=Nothing
		Set fso=Nothing
		
		Response.Redirect "index.asp"
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
	<Center>
	Please send me your feedback, comments, bug reports at <A href="mailto:sukalyanc@gmail.com">sukalyanc@gmail.com</A> or call me on +91 9830365429
	<HR Size=1 />
	<Br /><Br /><Br />
	
	<H2>Welcome to ASPMyAdmin<Br />Written By Sukalyan Chakraborty</H2>
	<B>Sukalyan Chakraborty<Br />
	115 Shantinagar, Rahara<Br />
	Kolkata (Calcutta) - 700118<Br />
	West Bengal<Br />
	India</Br />
	Ph :- +91 9830365429(M)<Br />
	Email - sukalyanc@gmail.com</B>
	
	<Br /><Br />
	
	<Form Action="" Method=Post>
	<Table Border=1 CellSpacing=1 CellPadding=1>
		<TR>
			<TD>
				<Table Border=0 CellSpacing=0 CellPadding=0 Width=300>
					<TR bgColor=#666699 Height=20>
						<TH ColSpan=2 Style='color:white'>Install ASPMyAdmin</TH>
					</TR>
					<TR bgColor=Orange  Height=20>
						<TH>Field</TH>
						<TH>Value</TH>
					</TR>
					<TR  Height=20>
						<TD>Server Name : </TD>
						<TD>
							<Input Type=Text Name=sName />
						</TD>
					</TR>
					<TR  Height=20>
						<TD>User ID : </TD>
						<TD>
							<Input Type=Text Name=UID />
						</TD>
					</TR>
					<TR Height=20>
						<TD>Password : </TD>
						<TD>
							<Input Type=Password Name=Passwd />
						</TD>
					</TR>
					<TR Height=20>
						<TD>Database : <Br />(Optional)</TD>
						<TD>
							<Input Type=Text Name=dbName />
						</TD>
					</TR>
					<TR bgColor=Green Height=30>
						<TD Align=Center ColSpan=2>
							<Input Type=Submit Name=action Value="Save" />
						</TD>
					</TR>
				</Table>
			</TD>
		</TR>
	</Table>
	</Form>
	<Br /><Br /><Br />
	If you like the product please let me know. I am waiting for your comments. Any bug you find please report me.
	I will try to rectify. I am planning to release another version of ASPMyAdmin within few months with some more 
	features and flexibility. But for that I need your help. So please report the bugs and give your suggestions.
	<Br /><Br />
	This software is absolutely free of cost. You can use this anywhere as long as you give me the credit by putting my name in it.
	It will be highly appreciated if you inform me before using it commercially. But that is not necessary and don't involve any kind of
	money transaction. 
	<Br /><Br />
	As it took a lot of time and energy to develop this first version of ASPMyAdmin it will be highly appreciated if you donate something
	to keep this project alive and add many other features. A proper job proposal is also very much welcome to me.
	</Center>
</BODY>
</HTML>
