//轮播图获取json数据
$(function(){
	var arr = [];
		//获取数据并创建节点
		$.get("../json/lunbo.json", function(data){
			console.log(data);
			arr = data;
			
			//遍历json，并用节点显示
			for (var i=0; i<arr.length; i++) {
				var obj = arr[i];
				var li = $("<li></li>").appendTo("#piclist");
			    $("<a href='#'><img src="+obj.headImg+"></a>").appendTo(li);
		    }
		})
})
//轮播图效果
window.onload=function(){
	var bannerpic = document.getElementById("bannerpic");
	var piclist = document.getElementById("piclist");
	var aLi1 = piclist.getElementsByTagName("li");
	var numlist = document.getElementById("numlist");
	var aLi2 = numlist.getElementsByTagName("li");
	var aImg = piclist.getElementsByTagName("img");
	var index = 0;   
	var timer = setInterval(function(){
		index++;
		move();        
	},3000);    
	function move(){
		if(index >= 4){   
			index = 0;
		}
		for(var i = 0; i< aLi1.length; i++){
			if(i == index){
				animate(aImg[index],{opacity:100});
			    aLi2[i].className = "active";
			}   
			else{
				animate(aImg[i], {opacity:0});     
				aLi2[i].className = "";
			}    
		}         
	}
	for(var i = 0; i<aLi2.length; i++){
		aLi2[i].index = i;
		aLi2[i].onmousemove =function(){
			index = this.index;
			move();
		}
	}
	var sortlist = document.getElementById("sortlist")
    var ah3 = sortlist.getElementsByTagName("h3");
	for(var i=0; i<ah3.length; i++){
		ah3[i].onmouseenter = function(){
			animate(this,{paddingLeft:25})
		}
		ah3[i].onmouseleave = function(){  
			animate(this,{paddingLeft:15})
		}   
    }        
}
//  菜单栏显示和隐藏
	$(function(){
		$("#sortlist li,#sortlistone li").mouseenter(function(){
			$("#sortlistone").show();
			$("#sortlistone li").eq($(this).index()).show().siblings().hide();
		})
		$("#sortlist li,#sortlistone li").mouseleave(function(){
			$("#sortlistone li").hide();
			$("#sortlistone").hide();
		})
	})
//  新品上市显示和隐藏
    $(function(){
    	var list1 = $(".con2listpic ul");
		var size = $(".con2listpic ul").size();
		var aA = $(".con2-top ul li a");
		var li1 = $(".con2-top ul li")
		list1.eq(0).show().siblings().hide();
		var i = 0;
		var timer = setInterval(function(){   
			i++;
			move();
		},2000)
		function move(){
			if(i == size){    
				i = 0;   
			}
			//list1.stop().eq(i).animate({opacity:1}).siblings().animate({opacity:0})
			list1.eq(i).stop().fadeIn().siblings().stop().fadeOut();  
			aA.eq(i).removeClass().addClass("con2active").parent().siblings().find("a").removeClass("con2active");
	    }
		li1.hover(function(){
			var index = $(this).index();
			//console.log(index);
			i = index;
			move();
		})
		//移入box, 移出box
		$(".con2listpic ul,.con2-top ul li").hover(function(){
			//移入, 关闭定时器
			clearInterval(timer);
		}, 
		function(){
			//移出, 重新开启定时器
			timer = setInterval(function(){
				i++;
				move();
			}, 2000);
		})
				
    })
 // 热销排行榜获取ajax数据；
    $(function(){
		var arr = [];
		
		//获取数据并创建节点
		$.get("../json/hot.json", function(data){
			console.log(data);
			arr = data;
			
			//遍历json，并用节点显示
			for (var i=0; i<arr.length; i++) {
				var obj = arr[i];
				
				//创建li节点
				var li = $("<li></li>").appendTo(".con3-hot ul");
				var h2 = $("<h2>"+obj.name+"</h2>").appendTo(li);
				var span = $("<span></span>").appendTo(h2);
				$("<img src="+ obj.tImg +">").appendTo(span);
				var hot = $("<div class='hot'></div>").appendTo(li);
				$("<img src="+ obj.wImg +">").appendTo(hot);
				var hotlist = $("<div class='hotlist'></div>").appendTo(hot);
				$("<div class='hotlist1'>"+ obj.name +"</div>").appendTo(hotlist);
				$("<div class='hotlist2'>"+ obj.price +"</div>").appendTo(hotlist);
				$("<div class='hotlist3'>"+ obj.unit +"</div>").appendTo(hotlist);
				$("<div class='hotlist4'>"+ obj.sold +"</div>").appendTo(hotlist);
			}
			$(".con3-hot ul").on("mouseenter","li",function(){
				$(this).find('h2').hide();
				$(this).siblings().find('h2').show();
			    $(this).find('.hot').show();
			    $(this).siblings().find('.hot').hide();
		    })
		})
		
	})
    //商品详情
    $(function(){
		var arr = [];
		
		//获取数据并创建节点
		$.get("../json/list.json", function(data){
			console.log(data);
			arr = data;
			
			//遍历json，并用节点显示
			for (var i=0; i<arr.length; i++) {
				var obj = arr[i];
				
				//创建li节点
				var li = $("<li></li>").appendTo(".con3-b ul");
					$("<img src="+ obj.headImg +">").appendTo(li);
			        var price = $("<p class='price'>"+ obj.price +"</p>").appendTo(li);
			            $("<s>"+ obj.unit +"</s>").appendTo(price);
					$("<p class='tet'>"+ obj.text +"</p>").appendTo(li);
		    }
		})
		$(".con3-b ul").on("click", "li", function(){
			//console.log("click");
			var index = $(this).index(); 
			var obj = arr[index];
			//console.log(obj.id);
			location.href = "../html/details.html?id=" + obj.id;
		})
	})
    //第四部分商品列表
    $(function(){
		var arr = [];
    	$.get("../json/list2.json", function(data){
			console.log(data);
			arr = data;
			
			//遍历json，并用节点显示
			for (var i=0; i<arr.length; i++) {
				var obj = arr[i];
				
				//创建li节点
				var li = $("<li></li>").appendTo(".con4-b ul");
					$("<img src="+ obj.headImg +">").appendTo(li);
			        var price = $("<p class='price'>"+ obj.price +"</p>").appendTo(li);
			            $("<s>"+ obj.unit +"</s>").appendTo(price);
					$("<p class='tet'>"+ obj.text +"</p>").appendTo(li);
		    }
		})
		$(".con4-b ul").on("click", "li", function(){
			//console.log("click");
			var index = $(this).index(); 
			var obj = arr[index];
			//console.log(obj.id);
			location.href = "10_detail.html?id=" + obj.id;
		})
	})
    //第五部分商品列表
     $(function(){
		var arr = [];
    	$.get("../json/list3.json", function(data){
			console.log(data);
			arr = data;
			
			//遍历json，并用节点显示
			for (var i=0; i<arr.length; i++) {
				var obj = arr[i];
				
				//创建li节点
				var li = $("<li></li>").appendTo(".con5-b ul");
					$("<img src="+ obj.headImg +">").appendTo(li);
			        var price = $("<p class='price'>"+ obj.price +"</p>").appendTo(li);
			            $("<s>"+ obj.unit +"</s>").appendTo(price);
					$("<p class='tet'>"+ obj.text +"</p>").appendTo(li);
		    }
		})
		$(".con5-b ul").on("click", "li", function(){
			//console.log("click");
			var index = $(this).index(); 
			var obj = arr[index];
			//console.log(obj.id);
			location.href = "10_detail.html?id=" + obj.id;
		})
	})
     //第六部分商品列表
    $(function(){
		var arr = [];
    	$.get("../json/list4.json", function(data){
			console.log(data);
			arr = data;
			
			//遍历json，并用节点显示
			for (var i=0; i<arr.length; i++) {
				var obj = arr[i];
				
				//创建li节点
				var li = $("<li></li>").appendTo(".con6-b ul");
					$("<img src="+ obj.headImg +">").appendTo(li);
			        var price = $("<p class='price'>"+ obj.price +"</p>").appendTo(li);
			            $("<s>"+ obj.unit +"</s>").appendTo(price);
					$("<p class='tet'>"+ obj.text +"</p>").appendTo(li);
		    }
		})
		$(".con6-b ul").on("click", "li", function(){
			//console.log("click");
			var index = $(this).index(); 
			var obj = arr[index];
			//console.log(obj.id);
			location.href = "10_detail.html?id=" + obj.id;
		})
	})
    //第七部分商品列表
        $(function(){
		var arr = [];
    	$.get("../json/list5.json", function(data){
			console.log(data);
			arr = data;
			
			//遍历json，并用节点显示
			for (var i=0; i<arr.length; i++) {
				var obj = arr[i];
				
				//创建li节点
				var li = $("<li></li>").appendTo(".con7-b ul");
					$("<img src="+ obj.headImg +">").appendTo(li);
			        var price = $("<p class='price'>"+ obj.price +"</p>").appendTo(li);
			            $("<s>"+ obj.unit +"</s>").appendTo(price);
					$("<p class='tet'>"+ obj.text +"</p>").appendTo(li);
		    }
		})
		$(".con7-b ul").on("click", "li", function(){
			//console.log("click");
			var index = $(this).index(); 
			var obj = arr[index];
			//console.log(obj.id);
			location.href = "10_detail.html?id=" + obj.id;
		})
	})
//爬楼梯效果
    $(function(){
		
		//表示是否点击了楼层按钮正在执行动画
		var isMoving = false;
		
		//点击楼层按钮， 让页面滚动到对应的楼层
		$("#floor li").click(function(){
			$(this).find("span").addClass("active")
				.parent().siblings().find("span").removeClass("active");
			
			var index = $(this).index();
			var top = $(".main #step").eq(index).offset().top;
			
			isMoving = true;
			$("html,body").stop(true).animate({scrollTop: top}, function(){
				isMoving = false;
			});
			
		})
		
		//滚动页面
		$(window).scroll(function(){
			
			//如果没有点击楼层按钮执行动画， 则执行代码
			if (!isMoving) {
				
				var scrollTop = $(window).scrollTop();
				//console.log(scrollTop);
				
				
				//遍历所有的楼层div
				var index = 0;
				$(".main #step").each(function(){
					//每个楼层div的top值
					var top = $(this).offset().top;
					var winH = $(window).height(); //页面高度
					
					if (scrollTop + winH/5 >= top) {
						index = $(this).index();
					}
				})
				//console.log(index);
				
				$("#floor li").eq(index).find("span").addClass("active")
					.parent().siblings().find("span").removeClass("active")
			}
			
		})
				
	})
