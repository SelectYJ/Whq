;(function($){
	var wolfTimer=null,sdu=300;
	$.fn.extend({
		yxgz:function(){
			//显示规则
			$('.rules>a').click(function(){
				$('.rule').css('display','block');
			});
			//关闭规则
			$('.rule>.close').click(function(){
				$('.rule').css('display','none');
			});
			//重新开始按钮
			$('.mask>.reStart').hover(function(){
				$(this).css('cursor','pointer')
				},function(){
				$(this).css('cursor','default')
			}).click(function(){
				sdu=300;
				$('.progress').css('width','180px');
				$('.mask').css('display','none');
				$('.start').trigger('click');
			})
			return this;
		},
		start:function(){
			//开始游戏按钮
			$('.start').hover(function(){
					$(this).css('cursor','pointer')
					},function(){
					$(this).css('cursor','default')
				}).click(function(){
					$('.progress').css('width','180px');
					$('.container').wolf();
					$(this).css('display','none');
					$('.rules>a').css('display','none');
					$('.progress').css('background','url("images/progress.png") no-repeat 0 0')
					.animate({width:0},60000,function(){
						$('.score').text(0);
						clearInterval(wolfTimer);//关闭定时器
						$('img').remove();
						$('.mask').css('display','block');
						});
			})
			return this;
		},
		wolf:function(){
			var wolf_0=['images/h0.png','images/h1.png','images/h2.png','images/h3.png','images/h4.png',
						'images/h5.png','images/h6.png','images/h7.png','images/h8.png','images/h9.png'];
			var wolf_1=['images/x0.png','images/x1.png','images/x2.png','images/x3.png','images/x4.png'
						,'images/x5.png','images/x6.png','images/x7.png','images/x8.png','images/x9.png'];
			var arrPos=[
				{left:"100px",top:"115px"},
				{left:"20px",top:"160px"},
				{left:"190px",top:"142px"},
				{left:"105px",top:"193px"},
				{left:"19px",top:"221px"},
				{left:"202px",top:"212px"},
				{left:"120px",top:"275px"},
				{left:"30px",top:"295px"},
				{left:"209px",top:"297px"}
			];
			var $img=$('<img />');
			var index=Math.floor(Math.random()*9);
			$img.css({
				position:"absolute",
				left:arrPos[index].left,
				top:arrPos[index].top
			})
			var flag=Math.random()<0.6;
			var wolfType=flag?wolf_0:wolf_1;
			var i=0;
			var end=5;
			wolfTimer=setInterval(function(){
				$img.attr('src',wolfType[i]);
				if(i>end){
					$img.remove();
					clearInterval(wolfTimer);
					$('.container').wolf();
				}
				i++;
			},sdu)
			$('.container').append($img);
			$img.one('click',function(){
				if($('.score').text()>=50){
					if(sdu<=80) sdu=80;
					else sdu=sdu-20;
					}
				$('.score').text(function(index,value){
					var v=flag?parseInt(value)+10:parseInt(value)-10;
					return v;
				})
				i=6;
				end=9;
			})
		},
		tcyx:function(){
			//退出游戏按钮
			$('#tcyx').hover(function(){
					$(this).css('cursor','pointer')
					},function(){
					$(this).css('cursor','default')
				}).click(function(){
					sdu=300;
					$('.mask').css('display','none');
					$('.start').css('display','block');
					$('.rules>a').css('display','block');
			});
		}
		});
})(jQuery);