$(function(){

 //默认减号 数字隐藏【存在问题】
    // $('.goods-count .reduce').hide()
    // $('.goods-count .val').hide()

    //如果number是有值的，表示已经添加在购物车 【减号和数字就显示】
    // $('.goods-count .val').each(function () {
    //     var num = parseInt($(this).html())
    //     if (num){
    //         $(this).prev().show()
    //         $(this).show()
    //     }else {
    //         $(this).prev().hide()
    //         $(this).hide()
    //     }
    // })

    //商品加操作
    $('.product-number .add').click(function () {
        console.log('加操作')

        //加入购物车：谁、商品、加入购物车
        //用户？ 状态保持（必须登录）
        //商品？ 商品ID，添加一个自定义属性
        var goodsid = $(this).attr('goodsid')

        // console.log(goodsid)

        var $that = $(this)
        data = {
            'goodsid': goodsid,
        }
        $.get('/addcart/', data, function (response) {
            console.log(response)
            if (response.status == 0) {
                window.open('/lander/', target = '_self')
            } else if (response.status == 1) {	//加操作成功
                $that.prev().show().val(response.number)
                $that.prev().prev().show()
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
                    $that.next().hide()
                    $that.hide()

                }
            }
        })

    })
    //选择
    $('.cartlist #list .confirm-wrapper').click(function () {
        //谁，商品，(哪条记录）
        // console.log('dddd')
        var cartid = $(this).attr('goodsid')
        var $span = $(this).find('input')
        data = {
            'cartid':cartid
        }
        //发起ajax
        $.get('/changecartstatus/',data,function (response) {
            console.log(response)
            if(response.status){
                if (response.isselect) {
                    console.log('aaaaa')
                    $span.attr("check",true)
                }else {
                    $span.attr("check",false)
                    console.log('bbbbbb')
                }
            }
        })
    })

    //全选操作
    $('.total2 .all').click(function () {
        var isall = $(this).attr('isall')
        isall = (isall=='true')? true:false
        isall = !isall
        $(this).attr('isall',isall)
        // console.log(isall,'aaa')
        data = {
            'isall':isall
        }


        $.get('/changecartall/',data,function (response) {
            console.log(response)
            if (response.status == 1){
                $('.cartlist #list .confirm-wrapper').each(function () {
                    if (isall){
                       $('.confirm-wrapper').prop("checked",true)

                    }else {
                        $('.confirm-wrapper').prop("checked",false)
                    }
                })
            }
        })
    })



	    $('.goshopping-r').click(function () {
	        console.log('aaa')
            $.get('/generateorder/', function (response) {
                console.log('bbb')
                console.log(response)
                if (response.status == 1){  // 订单详情页
                    window.open('http://47.112.30.100/orderdetail/' + response.identifier + '/', target='_self')
                }
            })
    })
})