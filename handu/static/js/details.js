//主菜单栏的显示和隐藏
$(function(){
	$(".sort p,#sortlist").mouseenter(function(){
		$("#sortlist").show();
	})
	$(".sort p,#sortlist").mouseleave(function(){
		$("#sortlist").hide();
	})
})
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
//放大镜效果
$(function(){
	$(".smallArea").width( $(".con2-midImg").width() * $(".con2-bigArea").width() / $("#bigImg").width() );
	$(".smallArea").height( $(".con2-midImg").height() * $(".con2-bigArea").height() / $("#bigImg").height() );
	
	//放大系数
	var scale = $("#bigImg").width() / $(".con2-midImg").width();
	
	//在中图中移动
	$(".con2-midImg").mousemove(function(e){
		$(".smallArea").show(); 
		$(".con2-bigArea").show(); 
		
		
		var x = e.pageX - $(".con2-midImg").offset().left - $(".smallArea").width()/2;
		var y = e.pageY - $(".con2-midImg").offset().top - $(".smallArea").height()/2;
		
		//控制不超出左右边界
		if (x < 0){
			x = 0;
		}
		else if (x > $(".con2-midImg").width()-$(".smallArea").width()){
			x = $(".con2-midImg").width()-$(".smallArea").width();
		}
		//控制不超出上下边界
		if (y < 0){
			y = 0
		}
		else if (y > $(".con2-midImg").height()-$(".smallArea").height()) {
			y = $(".con2-midImg").height()-$(".smallArea").height();
		}
		
		//小区域移动
		$(".smallArea").css({left:x, top:y});
		
		//大图移动
		$("#bigImg").css({left: -scale*x,top: -scale*y});
	})
	
	//移除小区域
	$(".con2-midImg").mouseleave(function(){
		$(".smallArea").hide(); //隐藏小区域
		$(".con2-bigArea").hide(); //隐藏大区域
	})
	//点击小图添加到中图中去
	$(".con2-smallImg li img").click(function(){
		$(".con2-midImg img").attr("src",$(this).attr("src"));
		$(".con2-bigArea #bigImg").attr("src",$(this).attr("src"));
	})
})
//商品型号选择
   $(function(){
   	 $(".goods-text ul li").click(function(){
   	 	$(this).addClass("active").siblings().removeClass("active");
   	 })
   })
//商品详情
   	$(function(){




   		//商品加操作
		$('.goods-count .add').click(function () {
			console.log('加操作')

			//加入购物车：谁、商品、加入购物车
			//用户？ 状态保持（必须登录）
			//商品？ 商品ID，添加一个自定义属性
			var goodsid = $(this).attr('goodsid')

			console.log(goodsid)


			data = {
				'goodsid':goodsid,
			}
			$.get('/addcart/',data,function (response) {
				console.log(response)
				if (response.status == 0) {
					window.open('/lander/',target='_self')
				}else if (response.status == 1) {	//加操作成功
					$('.goods-count .val').val(response.number)
				}
			})
		})

		//商品减操作
		$('.goods-count .reduce').click(function () {
			console.log('减操作')

			var goodsid = $(this).attr('goodsid')

			data = {
				'goodsid':goodsid
			}
			$.get('/subcart/',data,function (response) {
				console.log(response)
			})

		})

				
		//获取从首页传过来的id
		// location.search : 参数部门， 如:?id=1002&name=lisi
		var param = location.search.substring(1);
		var pid = getParams(param, "id");
		console.log(pid);
		
		
		//获取json中的数据
		$.get("../json/list.json", function(data){
			var arr = data;
			
			for (var i=0; i<arr.length; i++) {
				var obj = arr[i]; //每个商品数据
				console.log(obj)
				//找到id相同的商品
				if (obj.id == pid) {
					loadUI(obj);
					var products = obj;
					console.log(products)
					$(".shopping").click(function(){
					//获取购物车中的数据（cookie）
					var arr2 = $.cookie("cart") ? JSON.parse($.cookie("cart")) : [];
					
					//判断原来的购物车中是否有相同商品
					var isExist = false;
					for (var i=0; i<arr2.length; i++) {
						if (arr2[i].id == products.id) {
							arr2[i].num++;
							isExist = true;
							break;
						}
					}
					if (isExist ==  false) {
						products.num = 1;
						arr2.push(products);
						console.log(arr2)
					}
					//将arr2添加到cookie中
					$.cookie("cart", JSON.stringify(arr2), {expires:30, path:"/"});

				    })
					console.log( $.cookie("cart") );
				}
					
			}
			
		})
		
		function loadUI(obj){
			console.log(obj.midImg);
			$(".con2-midImg img").attr("src", obj.midImg);
			$("#smallImg1 img").attr("src" , obj.smallImg1 );
	        $("#smallImg2 img").attr("src" , obj.smallImg2 );
	        $("#smallImg3 img").attr("src" , obj.smallImg3 );
	        $("#smallImg4 img").attr("src" , obj.smallImg4 );
	        $("#smallImg5 img").attr("src" , obj.smallImg5 );
		    $("#bigImg").attr("src" , obj.smallImg1 );
		    $(".con2-r-r-t p").html(obj.name);
		    $(".con2-r-r-t .market_price").html(obj.unit);
		    $(".con2-r-r-t .protome_price").html(obj.price);
		    
		    console.log(obj)
		}
		//查找参数对应的值
		function getParams(str, name) {
			var arr = str.split("&");
			for (var i = 0; i < arr.length; i++) {
				var str1 = arr[i]; // id=1002 
				var arr1 = str1.split("=");
				if (arr1[0] == name) {
					return arr1[1];
				}
			}
			return "";
		}
    })