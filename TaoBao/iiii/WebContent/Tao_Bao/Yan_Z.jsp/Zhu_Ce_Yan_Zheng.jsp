<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.cj.xdevapi.PreparableStatement"%>
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
<%!
	String str1=null,p=null;
%>
<%
	request.setCharacterEncoding("UTF-8");
	String name=request.getParameter("user1");
	String pass=request.getParameter("password1");
	//int pass=Integer.parseInt(request.getParameter("password1"));
	//1.加载驱动器
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
	}catch(ClassNotFoundException e){
		out.print("找不到驱动程序类，加载驱动器失败！");
		e.printStackTrace();
	}
	//2.连接数据库
	//协议:子协议:数据源标识
	String url = "jdbc:mysql://localhost:3306/taobao?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";
	String user = "root";
	String password = "123456";
	Connection conn = DriverManager.getConnection(url,user,password);
	//3.访问数据库
	
	String sql1 = "select * from taobaozh where name=?";
	PreparedStatement prepar=conn.prepareStatement(sql1);
	prepar.setString(1,name);
	ResultSet rs1 = prepar.executeQuery();
	while(rs1.next()){
		str1=rs1.getString(1);
		p=rs1.getString(2);
	}
	if(str1==null){
		String sql = "insert into taobaozh values(?,?)";
		PreparedStatement pre=conn.prepareStatement(sql);
		pre.setString(1,name);
		pre.setString(2,pass);
		int n=pre.executeUpdate();//执行更新数据库语句
		//4.执行查询
		if(n==1){
			out.println("注册成功！");
			response.setHeader("refresh","2;URL=Deng_Lu.jsp");
		}
	}else{
		out.println("用户名已存在!");
		response.setHeader("refresh","2;URL=Zhu_Ce.jsp");
		str1=null;
	}
%>
</body>
</html>