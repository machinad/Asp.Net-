<%@ Page Language="VB" AutoEventWireup="false" CodeFile="register.aspx.vb" Inherits="register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>用户注册</title>
     <script type="text/javascript">
         function showErrorVerifyCode() {
             alert("验证码输入错误");
             document.getElementById("verilocationcode").focus();
         }
         function registerOK() {
             alert("注册成功，点击跳转");
             window.location.href = "login.aspx";
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
        .auto-style4 {
            width: 90%;
        }
        .auto-style16 {
            width: 105px;
        }
        .auto-style17 {
            height: 24px;
            width: 105px;
        }
        .auto-style18 {
            width: 119px;
        }
        .auto-style19 {
            height: 24px;
            width: 119px;
        }
        .auto-style21 {
            width: 126px;
        }
        .auto-style22 {
            height: 24px;
            width: 126px;
        }
        .auto-style23 {
            width: 119px;
            height: 31px;
        }
        .auto-style24 {
            width: 126px;
            height: 31px;
        }
        .auto-style25 {
            width: 105px;
            height: 31px;
        }
        .auto-style26 {
            width: 94px;
        }
        .auto-style27 {
            height: 24px;
            width: 94px;
        }
        .auto-style28 {
            width: 94px;
            height: 31px;
        }
    </style>
</head>
<body>
     <form id="form1" runat="server" style="background-image: url('imge/login_bg.jpg'); background-repeat: repeat-x; background-position: 0px; position: absolute; top: 0%; width: 100%;">
    <div id="box" style="position: relative; left: 20%">
        <div class="logo" style="background-position: 600px 0px; background-image: url('imge/login_zf.jpg'); background-repeat: no-repeat;">
            <img width="35%" src="imge/logo_school.png" /><img width="15%" src="imge/logo_jw.png" />
        </div>
        <div class="backimge" style="border: 5px double #3366CC; width: 500px; height: 300px; z-index: 5; background-color: #eeeeFF; position: absolute; left: 35%; top:70px;">
            
            <table class="auto-style4" style="position: absolute; left: 20px; line-height: normal; text-align: left; color: #006699; font-style: normal; font-weight: bold; top: 10px;">
                <tr>
                    <td colspan="4" style="font-size: x-large; font-style: normal; text-transform: none; font-variant: normal; text-align: center;">用户注册</td>
                </tr>
                <tr>
                    <td class="auto-style18">用户名：</td>
                    <td class="auto-style21">
                        <asp:TextBox ID="username" runat="server" Width="100px"></asp:TextBox>
                    </td>
                    <td class="auto-style16">
                        <asp:RequiredFieldValidator ID="rfvEmail3" runat="server" ControlToValidate="password" Display="Dynamic" ErrorMessage="请输用户名"></asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style26">
                        <asp:Label ID="Label1" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style19">密 码：</td>
                    <td class="auto-style22">
                        <asp:TextBox ID="password" runat="server" TextMode="Password" Width="100px"></asp:TextBox>
                    </td>
                    <td class="auto-style17">
                        <asp:RequiredFieldValidator ID="rfvEmail2" runat="server" ControlToValidate="password" Display="Dynamic" ErrorMessage="请输入密码"></asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style27"></td>
                </tr>
                <tr>
                    <td class="auto-style19">确认密码：</td>
                    <td class="auto-style22">
                        <asp:TextBox ID="verifypassword" runat="server" TextMode="Password" Width="100px"></asp:TextBox>
                    </td>
                    <td class="auto-style17">
                        <asp:RequiredFieldValidator ID="rfvEmail1" runat="server" ControlToValidate="verifypassword" Display="Dynamic" ErrorMessage="请输入密码"></asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style27">
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="password" ControlToValidate="verifypassword" ErrorMessage="CompareValidator" SetFocusOnError="True" Type="String">密码不相等</asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style18">手机号码：</td>
                    <td class="auto-style21">
                        <asp:TextBox ID="telphone" runat="server" Width="100px"></asp:TextBox>
                    </td>
                    <td class="auto-style16">
                        <asp:RequiredFieldValidator ID="rfvEmail0" runat="server" ControlToValidate="telphone" Display="Dynamic" ErrorMessage="请填写手机号"></asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style26">
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="telphone" Display="Dynamic" ErrorMessage="格式错误" ValidationExpression="^1[358]\d{9}$"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style18">电子邮箱：</td>
                    <td class="auto-style21">
                        <asp:TextBox ID="email" runat="server" Width="100px"></asp:TextBox>
                    </td>
                    <td class="auto-style16">
                        
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="email" Display="Dynamic" ErrorMessage="请填写邮箱"></asp:RequiredFieldValidator>
                        
                    </td>
                    <td class="auto-style26">
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="email" Display="Dynamic" ErrorMessage="格式错误" ValidationExpression="\w+([-+.']\w)*@\w+([-.]\w+)*\.\w+([-.]\w)*"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style18">验证码：</td>
                    <td class="auto-style21">
                        <asp:TextBox ID="verilocationcode" runat="server" Width="50px"></asp:TextBox>
                    </td>
                    <td class="auto-style16">
                        <ContentTemplate>
                                <table>
                                    <tr>
                                        <td><asp:Image ID="imgVerifyCode" runat="server" ImageUrl="~/verifycode.aspx" /></td>
                                        <td><asp:Button ID="btnChangVerifyCode" runat="server" Text="看不清" OnClick="btnChangVerifyCode_Click" ValidationGroup="verifycode" CssClass="btnLook" /></td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                    </td>
                    <td class="auto-style26">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style23">
                        <asp:Label ID="text1" runat="server"></asp:Label>
                    </td>
                    <td class="auto-style24">
                        <asp:Button ID="Button1" runat="server" Text="注册" />
                        <asp:Button ID="Button2" runat="server" Text="重置" CausesValidation="False" />
                    </td>
                    <td class="auto-style25">
                        &nbsp;</td>
                    <td class="auto-style28"></td>
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
