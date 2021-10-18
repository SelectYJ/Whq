<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.net.URLDecoder"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/new_file.css" />
</head>
<script src="js/jquery-3.5.1.min.js"></script>
	<script>
	var imG=[
		["img/dibu.jpg","天猫","蓝牙耳机真无线双耳适","10","29.9","39.9","创致伟业电器专营店","3.52万"],
		["img/mm1.gif","淘宝","儿童韩版凉鞋2021夏季新款女童甜美蝴蝶结罗马鞋小女孩魔术贴单鞋","10.5","33.9","49.9","创致伟业电器专营店","125"],
		["img/mm2.gif","淘宝","蓝牙耳机真无线双耳适","110","19.9","39.9","创致伟业电器专营店","3.52"],
		["img/mm3.gif","天猫","蓝牙耳机真无线双耳适","120","29.9","39.9","创致伟业电器专营店","3.52"],
		["img/mm4.jpg","淘宝","蓝牙耳机真无线双耳适","130","39.9","39.9","创致伟业电器专营店","3.52"],
		["img/mm5.gif","天猫","蓝牙耳机真无线双耳适","140","49.9","39.9","创致伟业电器专营店","3.52"],
		["img/mm6.gif","淘宝","蓝牙耳机真无线双耳适","10","59.9","39.9","创致伟业电器专营店","3.52"],
		["img/dibu.jpg","天猫","蓝牙耳机真无线双耳适","1t0","69.9","39.9","创致伟业电器专营店","3.52"],
		["img/dibu.jpg","淘宝","蓝牙耳机真无线双耳适","10","49.9","39.9","创致伟业电器专营店","3.52"],
		["img/dibu.jpg","天猫","蓝牙耳机真无线双耳适","10","25.9","39.9","创致伟业电器专营店","3.52"],
		["img/dibu.jpg","淘宝","蓝牙耳机真无线双耳适","10","25.9","39.9","创致伟业电器专营店","3.52"],
		["img/dibu.jpg","淘宝","蓝牙耳机真无线双耳适","1t0","24.9","39.9","创致伟业电器专营店","3.52"],
		["img/dibu.jpg","天猫","蓝牙耳机真无线双耳适","10","46.9","39.9","创致伟业电器专营店","3.52"],
		["img/dibu.jpg","淘宝","蓝牙耳机真无线双耳适","10","43.9","39.9","创致伟业电器专营店","3.52"],
		["img/dibu.jpg","天猫","蓝牙耳机真无线双耳适","1g0","23.9","39.9","创致伟业电器专营店","3.52"],
		["img/mm7.png","天猫","蓝牙耳机真无线双耳适","10","29.9","39.9","创致伟业电器专营店","3.52"],
		["img/dibu.jpg","淘宝","蓝牙耳机真无线双耳适","10","29.9","39.9","创致伟业电器专营店","3.52"],
		["img/dibu.jpg","天猫","蓝牙耳机真无线双耳适","1g0","29.9","39.9","创致伟业电器专营店","3.52"],
		["img/tu1.jpg","淘宝","蓝牙耳机真无线双耳适","10","29.9","39.9","创致伟业电器专营店","3.52"],
		["img/tu2.jpg","天猫","蓝牙耳机真无线双耳适","10","29.9","39.9","创致伟业电器专营店","3.52"],
		["img/dibu.jpg","天猫","蓝牙耳机真无线双耳适","1h0","29.9","39.9","创致伟业电器专营店","3.52"],
		["img/dibu.jpg","淘宝","蓝牙耳机真无线双耳适","10","29.9","39.9","创致伟业电器专营店","3.52"],
		["img/tu3.jpg","淘宝","蓝牙耳机真无线双耳适","10","29.9","39.9","创致伟业电器专营店","3.52"],
		["img/dibu.jpg","天猫","蓝牙耳机真无线双耳适","1b0","29.9","39.9","创致伟业电器专营店","3.52"],
		["img/dibu.jpg","淘宝","蓝牙耳机真无线双耳适","10","29.9","39.9","创致伟业电器专营店","3.52"],
		["img/dibu.jpg","天猫","蓝牙耳机真无线双耳适","1yu0","29.9","39.9","创致伟业电器专营店","3.52"],
		["img/dibu.jpg","淘宝","蓝牙耳机真无线双耳适","10","29.9","39.9","创致伟业电器专营店","3.52"],
		["img/dibu.jpg","淘宝","蓝牙耳机真无线双耳适","10","29.9","39.9","创致伟业电器专营店","3.52"],
		["img/dibu.jpg","天猫","蓝牙耳机真无线双耳适","10","29.9","39.9","创致伟业电器专营店","3.52"],
		["img/dibu.jpg","淘宝","蓝牙耳机真无线双耳适","10","29.9","39.9","创致伟业电器专营店","3.52"],
		["img/ww.jpg","天猫","蓝牙耳机真无线双耳适","10","29.9","39.9","创致伟业电器专营店","3.52"],
		["img/ww1.jpg","天猫","蓝牙耳机真无线双耳适","10","29.9","39.9","创致伟业电器专营店","3.52"],
		["img/ww2.jpg","淘宝","蓝牙耳机真无线双耳适","10","29.9","39.9","创致伟业电器专营店","3.52"],
		["img/ww3.jpg","天猫","蓝牙耳机真无线双耳适","10","29.9","39.9","创致伟业电器专营店","3.52"],
		["img/tu6.jpg","淘宝","蓝牙耳机真无线双耳适","10","29.9","39.9","创致伟业电器专营店","3.52"]
		];
		$(function() {
			console.log($('#user').html())
			if($('#user').html()!=""){
				// $('#user').prop("href", "http://localhost:8080/iiii_war/Tao_Bao/Zhu_Ce.jsp");
				$('#a3').hide();
			}
			var i = 0;
			var timer = null;
			$('.banner>.img').append($('.banner li').eq(0).clone());
			$('.banner').mouseenter(function() {
				$('.btn').show();
				clearInterval(timer);
			}).mouseleave(function() {
				$('.btn').hide();
				timer = setInterval(function() {
					$('.banner .next').trigger('click');
				}, 3000);
			}).trigger('mouseleave');
			$('.banner>.tab>li').click(function() {
				i = $(this).index();
				$('.banner>.tab>li').eq(i).addClass('active').siblings('li').removeClass('active');
				$('.banner>.img').animate({
					left: -i * 518
				}, 300);
			})
			$('.btn>.next').click(function() {
				i++;
				if (i >= $('.banner>.img li').length - 1) {
					i = 0;
					$('.banner>.img').css('left', '0px').stop();
				} else {
					$('.banner>.img').animate({
						left: '-=518'
					}, 300)
				}
				$('.banner>.tab>li').eq(i).addClass('active')
					.siblings('li').removeClass('active');
			})
			$('.btn>.prev').click(function() {
				i--;
				if (i < 0) {
					$('.banner>.img').css('left', '-3540px').stop();
					i = 5;
				}
				$('.banner>.img').animate({
					left: '+=518'
				}, 300)
				$('.banner>.tab>li').eq(i).addClass('active')
					.siblings('li').removeClass('active');
			})
			$('.aa1,.li1-div').mouseenter(function() {
				$('.li1-div').show();
				$('.aa1').css({
					"background-color":"white",
					"color":"red",
					});
			}).mouseleave(function() {
				$('.li1-div').hide();
				$('.aa1').css({
					"background-color":"gainsboro",
					"color":"gray",
					});
			})
			
			$('#span0,.sS').mouseenter(function() {
				$('.sS').show();
			}).mouseleave(function() {
				$('.sS').hide();
			})
			$('.sS li').mouseenter(function() {
				$(this).css('background','#a6a6a6');
				$(this).css('cursor','pointer');
			}).mouseleave(function() {
				$(this).css('background','#ffffff');
				$(this).css('cursor','pointer');
			})
			
			$('.Rred').mouseenter(function() {
				$(this).css("color","red");
			}).mouseleave(function() {
				$(this).css("color","gray");
			})
			$('.Rred1,.li1-div1').mouseenter(function() {
				$('.Rred1').css({"color":"red","background":"white","border-bottom":"solid 10px gainsboro"});
				$('.li1-div1').show();
			}).mouseleave(function() {
				$('.Rred1').css({"color":"gray","background-color":"gainsboro","border-bottom":"0"});
				$('.li1-div1').hide();
			})
			$('.li1-div1 a:not(:nth-child(1))').mouseenter(function() {
				$(this).css("background-color","#ff0000")
			}).mouseleave(function() {
				$(this).css("background-color","white")
			})
			
			var ss=0;
			timer1 = setInterval(function() {
				if($(document).height()-$(document).scrollTop()<850&&$(document).height()<=3000){
					if(ss<35){
						for(var i=ss;i<ss+5;i++){
							var $fdfd="<li class='like2li' onclick='return onck("+i+")'><img src='"+imG[i][0]+"'/><div><div><a class='like2lia1'>"+imG[i][1]+"</a><a class='wenB'>&nbsp;&nbsp;"+imG[i][2]+"</a></div><div><a class='like2lia2'>卷|"+imG[i][3]+"元</a></div><div><a class='like2lia3'>￥"+imG[i][4]+"</a><a class='like2lia4'>￥"+imG[i][5]+"</a></div><div><a style='font-size: 12px;'>"+imG[i][6]+"</a></div><hr style='color: #DCDCDC;margin: 5px 0px 5px 0px;' size='1'/><div><div class='juhuas'>聚划算</div><a class='juhuas-a'>月销 "+imG[i][7]+"</a></div></div></li>";
							$('.like ul').append($fdfd);
						}
						ss=ss+5;
					}
				}
				$('.like2li').mouseover(function() {
					$(this).css("border","solid 0.1px #ff0000");
					$(this).css('cursor','pointer');
				}).mouseout(function() {
					$(this).css("border","solid 0.1px #ebebeb");
					$(this).css('cursor','default');
				})
			}, 300);
			
			var $fdfd1="<div id='dd'><div class='XiangBao'><img src='./img/briefcase.png' style='width: 20px;height: 20px;'/><a>箱包</a></div><div style='margin-left: 55px;font-size: 12px;'><a style='float: left;color: #9a9a9a;'>双肩背包&nbsp;&nbsp;</a><a style='float: left;color: red;'>zrar&nbsp;&nbsp;</a><a style='float: left;color: #9a9a9a;'>电脑包&nbsp;&nbsp;</a><a style='float: left;color: #9a9a9a;'>背包&nbsp;&nbsp;</a></br><a style='float: left;color: #9a9a9a;margin-top: 10px;'>斐乐&nbsp;&nbsp;</a><a style='float: left;color: #9a9a9a;margin-top: 10px;'>行李箱&nbsp;&nbsp;</a><a style='float: left;color: #9a9a9a;margin-top: 10px;'>卡套&nbsp;&nbsp;</a><a style='float: left;color: #9a9a9a;margin-top: 10px;'>腰包</a></div></div>";
			for(var i=0;i<7;i++){
				$('#div3').append($fdfd1);
			}
			
			var $daohang="<div><a class='li1-div1-1'>主题市场</a><ul><li class='li1-div1-2'><a href='#'>主题</a></li><li class='li1-div1-2'><a href='#'>主题</a></li><li class='li1-div1-2'><a href='#'>主题</a></li><li class='li1-div1-2'><a href='#'>主题</a></li><li class='li1-div1-2'><a href='#'>主题</a></li><li class='li1-div1-2'><a href='#'>主题</a></li></ul></div>";
			for(var i=0;i<3;i++){
				$('#li1-div1').append($daohang);
			}
			
			console.log($('.aLeft').html());
			if($('.aLeft').html()=="亲，请先登录"){
				$('.aLeft').attr('href','http://localhost:8080/iiii_war/Tao_Bao/Deng_Lu.jsp');
				$('.aLeft').css('color','red');
			}
			
		})
		function onck(index){
			//console.log(imG[index]);
			$(location).prop("href", "http://localhost:8080/iiii_war/Tao_Bao/Shang_Pin_Jie_Shao.jsp?imG="+imG[index]);
		}
	</script>
<body style="overflow-x: hidden;">
<jsp:useBean id="qew" class="Demo.Jdbc"></jsp:useBean>
<% 
response.setHeader("Pragma","No-cache");
response.setHeader("Cache-Control","No-cache");
response.setDateHeader("Expires", -1);
response.setHeader("Cache-Control", "No-store"); 
%>
<%
	String s=qew.Quuser();
	String ss="注销当前账号",stt="欢迎用户";
	if(s==null){
		s="";
		ss="";
		stt="亲，请先登录";
	}
%>
		<div id="div0">
			<ul id="div0-ul">
				<li id="li0">
					<a id="name" href="Delet_User.jsp" onclick="return confirm('确定注销吗？')" ><%=ss %></a>
					<a class="aLeft"><%=stt %></a><a style="color: red;text-decoration: none;" href="User_Information.jsp" id="user"><%=s %></a>
					<a class="Rred" id="a3" style="color:gray;text-decoration: none;margin-left: 10px;" href="Zhu_Ce.jsp">免费注册</a>
					<a class="Rred" style="color:gray;text-decoration: none;margin-left: 20px;" href="#">手机逛淘宝</a>
				</li>
				<li id="li1">
					<a style="color: red;text-decoration: none;" href="#">淘宝网首页</a>
					<a class="aa1" style="color:gray;text-decoration: none;" href="#">我的淘宝</a>
					<div id="li1-div" class="li1-div">
					<ul>
						<li><a class="Rred" href="#" style="color: gray;">以买到的宝贝</a></li>
						<li><a class="Rred" href="#" style="color: gray;">我的足迹</a></li>
						<li><a class="Rred" href="#" style="color: gray;">我的上新</a></li>
						<li><a class="Rred" href="#" style="color: gray;">爱逛街</a></li>
						<li><a class="Rred" href="#" style="color: gray;">淘宝达人</a></li>
						<li><a class="Rred" href="#" style="color: gray;">上新</a></li>
					</ul>
					</div>
					<a class="Rred" style="color: gray;text-decoration: none;" href="#">购物车</a>
					<a class="Rred" style="color: gray;text-decoration: none;" href="#">收藏夹</a>
					<a class="Rred" style="color: gray;text-decoration: none;" href="#">商品分类</a>
					<a class="Rred" style="color: gray;text-decoration: none;" href="#">卖家中心</a>
					<a class="Rred" style="color: gray;text-decoration: none;" href="#">联系客服</a>
					<a class="Rred1" style="color: gray;text-decoration: none;" href="#">网站导航</a>
					<div id="li1-div1" class="li1-div1">
						<div>
							<a class="li1-div1-1">主题市场</a>
							<ul>
								<li class="li1-div1-2"><a href="#">主题</a></li>
								<li class="li1-div1-2"><a href="#">主题</a></li>
								<li class="li1-div1-2"><a href="#">主题</a></li>
								<li class="li1-div1-2"><a href="#">主题</a></li>
								<li class="li1-div1-2"><a href="#">主题</a></li>
								<li class="li1-div1-2"><a href="#">主题</a></li>
							</ul>
						</div>
					</div>
				</li>
			</ul>
		</div>
		<div id="div1">
			<img src="img/left.png" style="float: left;margin-left: 200px;padding-top: 20px;"/>
			<span id="span0">
				<input type="text" name="user" id="ss">
			</span>
			<div class="sS">
				<ul>
					<li><a href="#">2eqeq</a></li>
					<li><a href="#">qweqeda</a></li>
					<li><a href="#">asdada</a></li>
					<li><a href="#">asdad</a></li>
					<li><a href="#">dadac</a></li>
					<li><a href="#">caccac</a></li>
					<li><a href="#">acacd</a></li>
					<li><a href="#">dcscdc</a></li>
					<li><a href="#">sdcdsc</a></li>
					<li><a href="#">cdscsdcs</a></li>
				</ul>
			</div>
			<a id="a0" href="#">搜索</a>
			<ul class="ul2">
				<li><a style="color: red;text-decoration: none;" href="#">一淘限时抢</a></li>
				<li><a style="color: red;text-decoration: none;" href="#">连衣裙</a></li>
				<li><a style="color: red;text-decoration: none;" href="#">外套女</a></li>
				<li><a class="Rred" style="color: #9a9a9a;" href="#">牛仔裤</a></li>
				<li><a class="Rred" style="color: #9a9a9a;" href="#">老爹鞋</a></li>
				<li><a style="color: red;text-decoration: none;" href="#">扫地机器人</a></li>
				<li><a class="Rred" style="color: #9a9a9a;" href="#">眼影盘</a></li>
				<li><a class="Rred" style="color: #9a9a9a;" href="#">手机壳</a></li>
				<li><a style="color: red;text-decoration: none;" href="#">男衬衫</a></li>
				<li><a style="color: red;text-decoration: none;" href="#">乐高玩具</a></li>
			</ul>
			<a href="#"><img src="img/right.jpg" style="float: left;padding: 15px;margin-left: 30px;height: 60px;width: 180px;"/></a>
		</div>
		<div id="div2">
			<ul style="position: absolute;">
				<li><a href="#" style="color: white;text-decoration: none;">每日爆款1元起</a></li>
				<li><a href="#" style="color: white;text-decoration: none;">聚划算</a></li>
				<li><a href="#" style="color: white;text-decoration: none;">淘抢购</a></li>
				<li><a href="#" style="color: white;text-decoration: none;">天猫超市</a></li>
				<li><a href="#" style="color: white;text-decoration: none;position: absolute;width: 150px;">天猫国际官方直营</a></li>
			</ul>
		</div>
		<div id="div3">	
		<div id="dd">
			<div class="XiangBao">
				<img src="./img/briefcase.png" style="width: 20px;height: 20px;"/>
				<a>箱包</a>
			</div>
			<div style="margin-left: 55px;font-size: 12px;">
			<a style="float: left;color: #9a9a9a;">双肩背包&nbsp;&nbsp;</a>
			<a style="float: left;color: red;">zrar&nbsp;&nbsp;</a>
			<a style="float: left;color: #9a9a9a;">电脑包&nbsp;&nbsp;</a>
			<a style="float: left;color: #9a9a9a;">背包&nbsp;&nbsp;</a><br/>
			<a style="float: left;color: #9a9a9a;margin-top: 10px;">斐乐&nbsp;&nbsp;</a>
			<a style="float: left;color: #9a9a9a;margin-top: 10px;">行李箱&nbsp;&nbsp;</a>
			<a style="float: left;color: #9a9a9a;margin-top: 10px;">卡套&nbsp;&nbsp;</a>
			<a style="float: left;color: #9a9a9a;margin-top: 10px;">腰包</a>
			</div>
		</div>
		</div>
		<div class="banner">
			<ul class="img">
				<li>
					<a href="#"><img src="img/tu1.jpg" style="width: 518px;height: 300px;"/></a>
				</li>
				<li>
					<a href="#"><img src="img/tu2.jpg" style="width: 518px;height: 300px;"/></a>
				</li>
				<li>
					<a href="#"><img src="img/tu3.jpg" style="width: 518px;height: 300px;"/></a>
				</li>
				<li>
					<a href="#"><img src="img/tu4.jpg" style="width: 518px;height: 300px;"/></a>
				</li>
				<li>
					<a href="#"><img src="img/tu5.jpg" style="width: 518px;height: 300px;"/></a>
				</li>
				<li>
					<a href="#"><img src="img/tu6.jpg" style="width: 518px;height: 300px;"/></a>
				</li>
			</ul>
			<ul class="tab">
			
				<li class="active"></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
			</ul>
			<div class="btn">
				<span class="prev">&lt;</span>
				<span class="next">&gt;</span>
			</div>
		</div>
		<div style="margin-left: 960px;float: left;"><img src="img/ww.jpg"/></div>
		<div class="divRight">
			<div class="divRight1"><a style="color: red;" href="#">我的淘宝</a></div>
			<div class="divRight2">
				<a href="#"><img src="img/mm1.gif" style="width: 119px;height: 56.5px;"/></a>
				</div>
			<div class="divRight3">
				<a href="#"><img src="img/mm2.gif" style="width: 118px;height: 56.5px;"/></a>
				</div>
			<div class="divRight2">
				<a href="#"><img src="img/mm3.gif" style="width: 119px;height: 56.5px;"/></a>
				</div>
			<div class="divRight3">
				<a href="#"><img src="img/mm4.jpg" style="width: 118px;height: 56.5px;"/></a>
				</div>
			<div class="divRight2">
				<a href="#" id="a9k9" >9块9</a>
				</div>
			<div class="divRight3">
				<a href="#"><img src="img/mm5.gif" style="width: 118px;height: 56.5px;"/></a>
				</div>
			<div class="divRight2">
				<a href="#"><img src="img/mm6.gif" style="width: 119px;height: 56.5px;"/></a>
				</div>
			<div class="divRight3">
				<a href="#"><img src="img/mm7.png" style="width: 118px;height: 56.5px;"/></a>
				</div>
		</div>
		<div style="margin-left: 430px;width: 1020px;">
			<div style="width: 530px;float: left;">
			<div style="width: 518px;height: 30px;">
				<a style="float: left;font-size: 14px;color: #FF0000;" href="#">超值活动专区</a>
				<a style="float: right;font-size: 12px;color: gray;" href="#">每天10点更新</a>
				<hr style="color: #ff4545;width: 516px;margin-top: 20px;position: absolute;"/>
			</div>
			<div style="float: left;"><img src="img/ww2.jpg"/></div>
			<div style="float: left;margin-left: 7px;"><img src="img/ww3.jpg"/></div>
			</div>
			<div style="float: left;margin-top: 5px;">
				<div style="float: left;margin-right: 10px;"><img src="img/ww1.jpg" style="width: 160px;height: 230px;"/></div>
				<div class="divRightBottom">
					<a class="aaa" href="#" style="background-color: blueviolet;color: white;">大促</a>
					<a class="aaa" href="#">鸿星尔克品牌返利专场<br/><br/></a>
					<a class="aaa" href="#" style="background-color: #ff5500;color: white;">大促</a>
					<a class="aaa" href="#">鸿星尔克品牌返利专场<br/><br/></a>
					<a class="aaa" href="#" style="background-color: blueviolet;color: white;">大促</a>
					<a class="aaa" href="#">鸿星尔克品牌返利专场<br/><br/></a>
					<a class="aaa" href="#" style="background-color: red;color: white;">大促</a>
					<a class="aaa" href="#">鸿星尔克品牌返利专场<br/><br/></a>
				</div>
			</div>
		</div>
		<div class="like">
			<ul>
			<li class="like1li">猜你喜欢</li>
			</ul>
		</div>
		<!-- <footer class="foot" style="color: black;width: 1519px;text-align: center;background-color: #CCCCCC;position: fixed;bottom: 0px;overflow-x: hidden;">
			伍&nbsp;某&nbsp;仿&nbsp;做
		</footer> -->
		<font style="float:left;width:100%;line-height: 50px;text-align:center;">已经到达最底部了</font>
	</body>
</html>