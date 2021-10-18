<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
forward=<br><%
	String we=(String)application.getAttribute("we");
	String we1=(String)application.getAttribute("we1");
	%>
	we=<%=we %>
	we1=<%=we1 %>
	
	<br><a href="NewFile3.jsp">a</a>


</body>
</html>