
Imports System.Drawing
Imports System.Drawing.Drawing2D
Imports System.IO
Partial Class verifycode
    Inherits System.Web.UI.Page
    Sub page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim verifyCode As String = GenerateVerifyCodeString(4)
        Session("verifyCode") = verifyCode
        CreateVerifyCodeImge(verifyCode)
    End Sub
    Private Function GenerateVerifyCodeString(ByVal verifyCodeLength As Integer) As String
        Dim verifyCodeString As String = String.Empty
        Dim randNum As Integer
        Dim chArray() As String = New String() {"2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f", "g", "h", "j", "k", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "A", "B", "C", "D", "E", "F", "G", "H", "J", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"}
        Dim random As Random = New Random()
        For i As Integer = 0 To verifyCodeLength - 1
            randNum = random.Next(chArray.Length)
            verifyCodeString = verifyCodeString + chArray(randNum)
        Next
        GenerateVerifyCodeString = verifyCodeString
        Response.Write(verifyCodeString)
    End Function
    Private Sub CreateVerifyCodeImge(ByVal verifyCode As String)
        If verifyCode Is Nothing Or verifyCode.Trim() = String.Empty Then
            Exit Sub
        End If
        Dim image As Bitmap = New Bitmap(CType(Math.Ceiling(verifyCode.Length * 12.5), Integer), 22)
        Dim g As Graphics = Graphics.FromImage(image)
        Try
            Dim random As Random = New Random()
            g.Clear(Color.White)
            For i As Integer = 0 To 1
                Dim x1 As Integer = random.Next(image.Width)
                Dim x2 As Integer = random.Next(image.Width)
                Dim y1 As Integer = random.Next(image.Height)
                Dim y2 As Integer = random.Next(image.Height)
                g.DrawLine(New Pen(Color.OrangeRed), x1, y1, x2, y2)
            Next
            Dim font As Font = New Font("Arial", 13, (FontStyle.Bold))
            Dim brush As LinearGradientBrush = New LinearGradientBrush(New Rectangle(0, 0, image.Width, image.Height), Color.DarkGreen, Color.DarkOrchid, 1.2F, True)
            g.DrawString(verifyCode, font, brush, 2, 2)
            For i As Integer = 0 To 29
                Dim x As Integer = random.Next(image.Width)
                Dim y As Integer = random.Next(image.Height)
                image.SetPixel(x, y, Color.FromArgb(random.Next()))
            Next
            g.DrawRectangle(New Pen(Color.Silver), 0, 0, image.Width - 1, image.Height - 1)
            Dim ms As MemoryStream = New MemoryStream()
            image.Save(ms, System.Drawing.Imaging.ImageFormat.Gif)
            Response.ClearContent()
            Response.ContentType = "image/Gif"
            Response.BinaryWrite(ms.ToArray())
            Response.End()
        Catch ex As Exception
            g.Dispose()
            image.Dispose()
        End Try

    End Sub
End Class
