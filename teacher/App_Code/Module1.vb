Imports System.data
Imports System.data.sqlclient


Namespace teacher

    Public Module Module1
        'Public paths As String = "blank.ascx"
        Dim myConnection As New SqlConnection
        Function zuser1(ByVal usr As String, ByVal pwd As String) As Boolean
            myConnection.ConnectionString = ConfigurationManager.AppSettings("ConnectionString")
            Dim sql As String
            myConnection.Close()
            If myConnection.State = ConnectionState.Closed Then myConnection.Open()
            sql = "select U31AA from U31 where U31AA='" & usr & "' and U31BB='" & pwd & "'"
            Dim cmd = New SqlCommand(sql, myConnection)
            Dim dr As SqlDataReader
            dr = cmd.ExecuteReader()
            If dr.Read() Then
                zuser1 = True
            Else
                zuser1 = False
            End If
            dr.Close()
            myConnection.Close()
        End Function

        Public Function AddDun1(ByVal tid As String, ByVal lessid As String, ByVal sid As String, ByVal ltype As Int16, ByVal monoo As String, ByVal dun As String) As Int16
            Dim myCommand As New SqlCommand("DunAdd", myConnection)
            myCommand.CommandType = CommandType.StoredProcedure

            myCommand.Parameters.Add("@sid", SqlDbType.VarChar, 20)
            myCommand.Parameters("@sid").Value = sid

            myCommand.Parameters.Add("@tid", SqlDbType.VarChar, 25)
            myCommand.Parameters("@tid").Value = tid

            myCommand.Parameters.Add("@lessid", SqlDbType.VarChar, 10)
            myCommand.Parameters("@lessid").Value = lessid

            myCommand.Parameters.Add("@ltype", SqlDbType.Int)
            myCommand.Parameters("@ltype").Value = ltype

            myCommand.Parameters.Add("@monoo", SqlDbType.VarChar, 5)
            myCommand.Parameters("@monoo").Value = monoo

            myCommand.Parameters.Add("@dun", SqlDbType.VarChar, 5)
            myCommand.Parameters("@dun").Value = dun

            myCommand.Parameters.Add("@RetValue", SqlDbType.SmallInt)
            myCommand.Parameters("@RetValue").Direction = ParameterDirection.ReturnValue

            If myConnection.State = ConnectionState.Closed Then myConnection.Open()
            myCommand.ExecuteNonQuery()
            AddDun1 = myCommand.Parameters("@RetValue").Value
            myConnection.Close()
        End Function

        Public Function Labadd1(ByVal lessid As String, ByVal dhonog As Int16, ByVal sedev As String, ByVal temdeglel As String, ByVal tcode As String) As String
            Dim myCommand As New SqlCommand("LabAdd", myConnection)
            myCommand.CommandType = CommandType.StoredProcedure

            myCommand.Parameters.Add("@tcode", SqlDbType.VarChar, 25)
            myCommand.Parameters("@tcode").Value = tcode

            myCommand.Parameters.Add("@lcode", SqlDbType.VarChar, 25)
            myCommand.Parameters("@lcode").Value = lessid

            myCommand.Parameters.Add("@temdeglel", SqlDbType.VarChar, 500)
            myCommand.Parameters("@temdeglel").Value = temdeglel

            myCommand.Parameters.Add("@sedev", SqlDbType.VarChar, 500)
            myCommand.Parameters("@sedev").Value = sedev

            myCommand.Parameters.Add("@dhonog", SqlDbType.Int)
            myCommand.Parameters("@dhonog").Value = dhonog

            If myConnection.State = ConnectionState.Closed Then myConnection.Open()
            myCommand.ExecuteNonQuery()
            myConnection.Close()
            Labadd1 = ""
        End Function

        Public Function Seminaradd1(ByVal lessid As String, ByVal dhonog As Int16, ByVal sedev As String, ByVal temdeglel As String, ByVal tcode As String) As String
            Dim myCommand As New SqlCommand("SeminarAdd", myConnection)
            myCommand.CommandType = CommandType.StoredProcedure

            myCommand.Parameters.Add("@tcode", SqlDbType.VarChar, 25)
            myCommand.Parameters("@tcode").Value = tcode

            myCommand.Parameters.Add("@lcode", SqlDbType.VarChar, 25)
            myCommand.Parameters("@lcode").Value = lessid

            myCommand.Parameters.Add("@temdeglel", SqlDbType.VarChar, 500)
            myCommand.Parameters("@temdeglel").Value = temdeglel

            myCommand.Parameters.Add("@sedev", SqlDbType.VarChar, 500)
            myCommand.Parameters("@sedev").Value = sedev

            myCommand.Parameters.Add("@dhonog", SqlDbType.Int)
            myCommand.Parameters("@dhonog").Value = dhonog

            If myConnection.State = ConnectionState.Closed Then myConnection.Open()
            myCommand.ExecuteNonQuery()
            myConnection.Close()
            Seminaradd1 = ""
        End Function

        Public Function Lectureadd1(ByVal lessid As String, ByVal dhonog As Int16, ByVal sedev As String, ByVal temdeglel As String, ByVal tcode As String) As String
            Dim myCommand As New SqlCommand("LectureAdd", myConnection)
            myCommand.CommandType = CommandType.StoredProcedure

            myCommand.Parameters.Add("@tcode", SqlDbType.VarChar, 25)
            myCommand.Parameters("@tcode").Value = tcode

            myCommand.Parameters.Add("@lcode", SqlDbType.VarChar, 25)
            myCommand.Parameters("@lcode").Value = lessid

            myCommand.Parameters.Add("@temdeglel", SqlDbType.VarChar, 500)
            myCommand.Parameters("@temdeglel").Value = temdeglel

            myCommand.Parameters.Add("@sedev", SqlDbType.VarChar, 500)
            myCommand.Parameters("@sedev").Value = sedev

            myCommand.Parameters.Add("@dhonog", SqlDbType.Int)
            myCommand.Parameters("@dhonog").Value = dhonog

            If myConnection.State = ConnectionState.Closed Then myConnection.Open()
            myCommand.ExecuteNonQuery()
            myConnection.Close()
            Lectureadd1 = ""
        End Function

        Public Function Biedaaltadd1(ByVal lessid As String, ByVal dhonog As Int16, ByVal sedev As String, ByVal onoo As String, ByVal tcode As String) As String
            Dim myCommand As New SqlCommand("BiedaaltAdd", myConnection)
            myCommand.CommandType = CommandType.StoredProcedure

            myCommand.Parameters.Add("@tcode", SqlDbType.VarChar, 25)
            myCommand.Parameters("@tcode").Value = tcode

            myCommand.Parameters.Add("@lcode", SqlDbType.VarChar, 25)
            myCommand.Parameters("@lcode").Value = lessid

            myCommand.Parameters.Add("@onoo", SqlDbType.VarChar, 2)
            myCommand.Parameters("@onoo").Value = onoo

            myCommand.Parameters.Add("@sedev", SqlDbType.VarChar, 1500)
            myCommand.Parameters("@sedev").Value = sedev

            myCommand.Parameters.Add("@dhonog", SqlDbType.Int)
            myCommand.Parameters("@dhonog").Value = dhonog

            'myCommand.Parameters.Add("@RetValue", SqlDbType.SmallInt)
            'myCommand.Parameters("@RetValue").Direction = ParameterDirection.ReturnValue

            If myConnection.State = ConnectionState.Closed Then myConnection.Open()
            myCommand.ExecuteNonQuery()
            'AddDun = myCommand.Parameters("@RetValue").Value
            myConnection.Close()
            Biedaaltadd1 = ""
        End Function

        Public Function GetItem1(ByVal strSQL As String) As String
            Dim Retstr As String = ""
            Try
                If myConnection.State = ConnectionState.Closed Then myConnection.Open()
                Dim oCmd As New SqlClient.SqlCommand(strSQL, myConnection)
                Dim oReader As SqlClient.SqlDataReader
                oReader = oCmd.ExecuteReader
                While oReader.Read()
                    Retstr = oReader.Item(0)
                End While
                oReader.Close()
                myConnection.Close()
            Catch e As Exception
            Finally
                GetItem1 = Retstr
            End Try
        End Function
    End Module

End Namespace
