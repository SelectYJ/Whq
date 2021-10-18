<%@page import="java.sql.PreparedStatement"%>
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
<%!
	String str1=null,p=null;
%>
<%
	String name=request.getParameter("user");
	String pass=request.getParameter("password");

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
	//查询数据表中的数据并进行判断是否有数据
	Statement stmt = conn.createStatement();
	String sql = "select * from taobaozh";
	ResultSet rs=stmt.executeQuery(sql);
	int i=0;
	while(rs.next()){
		i++;
	}
	if(i==0){
		out.println("请先注册再登录！");
		response.setHeader("refresh","1;URL=Deng_Lu.jsp");
	}
	//查询数据表中的数据并进行判断有没有这个账号
	String sql1 = "select * from taobaozh where name=?";
	PreparedStatement prepar=conn.prepareStatement(sql1);
	prepar.setString(1,name);
	ResultSet rs1 = prepar.executeQuery();
	while(rs1.next()){
		str1=rs1.getString(1);
		p=rs1.getString(2);
	}
	if(str1==null){
		out.print("用户名"+name+"不存在!请重新填写!或注册后再登录");
		response.setHeader("refresh","0.1;URL=Deng_Lu.jsp");
	}else{
		if(!p.equals(pass)){
			out.print("密码错误！");
			response.setHeader("refresh","0.1;URL=Deng_Lu.jsp");
		}else{
			out.print("登录中，请等待......");
			response.setHeader("refresh","0.2;URL=Zhu_Ye_Mian.jsp");
			str1=null;
		}
	}
%>
</body>
</html>