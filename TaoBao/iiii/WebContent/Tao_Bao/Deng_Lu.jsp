<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/Deng_Lu.css" />
</head>
<body>
<div class="div">
	<div class="div1">
	<form name="Log" method="get">
		<table>
			<tr>
				<td colspan="2"><div  class="tb">密码登录</div></td>
			</tr>
			<tr>
				<td width="20px"><img src="img/briefcase.png"/></td>
				<td><input type="text" name="user" title="请输入用户名" placeholder="请输入用户名" class="input0" id="userInput"/></td>
			</tr>
			<tr>
				<td colspan="2"><input type="text" name="fuser" id="fanhui" disabled="disabled" class="u1"/></td>
			</tr>
			<tr>
				<td width="20px"><img src="img/briefcase.png"/></td>
				<td><input type="password" name="password" title="请输入密码" placeholder="请输入密码" class="input0"  id="passInput"/></td>
			</tr>
			<tr>
				<td colspan="2"><input type="text" name="fpass" id="fanhui" disabled="disabled" class="pas1"/></td>
			</tr>
			<tr>
				<td colspan="2" align="center" height="60px">
				<input type="button" value="登录" class="input1" id="sign_in"/>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right">
				<input type="button" class="a0" value="退出" onclick="window.close();" />
				<a class="a1" href="Zhu_Ce.jsp">免费注册</a>
				</td>
			</tr>
		</table>
	</form>
	</div>
</div>
<script src="js/jquery-3.5.1.min.js"></script>
<script>
$(function () {
    let $user = $("#userInput");
    let $pass = $("#passInput");
    let $signIn = $("#sign_in");
    $signIn.click(function () {
        let $rrt=$('#userInput').is(":focus");
        let $rrt1=$('#passInput').is(":focus");
        if ($user.val() === "") {
            //TODO 为空判断
            $('.u1').show();
            $('.pas1').val('');
            $('.u1').val('用户名为空!');
            $('#userInput').focus();
            return false;
        }else if($pass.val() === ""){
            $('.pas1').show();
            $('.u1').val('');
            $('.pas1').val('密码为空!');
            $('#passInput').focus();
            return false;
        }
        if($rrt||$rrt1){
        	$('.pas1').val('');
            $('.u1').val('');
        }
        $.ajax({
            url: "http://localhost:8080/iiii_war/CServlet",
            type: "post",
            data: {
                user: $user.val(),
                pass: $pass.val()
            },
            dataType: "json",
            success: function (data) {
                // console.log(data);
                if (data) {
                    //TODO 登录成功
                    $(location).prop("href", "http://localhost:8080/iiii_war/Tao_Bao/Zhu_Ye_Mian.jsp?user="+$user.val()+"=pass="+$pass.val());
                } else {
                    //TODO 登录失败, 用户名或密码错误!
                    alert("用户名或密码错误!");
                    $('.pas1').val('');
                    $('.u1').val('');
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
<jsp:useBean id="up" class="Demo.Jdbc"></jsp:useBean>
<%
	up.UpQuuter();
%>
</body>
</html>