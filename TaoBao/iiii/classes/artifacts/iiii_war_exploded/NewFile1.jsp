<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<%
	application.setAttribute("we","wee");
	application.setAttribute("we1","wee1");
	String we=(String)application.getAttribute("we");
	String we1=(String)application.getAttribute("we1");
	%>
	we=<%=we %>
	we1=<%=we1 %>
	
    <%
	String user=request.getParameter("name");
	String pass=request.getParameter("pass1");
    %>
	<%if(user!=null&&pass!=null){
		%>
		<jsp:forward page="NewFile2.jsp" >
			<jsp:param name="flag1" value="<%=we %>"/>
			<jsp:param name="flag2" value="<%=we1 %>"/>
		</jsp:forward>
	<%} %>


</body>
</html>