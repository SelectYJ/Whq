<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<style>
		*{
			font-size: 18px;
		}
		.tb{
		    color: red;
			padding: 2px;
			width: 75px;
			text-align: left;
			margin-top: 30px;
			margin-bottom: 15px;
			border-bottom: red 3px solid;
		}
		.div{
			background-image: url(img/bg.png);
			width: 100%;
			height: 560px;
			margin-top: 30px;
			padding-top: 100px;
		}
		.div1{
			padding-left:20px;
			background-color: #e5e5e5;
			margin-left: 947px;
			margin-top: 20px;
			width: 330px;
			height: 344px;
		}
		.input0{
			height: 35px;
			font-size: 18px;
			border:#000000;
			width: 260px;
		}
		.input1{
			width: 100%;
			height: 40px;
			margin-right: 50px;
			background-color:#ff0000;
			border:#000000;
			color: #ffffff;
		}
		.a0{
			color: #747474;
			background-color: #e5e5e5;
			text-align: left;
			font-size: 14px;
			margin-right: 210px;
			border:#e5e5e5;
		}
		.a1{
			text-decoration: none;
			color: #747474;
			text-align: right;
			font-size: 14px;
		}
	</style>
<body>
<div class="div">
	<div class="div1">
	<form name="Log">
		<table>
			<tr>
				<td colspan="2"><div  class="tb">密码登录</div></td>
			</tr>
			<tr height="70px">
				<td width="20px"><img src="Tao_Bao/img/briefcase.png"/></td>
				<td><input type="text" name="user" title="请输入用户名" placeholder="请输入用户名" class="input0" id="userInput"/></td>
			</tr>
			<tr height="70px">
				<td width="20px"><img src="Tao_Bao/img/briefcase.png"/></td>
				<td><input type="password" name="password" title="请输入密码" placeholder="请输入密码" class="input0" id="passInput"/></td>
			</tr>
			<tr height="80px">
				<td colspan="2" align="center">
				<input type="button" value="登录" class="input1" id="sign_in" />
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right">
				<input type="button" class="a0" value="退出" onclick="window.close();" />
				<a class="a1" href="Tao_Bao/Zhu_Ce.jsp">免费注册</a>
				</td>
			</tr>
		</table>
	</form>
	</div>
</div>
<script src="JS/jquery-3.5.1.min.js"></script>
<script>
$(function () {
    let $user = $("#userInput");
    let $pass = $("#passInput");
    let $signIn = $("#sign_in");
    $signIn.click(function () {
        if ($user.val() === "" || $pass.val() === "") {
            //TODO 为空判断
            alert("用户名或密码为空!");
            return false;
        }
        $.ajax({
            url: "http://localhost:8080/iiii/CServlet",
            type: "post",
            data: {
                user: $user.val(),
                pass: $pass.val()
            },
            dataType: "json",
            success: function (data) {
                console.log(data);
                if (data) {
                    //todo 登录成功
                    $(location).prop("href", "http://localhost:8080/iiii/Tao_Bao/Zhu_Ye_Mian.jsp");
                } else {
                    //todo 登录失败, 用户名或密码错误!
                    alert("用户名或密码错误!");
                }
            },
            error: function () {
                //TODO 请求失败时执行
                alert("无法连接服务器!");
            },
        });
    });
});
</script>
</body>
</html>