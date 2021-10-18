<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="qu" class="Demo.Jdbc"></jsp:useBean>
<%
	boolean sd=qu.Deleuser();
	if(sd){
%>
<jsp:forward page="Deng_Lu.jsp"></jsp:forward>
<%
	}
	else{
%>
	<h1>注销失败</h1>
<%
	}
%>
</body>
</html>