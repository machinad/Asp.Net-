<%@ Page Language="VB" AutoEventWireup="false" CodeFile="login.aspx.vb" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>用户登录</title>
    <script type="text/javascript">
        function showErrorVerifyCode() {
            alert("验证码输入错误");
            document.getElementById("verilocationcode").focus();
        }
        function showRegisterSuccess() {
            alert("账号登录成功！");
            window.close();
        }
        function login_yes() {
            alert("账号或密码错误");
        }
        function register() {
            window.location.href = "register.aspx";
        }
    </script>
    <style type="text/css">
        #forml{
            width:100%;
            height:100px;
            margin-top:0px;
        }
        #box{
            margin-top:30px;
            width:60%;
        }
        .loginbox {
            width: 100%;
            height:200px;
            background-color: #099;
            margin:0px;
        }
        .auto-style1 {
            width: 91%;
            border: 0px solid #000000;
        }
        .auto-style2 {
            width: 98px;
        }
        .auto-style3 {
            width: 100px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" style="background-image: url('imge/login_bg.jpg'); background-repeat: repeat-x; background-position: 0px; position: absolute; top: 0%; width: 100%;">
    <div id="box" style="position: relative; left: 20%">
        <div class="logo" style="background-position: 600px 0px; background-image: url('imge/login_zf.jpg'); background-repeat: no-repeat;">
            <img width="35%" src="imge/logo_school.png" /><img width="15%" src="imge/logo_jw.png" />
        </div>
        <div class="backimge" style="border: 5px double #3366CC; background-position: -18px -17px; width: 400px; height: 260px; z-index: 5; background-color: #00FFFF; position: absolute; left: 45%; top:70px; background-image: url('imge/login_right.jpg'); background-repeat: no-repeat;">
            <br />
            <br />
            <br />
            <table class="auto-style1" style="position: absolute; left: 20px; line-height: normal; text-align: left; color: #006699; font-style: normal; font-weight: bold; top: 58px;">
                <tr>
                    <td class="auto-style2">用 户：</td>
                    <td colspan="3">
                        <asp:TextBox ID="username" runat="server" Width="100px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="username" ErrorMessage="用户名不能为空"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">密 码：</td>
                    <td colspan="3">
                        <asp:TextBox ID="userpassword" runat="server" Width="100px" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="userpassword" ErrorMessage="密码不能为空"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">验证码：</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="verilocationcode" runat="server" Width="50px"></asp:TextBox>
                    </td>
                    <td>
                            <ContentTemplate>
                                <table>
                                    <tr>
                                        <td><asp:Image ID="imgVerifyCode" runat="server" ImageUrl="~/verifycode.aspx" /></td>
                                        <td><asp:Button ID="btnChangVerifyCode" runat="server" Text="看不清" OnClick="btnChangVerifyCode_Click" ValidationGroup="verifycode" CssClass="btnLook" /></td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="text1" runat="server"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:Button ID="landing" runat="server" Text="登陆" />
                        <asp:Button ID="reset" runat="server" Text="重置" CausesValidation="False" />
                    </td>
                    <td>
                        <asp:Button ID="register" runat="server" Text="注册" CausesValidation="False" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>

        </div>
        <div class="loginbox" style="background-position: -46px -48px; border-style: double; border-width: inherit; border-color: #6600FF; position: absolute; top: 100px; background-image: url('imge/login_left.jpg'); background-repeat: repeat-x;">
            <img src="imge/login_pic.png" height="100%" />
        </div>
    </div>
    </form>
</body>
</html>
