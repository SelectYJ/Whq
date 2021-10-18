<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(function() {
	$('button').click(function(){
		if($('.user').attr('disabled')=="disabled"){
			$('.user').attr('disabled',false);
			$('.pass').attr('disabled',false);
			$('button').html('完成');
			$('.a').hide();
		}else{
			if($('.user').val().length<5){
	        	alert("用户名小于5位");
	        	$('.user').focus();
	            return false;
	        }else if ($('.pass').val() === "") {
	            //TODO 为空判断
	            alert("密码为空!");
	            $('.pass').focus();
	            return false;
	        }
			$('.a').show();
			$('.user').attr('disabled','disabled');
			$('.pass').attr('disabled','disabled');
			$('button').html('编辑');
			$('.a').prop("href", "http://localhost:8080/iiii_war/Tao_Bao/Update_User.jsp?user="+$('.user').val()+"=pass="+$('.pass').val());
		}
	});
	$('.a').click(function(){
		$('.a').hide();
	});
});
</script>
<jsp:useBean id="que" class="Demo.Jdbc"></jsp:useBean>
<body>
	<div>
		个人信息：<button>编辑</button><a class="a" href="" target="main" style="text-decoration: none;margin-left:20px;font-weight: bold;display:none;">保存并上传</a><br><br>
		用户名：<input type="text" class="user" value="<%=que.Quuser() %>" disabled="disabled"/><br><br>
		密&nbsp;&nbsp;&nbsp;&nbsp;码：<input type="text" value="<%=que.Qupass() %>" class="pass" disabled="disabled"/><br><br>
	</div>
</body>
</html>