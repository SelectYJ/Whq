<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
*{
	margin: 0px;
	padding: 0px;
}
</style>
<frameset cols="115,*,115" border="0">
	<frameset></frameset>
	<frameset rows="100,*,100">
		<frame src="../Tao_Bao/img/bg.png" scrolling="no"><!-- scrolling滚动条属性 -->
		<frameset cols="200,*">
			<frame src="left.jsp" scrolling="no" class="user">
			<frame src="right.jsp" scrolling="auto" name="main">
		</frameset>
		<frameset></frameset>
	</frameset>
	<frameset></frameset>
</frameset>
</html>