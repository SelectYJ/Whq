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
	var test=location.href;
	//console.log(test);
	//var str=test.substr(1);
	//var strs= new Array();
	//var strs=str.split("=");
	//$('.user').attr("href","User.jsp?user="+decodeURI(strs[1])+"=pass="+decodeURI(strs[3]));
});
</script>
<style>
*{
	margin: 0px;
	padding: 0px;
}
	li{
		width: 200px;
		margin-top: 20px;
		background-color: #3CB371;
		text-align: center;
		height: 30px;
	}
	a{
		text-decoration: none;
		color: #ffffff;
		font-size: 20px;
	}
</style>
<body style="background-color: #4876FF;">
	<ul style="list-style: none;">
		<li><a href="User.jsp" target="main" class="user">我&nbsp;&nbsp;&nbsp;&nbsp;的&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;信&nbsp;&nbsp;&nbsp;&nbsp;息</a></li>
		<li><a href="Go_Shopping.jsp" target="main">我&nbsp;&nbsp;&nbsp;的&nbsp;&nbsp;&nbsp;购&nbsp;&nbsp;&nbsp;物&nbsp;&nbsp;&nbsp;车</a></li>
	</ul>
</body>
</html>