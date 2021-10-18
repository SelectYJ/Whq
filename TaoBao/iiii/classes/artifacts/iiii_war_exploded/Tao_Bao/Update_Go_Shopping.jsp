<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.net.URLDecoder"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="qu" class="Demo.count"></jsp:useBean>
<jsp:useBean id="que" class="Demo.Jdbc"></jsp:useBean>
<% 
	String g= que.Quuser();
	String cs=URLDecoder.decode(request.getQueryString(),"utf-8");
	String sst=cs.replaceAll("data=","");
	Set<String> arr0= new HashSet<String>();
	if(sst.length()!=0){
		String[] sstr=sst.split(",");
		String[] ddg=new String[sstr.length/4];
		//out.print(sstr.length/4);
		int k=0,m=0;
		for(int i=0;i<sstr.length;i++){
			//out.print(sstr[i]+"<br>");
			k++;
			if(ddg[m]==null){ddg[m]="";}
			ddg[m]=ddg[m]+sstr[i]+",";
			if(k==4){
				m++;
				k=0;
			}
		}
		for(int i=0;i<ddg.length;i++){
			String s=ddg[i];
			arr0.add(s);
			qu.writ(arr0,g);
		}
	}else{
		qu.writ(arr0,g);
	}
%>
<jsp:forward page="Go_Shopping.jsp" />
</body>
</html>