<%@page import="org.apache.catalina.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/Zhu_Ce.css" />
</head>
<script src="js/jquery-3.5.1.min.js"></script>
<body>
<div class="div">
	<div class="div1">
		<form name="Log">
			<table>
				<tr>
					<td colspan="2"><div  class="tb">用户注册</div></td>
				</tr>
				<tr height="60px">
					<td><img src="img/briefcase.png"/></td>
					<td><input type="text" name="user1" id="name" title="请输入用户名" placeholder="请输入用户名" maxlength="10" /></td>
				</tr>
				<tr height="60px">
					<td><img src="img/briefcase.png"/></td>
					<td><input type="password" name="password1" id="password1" placeholder="请输入密码"  title="请输入密码" /></td>
				</tr>
				<tr height="60px">
					<td><img src="img/briefcase.png"/></td>
					<td><input type="password" name="password11" id="password11" placeholder="请输入确认密码"  title="请输入确认密码" /></td>
				</tr>
				<tr height="60px">
					<td colspan="2" align="center">
						<input type="reset" value="重置" class="finl" />
					 	<!-- <input type="button" value="完成注册" class="finl" id="ysign_in" onclick="return check1()"/> -->
					 	<input type="button" value="完成注册" class="finl" id="ysign_in"/>
					 </td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<a href="Deng_Lu.jsp">返回</a>
					 </td>
				</tr>
			</table>
		</form>
	</div>
</div>
<script src="js/jquery-3.5.1.min.js"></script>
<script>
$(function () {
    let $zuser = $("#name");
    let $zpass = $("#password1");
    let $qpass = $("#password11");
    let $signIn = $("#ysign_in");
    $signIn.click(function () {
    	if($zuser.val().length<5){
        	alert("用户名小于5位");
        	$zuser.focus();
            return false;
        }else if ($zpass.val() === "") {
            //TODO 为空判断
            alert("密码为空!");
        	$zpass.focus();
            return false;
        }else if ($qpass.val() === "") {
            //TODO 为空判断
            alert("确认密码为空!");
        	$qpass.focus();
            return false;
        }else if($zpass.val()!=$qpass.val()){
        	//TODO 确认密码和密码判断
        	alert("确认密码与密码不相等");
        	$qpass.focus();
            return false;
        }
        $.ajax({
            url: "http://localhost:8080/iiii_war/ZcServlet",
            type: "post",
            data: {
                zuser: $zuser.val(),
                zpass: $zpass.val()
            },
            dataType: "json",
            success: function (data) {
                console.log(data);
                if (data) {
                    //todo 注册成功
                    $(location).prop("href", "http://localhost:8080/iiii_war/Tao_Bao/Deng_Lu.jsp");
                } else {
                    //todo 登录失败, 用户名或密码错误!
                    alert("用户名已存在!");
                	$zuser.focus();
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
<script type="text/javascript">
/*function check1(){
	if(document.Log.user1.value==""){
		alert("请输入用户名!");
		document.Log.user1.focus();
		return false;
	}
}*/
</script>
</body>
</html>