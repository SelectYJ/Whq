<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.net.URLDecoder"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="qu" class="Demo.Jdbc"></jsp:useBean>
<%
	String cs=URLDecoder.decode(request.getQueryString(),"utf-8");
	String[] sstr=cs.split("=");
	int i=qu.Updata(sstr[1], sstr[3]);
	if(i==0){
%>
		<h1>更新失败！</h1>
<%
	}else if (i==2){
%>
		<h1>用户名已存在！</h1>
		<jsp:forward page="User.jsp" />
<%
	}else{
%>
		<jsp:forward page="User.jsp" />
<%
	}
%>
</body>
</html>