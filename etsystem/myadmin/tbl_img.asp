<%@ Language=VBScript %>

<!-- #include file="config.asp" -->

<HTML>
<HEAD>
	<Title>ASPMyAdmin For SQL Server By Sukalyan Chakraborty</Title>
	<Meta Name=Description Content="SQL Server web frontend developed by Sukalyan Chakraborty for free use" />
	<Meta Name=Keywords Content="SQL Server web frontend inspired by PHPMyAdmin created by Sukalyan Chakraborty aimed to release more advanced versions in future" />
	
</HEAD>
<BODY>
<Br />
<Br /><Br />
	<img src="picture.asp?dbName=<%=Request("dbName")%>&tName=<%=Request("tName")%>&strKey=<%=Request("strKey")%>&strParam=<%=Request("strParam")%>&colName=<%=Request("colName")%>" />
</BODY>
</HTML>
