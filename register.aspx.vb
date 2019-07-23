Imports System.Data.SqlClient
Imports System.Data
Partial Class register
    Inherits System.Web.UI.Page

    Private Property verifCode As String

    Protected Sub btnChangVerifyCode_Click(sender As Object, e As EventArgs) Handles btnChangVerifyCode.Click
        imgVerifyCode.ImageUrl = "verifycode.aspx?t=" + System.DateTime.Now.ToString()
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        If Session(verifCode) Is Nothing Then
            Dim verifyCode As String = CType(Session("verifyCode"), String)
            If Not verifyCode.ToLower().Equals(verilocationcode.Text.Trim().ToLower()) Then
                ScriptManager.RegisterStartupScript(Me, GetType(Login), "showErrorVerifyCode", "javascript:showErrorVerifyCode();", True)
            Else
                Dim cnn As SqlConnection = OpenConnection()
                Dim cmd As SqlCommand = Nothing
                Dim dr As SqlDataReader = Nothing
                Dim sql As String = ""
                sql = "select username from usertable where username='" + username.Text + "'"
                cmd = New SqlCommand(sql, cnn)
                dr = cmd.ExecuteReader()
                If dr.HasRows Then
                    Label1.Text = "用户名已经存在"
                    password.Text = ""
                    verifypassword.Text = ""
                    telphone.Text = ""
                    email.Text = ""
                    verilocationcode.Text = ""
                    Exit Sub
                End If
                dr.Close()
                sql = "insert into usertable(username,password,telphone,email)values('" + username.Text + "','" + password.Text + "','" + telphone.Text + "','" + email.Text + "')"
                cmd = New SqlCommand(sql, cnn)
                cmd.ExecuteNonQuery()
                ScriptManager.RegisterStartupScript(Me, GetType(Login), "registerOK", "javascript:registerOK();", True)
            End If
        End If
    End Sub
    Function OpenConnection() As SqlConnection
        Dim cnn As SqlConnection = Nothing
        Try
            Dim connString As String = "data source=(LocalDB)\v11.0;AttachDbFilename=D:\Webtest2019\database\scwxzyxy.mdf;Integrated Security=True;initial catalog=scwxzyxy;user id=scwxzyxymin;password=123456789"
            cnn = New SqlConnection(connString)
            cnn.Open()
            text1.Text = "成功"
        Catch ex As Exception
            Console.WriteLine(ex.Message)
            text1.Text = "错误"
        End Try
        OpenConnection = cnn
    End Function

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        username.Text = ""
        password.Text = ""
        verifypassword.Text = ""
        telphone.Text = ""
        email.Text = ""
        verilocationcode.Text = ""
    End Sub
End Class
