$(function(){


	    $('.product-number .add').click(function () {
        console.log('加操作')

        //加入购物车：谁、商品、加入购物车
        //用户？ 状态保持（必须登录）
        //商品？ 商品ID，添加一个自定义属性
        var goodsid = $(this).attr('goodsid')
		var $that = $(this)
        console.log(goodsid)


        data = {
            'goodsid': goodsid,
        }
        $.get('/addcart/', data, function (response) {
            console.log(response)
            if (response.status == 0) {
                window.open('/lander/', target = '_self')
            } else if (response.status == 1) {	//加操作成功
                $that.prev().val(response.number)
            }
        })
    })

    //商品减操作
    $('.product-number .reduce').click(function () {
        console.log('减操作')

        var goodsid = $(this).attr('goodsid')
        var $that = $(this)

        data = {
            'goodsid': goodsid
        }
        $.get('/subcart/', data, function (response) {
            console.log(response)
            if (response.status == 1) {
                if (response.number > 0) {
                    $that.next().val(response.number)

                } else {
                    $that.next().val(response.number)

                }
            }
        })

    })
				
	//获取购物车的cookie数据,并用节点显示
	// refresh();
	// function refresh() {
	//
	// 	var arr = $.cookie("cart");
	// 	console.log(arr);
	// 	if (arr) {
	// 		// arr = JSON.parse(arr);
	//
	// 		//先清除旧节点
	// 		$("#list").empty();
	//
	// 		//再添加新节点
	// 		var totalPrice = 0; //总价
	// 		//遍历数组
	// 		for (var i=0; i<arr.length; i++) {
	// 			var obj = arr[i];
	//
	// 			//创建li节点
	// 			var li = $("<li></li>").appendTo("#list");
	//
	// 		    var product = $("<div class='product'></div>").appendTo(li);
	// 				$("<div class='productimg'><img src="+obj.headImg+"></div>").appendTo(product);
	// 				$("<p><a href='#'>"+obj.name+"</a></p>").appendTo(product);
	// 				$("<span>颜色:蓝色    尺码:L</span>").appendTo(product);
	// 			var product_money =$("<div class='product_money'></div>").appendTo(li);
	// 				$("<div class='product_m'><del>"+obj.unit+"</del><br /><span>￥"+obj.price+"</span></div>").appendTo(product_money);
	// 			var product_number = $("<div class='product_number'></div>").appendTo(li);
	// 				$("<input class='reduce' type='button' value='-'/>").appendTo(product_number);
	// 				$("<input class='carttxt' type='button' value="+obj.num+">").appendTo(product_number);
	// 				$("<input class='add' type='button' value='+' />").appendTo(product_number);
	// 			$("<div class='product_singlemoney'><span>￥"+obj.num*obj.price+"</span></div>").appendTo(li);
	// 			var product_close = $("<div class='product_close'></div>").appendTo(li);
	// 				$("<div class='product_closemid'><a href='#'>移入收藏夹</a><br /><a href='#' class='del'>删除</a></div>").appendTo(product_close);
	// 			$("<div class='product_tip'><a href='#'>2017秋冬新品-全场满199包邮【提交订单系统自动满减】满199减20/满299减50/满499减150！~</a></div>").appendTo(li);
	// 			//计算总价
	// 			totalPrice += obj.price * obj.num;
    //         }
	// 		$(".total .totalval").html(totalPrice);
	// 		$(".total2-r i").html(totalPrice);
	// 	}
	// 	else {
	// 		console.log("购物车还没有商品， 请先购买！");
	// 	}
	// }
	//
	// //+
	// $("#list").on("click", ".add", function(){
	// 	var index = $(this).index("#list .add");
	//
	// 	//获取cookie并修改
	// 	// var arr = JSON.parse($.cookie("cart"));
	// 	arr[index].num++;
	//
	// 	//覆盖原来的cookie
	// 	// $.cookie("cart", JSON.stringify(arr), {expires:30, path:"/"});
	//
	// 	//刷新节点数据
	// 	refresh();
	// })
	//
	// //-
	// $("#list").on("click", ".reduce", function(){
	// 	var index = $(this).index("#list .reduce");
	//
	// 	//获取cookie并修改
	// 	// var arr = JSON.parse($.cookie("cart"));
	// 	arr[index].num--;
	// 	if (arr[index].num < 1) {
	// 		arr[index].num = 1;
	// 	}
	//
	// 	//覆盖原来的cookie
	// 	// $.cookie("cart", JSON.stringify(arr), {expires:30, path:"/"});
	//
	// 	//刷新节点数据
	// 	refresh();
	// })
	//
	//
	// //删除
	// $("#list").on("click", ".del", function(){
	// 	var index = $(this).index("#list .del");
	//
	// 	//获取cookie并修改
	// 	// var arr = JSON.parse($.cookie("cart"));
	// 	arr.splice(index, 1); //删除数组arr的第index个
	//
	// 	//覆盖原来的cookie
	// 	// $.cookie("cart", JSON.stringify(arr), {expires:30, path:"/"});
	// 	//刷新节点数据
	// 	refresh();
	// })
	
	
//	//勾选
//	$("#list").on("click", ".ckbox", function(){
//		var index = $(this).index("#list .ckbox");
//		
//		//获取cookie并修改
//		var arr = JSON.parse($.cookie("cart"));
//		arr[index].checked = !arr[index].checked;
//		
//		//覆盖原来的cookie
//		$.cookie("cart", JSON.stringify(arr), {expires:30, path:"/"});
//		
//		//判断是否全选了
//		isAllSelect();
//		
//		//刷新节点数据
//		refresh();
//	})
//	
//	//判断是否全部勾选了
//	isAllSelect();
//	function isAllSelect(){
//		
//		//判断是否为undefined
//		var arr = $.cookie("cart");
//		if (!arr) {
//			return;
//		}
//		
//		var arr = JSON.parse($.cookie("cart"));
//		
//		var sum = 0;
//		for (var i=0; i<arr.length; i++) {
//			sum += arr[i].checked;
//		}
//		
//		//全选了
//		if (arr.length!=0 && sum==arr.length) {
//			$("#allSelect").prop("checked", true);
//		}
//		//未全选
//		else {
//			$("#allSelect").prop("checked", false);
//		}
//	}
//	
//	//全选
//	$("#allSelect").click(function(){
//		//判断是否为undefined
//		var arr = $.cookie("cart");
//		if (!arr) {
//			return;
//		}
//		
//		var arr = JSON.parse($.cookie("cart"));
//		for (var i=0; i<arr.length; i++) {
//			//全选
//			if ($(this).prop("checked")){
//				arr[i].checked = true;
//			}
//			//全不选
//			else {
//				arr[i].checked = false;
//			}
//		}
//		$.cookie("cart", JSON.stringify(arr), {expires:30, path:"/"});
//		
//		//刷新
//		refresh();
//	})
//	
//	//删除选中
//	$("#delSelect").click(function(){
//		
//		//获取cookie并修改
//		var arr = JSON.parse($.cookie("cart"));
//		
//		//将未选中的商品添加到新数组newArr中，再将newArr保存到cookie
//		var newArr = [];
//		for (var i=0; i<arr.length; i++) {
//			if (!arr[i].checked) {
//				newArr.push(arr[i]);
//			}
//		}
//		
//		//覆盖原来的cookie
//		$.cookie("cart", JSON.stringify(newArr), {expires:30, path:"/"});
//		
//		isAllSelect();
//		
//		//刷新节点数据
//		refresh();
//	})
})