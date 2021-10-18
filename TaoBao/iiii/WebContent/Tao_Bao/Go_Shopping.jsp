<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/Go_Shopping.css" />
</head>
<script src="js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(function() {
	$('.a2').click(function(){
		
		if($('.div3').css('display')=='none'){
			$('.div1').css("height","176px");
			$('.counA').hide();
			$('.div3').show();
			$('.as').hide();
		}else {
			$('.div1').css("height","189px");
			$('.counA').show();
			$('.div3').hide();
			$('.as').show();
		}
		
		if($('.button1').css('display')=='none'){
			$('.button1').show();
			$('.sp').show();
			$('.sc').show();
			$('.a2').html("完成");
			$('.button0').hide();
		}else {
			$('.button1').hide();
			$('.sp').hide();
			$('.sc').hide();
			$('.a2').html("编辑");
			$('.button0').show();
			$.each($('.b1'),function(){
				$(this).html($(this).parents('.ddv0').find('.count').val());
				var jg=$(this).parents('.ddv0').find('.b0').html();
				var sl=$(this).parents('.ddv0').find('.count').val();
				$(this).parents('.ddv0').find('.b2').html((jg*sl).toFixed(1));
			});
			
		}
	});
	$('.button1').click(function(){
		if($('.button1').html()=="全选") {//点击后全选
			$.each($('.inp'),function(){
				$(this).prop('checked',true);
			});
			$('.button1').html("全不选");
		}else{//点击后全不选
			$.each($('.inp'),function(){		
				$(this).prop('checked',false);	
			});
			$('.button1').html("全选");
		}
	});
	
	$('.sc').click(function(){
		$.each($('.inp'),function(index,element){
			if($(this).prop('checked')){
				$(this).parents('.ddv0').remove();
			}
		});
	});
	var coun1 = new Array();
	$('.button0').click(function(){
		$('.button0').hide();
		$.each($('img'),function(index,element){
			var coun0 = new Array();
			coun0[0]=$(this).attr('src');
			coun0[1]=$('.b:eq('+index+')').html();
			coun0[2]=$('.b0:eq('+index+')').html();
			coun0[3]=$('.b1:eq('+index+')').html();
			coun1[index]=coun0;
		});
		//console.log(coun1);
		$(location).prop("href", "http://localhost:8080/iiii_war/Tao_Bao/Update_Go_Shopping.jsp?data="+coun1);
	});
	//console.log($('body').css('width'));
	if($('img').length==0){
		if(parseInt($('body').css('width'))<1200){
			$('.hidebtn').hide();
		}else{
			$('.hidebtn').show();
		}
		$('.div0').hide();
		$('.hidediv').show();
		$('.hidebtn').click(function(){
			$(location).prop("href", "http://localhost:8080/iiii_war/Tao_Bao/Zhu_Ye_Mian.jsp?uaer="+$('.hidebtn').attr('value'));
		});
	}else{
		$('.hidediv').hide();
		$('.hidebtn').hide();
	}
	
})
</script>
<body>
<jsp:useBean id="qu" class="Demo.count"></jsp:useBean>
<jsp:useBean id="que" class="Demo.Jdbc"></jsp:useBean>
<div class="hidediv">
	购物车空空如也
</div>
	<button class="hidebtn" value="<%=session.getAttribute("name") %>=pass=<%=session.getAttribute("pass")%>">返回</button>
<div class="div0">
	<span>
		<a class="a1">购物车</a>
		<button class="button0">保存并上传</button>
		<a class="a2">编辑</a>
		<a class="sc">删除</a>
		<button class="button1">全选</button>
	</span>
</div>
<div class="div">
<% 
	String g= que.Quuser();
	if(request.getQueryString()!=null&&g!=null){
		String cs=URLDecoder.decode(request.getQueryString(),"utf-8");	
		String[] sst=cs.split("=");
		if(sst.length>=4){
			String ddf1=sst[1]+","+sst[3]+","+sst[5]+","+sst[7]+",";
			
			Set<String> arr0= new HashSet<String>();
			arr0=qu.read(g);
			arr0.add(ddf1);
			//out.print("arr0="+arr0+"<br>");
			boolean flge= qu.writ(arr0,g);
		}
	}
	
	String[] st=new String[3];
	Set<String> arr1= new HashSet<String>();
	arr1=qu.read(g);
	Iterator<String> it = arr1.iterator();
	while(it.hasNext()){
		String sop=(String)it.next();
		st=sop.split(",");
%>
<div class="ddv0">
	<div class="div1">
		<img src="<%=st[0]%>"/>
	</div>
	<div class="div2">
		商品名称：<a><b class="b"><%=st[1] %></b></a><br><br>
		商品价格：<a><b class="b0"><%=st[2] %></b></a><br><br>
		<a class="as">商品数量：<b class="b1"><%=st[3] %></b><br><br></a>
		<div class="div3">
		<span style="float: left;margin-top:5px;">商品数量：</span>
				<span id="spanRight">
					<span style="float:left;"><input type="text" value="<%=st[3] %>" class="count" maxlength="3"/></span>
				</span>
		</div>
		<a class="counA">总共价格：<b class="b2"><%=(double)Math.round((Double.parseDouble(st[3])*Double.parseDouble(st[2]))*10)/10 %></b>￥<br><br></a>
		<div>
			<a>查看详情</a>
			<span class="sp">选择<input type="checkbox" class="inp"/></span>
		</div>
	</div>
</div>
<%
	}
%>
</div>
</body>
</html>