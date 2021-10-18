<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>

	<h1>sessionID:<%=session.getId() %></h1>
    <h1>长度：<%=session.getId().length() %></h1>
    <%
    	if(session.isNew()){ 
    %>
    	<h1>欢迎您访问本页面</h1>
    <% 
    	}else{
    %>
    	<h1>您已登录过！</h1>
    <%
    	}
    %>
</body>

</body>
</html>