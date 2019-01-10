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
			$("#sortlistone li").eq($(this).index()).show().siblings().hide();
		})
		$("#sortlist li,#sortlistone li").mouseleave(function(){
			$("#sortlistone li").hide();
		})
	})
// 注册页面轮换
$(function(){
	$(".con-r-t-t h2").mousedown(function(){
		//console.log($(this).index());
		var index = $(this).index(".con-r-t-t h2");
		$(".con-r-t-b ul").eq(index).show().siblings("ul").hide();
		$(this).addClass("active").siblings().removeClass("active");
	})
})
//注册页面表单验证
$(function(){
	//手机号验证
	var flag1 = false;
	var flag2 = false;
	var flag3 = false;
	var flag4 = false;
	var flag5 = false;
	var flag6 = false;
	$("#list1 li #inp1").keyup(function(){
		var reg = /^((13[0-9])|(14[5|7])|(15([0-3]|[5-9]))|(17[0-9])|(18[0-9])|199)\d{8}$/;
		var val = $(this).val();
	    if(reg.test(val)){
	    	$(this).parent().find("img").show().parent().find("span").hide();
			flag1 = true;
	    }
	    else{
	    	$(this).parent().find("span").show().parent().find("img").hide();
			flag1 = false;
	    }
	})
//密码验证
	$("#list1 li #inp2").keyup(function(){
		var reg = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,24}$/;
		var val = $(this).val();
		if($(this).val().length<8 || $(this).val().length>24){
			$(this).parent().find("span").show().parent().find("img,i").hide();
			flag2 = false;
		}
		else if($(this).val().length>8 && $(this).val().length<24){
			if(reg.test(val)){
			    $(this).parent().find("img").show().parent().find("span,i").hide();
				flag2 = true;
			}
			else{
				$(this).parent().find("i").show().parent().find("span,img").hide();
				flag2 = false;
		    }
		}
    })
//确认密码
    $("#list1 li #inp3").keyup(function(){
    	var val = $(this).val();
    	var val1 = $("#inp2").val();
    	if(val == val1){
    		$(this).parent().find("img").show().parent().find("span").hide();
			flag3 = true;
    	}
    	else{
    		$(this).parent().find("span").show().parent().find("img").hide()
			flag3 = false;
    	}
    })
//邮箱验证
     $("#list2 li #inp4").keyup(function(){
    	var reg = /^(\w)+(\.\w+)*@(\w)+((\.\w+)+)$/;
    	var val = $(this).val();
    	if(reg.test(val)){
    		$(this).parent().find("img").show().parent().find("span").hide();
			flag4 = true;
    	}
    	else{
    		$(this).parent().find("span").show().parent().find("img").hide()
			flag4 = false;
    	}
    })
//邮箱密码
     $("#list2 li #inp5").keyup(function(){
		var reg = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,24}$/;
		var val = $(this).val();
		if($(this).val().length<8 || $(this).val().length>24){
			$(this).parent().find("span").show().parent().find("img,i").hide();
			flag5 = false;
		}
		else if($(this).val().length>8 && $(this).val().length<24){
			if(reg.test(val)){
			    $(this).parent().find("img").show().parent().find("span,i").hide();
				flag5 = true;
			}
			else{
				$(this).parent().find("i").show().parent().find("span,img").hide();
				flag5 = false;
		    }
		}
    })
//邮箱密码确认
    $("#list2 li #inp6").keyup(function(){
    	var val = $(this).val();
    	var val1 = $("#inp5").val();
    	if(val == val1){
    		$(this).parent().find("img").show().parent().find("span").hide();
			flag6 = true;
    	}
    	else{
    		$(this).parent().find("span").show().parent().find("img").hide()
			flag6 = false;
    	}
    })

//手机页面注册账号
	$("#list1 .send2").click(function(){
		//ajax
		console.log("ddd");
		if(flag1 &&flag2 &&flag3 ){
			var xhr = new XMLHttpRequest();
			xhr.open("post", "http://localhost/handu/PHP/register.php", true);
			xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			var str = "username="+$("#inp1").val()   + "&pwd="+$("#inp2").val()  + "&repwd="+$("#inp3").val();
			console.log(str);
			xhr.send(str);
			xhr.onreadystatechange = function () {
				if (xhr.readyState==4 && xhr.status==200) {
					console.log(xhr.responseText);
					var obj = JSON.parse(xhr.responseText);
					if(obj.status == 1){
						location.href="../html/lander.html"
					}
				}
			}
		}
	})
//邮箱页面注册账号
	$("#list2 .send2").click(function(){
		if(flag4 && flag5 && flag6){
			var xhr = new XMLHttpRequest();
			xhr.open("post", "http://localhost/handu/PHP/register2.php", true);
			xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			var str = "email="+$("#inp4").val()   + "&pwd="+$("#inp5").val()  + "&repwd="+$("#inp6").val();
			console.log(str);
			xhr.send(str);
			xhr.onreadystatechange = function () {
				if (xhr.readyState==4 && xhr.status==200) {
					console.log(xhr.responseText);
					var obj = JSON.parse(xhr.responseText);
					if(obj.status == 1){
						location.href="../html/lander.html"
					}
				}
			}
		}
	})
})





