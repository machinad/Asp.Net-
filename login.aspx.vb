Imports System.Data.SqlClient
Imports System.Data
Partial Class login
    Inherits System.Web.UI.Page

    Private Property verifCode As String

    Protected Sub btnChangVerifyCode_Click(sender As Object, e As EventArgs) Handles btnChangVerifyCode.Click
        imgVerifyCode.ImageUrl = "verifycode.aspx?t=" + System.DateTime.Now.ToString()
    End Sub

    Protected Sub landing_Click(sender As Object, e As EventArgs) Handles landing.Click
        If Session(verifCode) Is Nothing Then
            Dim verifyCode As String = CType(Session("verifyCode"), String)
            If Not verifyCode.ToLower().Equals(verilocationcode.Text.Trim().ToLower()) Then
                ScriptManager.RegisterStartupScript(Me, GetType(login), "showErrorVerifyCode", "javascript:showErrorVerifyCode();", True)
            Else
                Dim cnn As SqlConnection = OpenConnection()
                Dim cmd As SqlCommand = Nothing
                Dim dr As SqlDataReader = Nothing
                Dim sql As String = ""
                sql = "select username from usertable where username='" + username.Text + "' and password='" + userpassword.Text + "'"
                cmd = New SqlCommand(sql, cnn)
                dr = cmd.ExecuteReader()
                If dr.HasRows Then
                    ScriptManager.RegisterStartupScript(Me, GetType(login), "showRegisterSuccess", "javascript:showRegisterSuccess();", True)
                Else
                    ScriptManager.RegisterStartupScript(Me, GetType(login), "login_yes", "javascript:login_yes();", True)
                End If
                dr.Close()
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


    Protected Sub reset_Click(sender As Object, e As EventArgs) Handles reset.Click
        username.Text = ""
        userpassword.Text = ""
        verilocationcode.Text = ""
    End Sub

    Protected Sub register_Click(sender As Object, e As EventArgs) Handles register.Click
        ScriptManager.RegisterStartupScript(Me, GetType(login), "register", "javascript:register();", True)
    End Sub
End Class
