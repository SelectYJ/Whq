<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/Shang_Pin_Jie_Shao.css" />
</head>
<script src="js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(function() {
	var test=location.search;
	var str=test.substr(1);
	var strs= new Array();
	var strs=str.split("=");
	var strs1=strs[1].split(",");
	$('img').attr("src",decodeURI(strs1[0]));
	$('.jg').html(decodeURI(strs1[5]));
	$('.yhj').html(decodeURI(strs1[3]));
	$('.jgmin').html(decodeURI(strs1[4]));
	$('h1').html(decodeURI(strs1[2]));
	
	$('#sTop').click(function(){
		var i=parseInt($('.count').val());
		if(i<999) $('.count').val(i+1);
	});
	$('#sBom').click(function(){
		var i=parseInt($('.count').val());
		if(i>1) $('.count').val(i-1);
	});
	$(document).ready(function(){
		$('.inB:eq(0)').click(function(){
			if($('.jj').attr('value')!="null"){
				$('.inB:eq(0)').attr("href","Go_Shopping.jsp?img="+decodeURI(strs1[0])+"=name="+decodeURI(strs1[2])+"=jiage="+decodeURI(strs1[4])+"=shuliang="+$('.count').val());
			}else{
				if(confirm('请先登录！')){
					$('.inB:eq(0)').attr("href","Deng_Lu.jsp");
				}
			}
		});
	});
})
</script>
<body>
	<div class="wdiv">
		<div class="div">
			<img />
			<h1></h1>
		</div>
		<div class="div1">
			<div class="line"  id="f">
				<span class="spanLeft">价格
				<span class="jg" id="spanRight"></span>
				</span>
			</div>
			<div class="line">
				<span class="spanLeft">优惠价
				<span class="jgmin" id="spanRight"></span>
				</span>
			</div>
			<div class="line">
				<span class="spanLeft">地址
				<span id="spanRight">
					<select>
						<option>江西省</option>
						<option>安徽省</option>
					</select>
					<select>
						<option>九江市</option>
						<option>新余市</option>
					</select>
					<select>
						<option>濂溪区</option>
						<option>九江市</option>
					</select>
				</span>
				</span>
			</div>
			<div class="line">
				<span class="spanLeft">优惠卷
				<span class="yhj" id="spanRight"></span>
				</span>
			</div>
			<div class="line">
				<span class="spanLeft">数量
				<span id="spanRight">
					<span style="float:left;"><input type="text" value="1" class="count" maxlength="3"/></span>
					<span style="float:left;margin-top:10px;">
						<span class="sTop" id="sTop">ˆ</span>
                		<span class="sTop" id="sBom" style="margin-top:5px;">ˇ</span>
					</span>
				</span>
				</span>
			</div>
			<table>
				<tr height="120px">
					<td><a class="inB" href="#">加入购物车</a></td>
					<td><a class="inB">购买</a></td>
				</tr>
			</table>
		</div>
	</div>
	<jsp:useBean id="qew" class="Demo.Jdbc"></jsp:useBean>
<%
String s=qew.Quuser();
%>
	<input class="jj" type="text" value="<%=s %>" style="display: none;"/>
</body>
</html>