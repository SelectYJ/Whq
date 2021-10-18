<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	//1.加载驱动器
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
	}catch(ClassNotFoundException e){
		out.print("找不到驱动程序类，加载驱动器失败！");
		e.printStackTrace();
	}
	//2.连接数据库
	//协议:子协议:数据源标识
	String url = "jdbc:mysql://localhost:3306/stumis?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";
	String user = "root";
	String password = "123456";
	Connection conn = DriverManager.getConnection(url,user,password);
	//3.访问数据库
	Statement stmt = conn.createStatement();
	String sql = "select * from score";
	ResultSet rs=stmt.executeQuery(sql);
	//4.执行查询
%>
	<table border="1">
		<tr>
			<th>stuid</th>
			<th>cid</th>
			<th>score</th>
		</tr>
		<%
			while(rs.next()){
		%>
				<tr>
				<td><%out.print(rs.getString(1));%></td>
				<td><%out.print(rs.getString(2));%></td>
				<td><%out.print(rs.getString(3));%></td>
				</tr>
		<%
			}
		%>
	</table>
</body>
</html>