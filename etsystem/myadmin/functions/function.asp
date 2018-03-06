<%
	
	Function CheckErr()
		If Err.number<>0 Then
			Response.Write "<Table Border=1 cellspacing=0 cellpadding=0><TR><TH bgColor=Red Style='color:white'>Error - " & err.number & "</TD></TR>" & vbCrlf
			Response.Write "<TR><TD>" & err.Description & "</TD><TR>"
			Response.Write "</Table>"
			Response.End
		End If
	End Function
	
	Function OpenDB(Conn)
		CloseDB(Conn)
		Conn.ConnectionString="Provider=SQLOLEDB;Data Source=" & sName & ";UID=" & UID & ";PWD=" & Passwd & ";DATABASE=" & dbName & ""
		Conn.Open
			
	End Function
	
	Function OpenRS(RS, Conn, Query)
		CloseRS(RS)
		RS.Open Query, Conn
		
	End Function
	
	Function CloseDB(Conn)
		If Conn.State=1 Then
			Conn.Close
		End If
		
	End Function
	
	Function CloseRS(RS)
		If RS.State=1 Then
			RS.Close
		End If
		
	End Function
%>
