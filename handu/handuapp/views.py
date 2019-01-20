import hashlib
import random
import time

from django.http import HttpResponse, JsonResponse
from django.shortcuts import render, redirect

# Create your views here.
from django.views.decorators.csrf import csrf_exempt

from handuapp.alipay import alipay
from handuapp.models import HeadImg, List5, Hot, List2, List3, List4, List, User, Cart, Order, OrderGoods


def index(request):

    headimg =HeadImg.objects.all()
    list5 = List5.objects.all()
    hot = Hot.objects.all()
    list2 = List2.objects.all()
    list3 = List3.objects.all()
    list4 = List4.objects.all()
    list = List.objects.all()
    # username = request.COOKIES.get('username')
    # username = request.session.get('username')
    token = request.session.get('token')
    users = User.objects.filter(token=token)

    if users.count():
        user = users.first()
        username = user.username

    else:
        username = None


    data = {
        'headimg':headimg,
        'list5':list5,
        'hot':hot,
        'list2':list2,
        'list3': list3,
        'list4': list4,
        'list':list,
        'username':username
    }

    return render(request,'handu Group.html',context=data)


def generate_token():

    token =str(time.time())+ str(random.random())
    md5 = hashlib.md5()
    md5.update(token.encode('utf-8'))

    return md5.hexdigest()


def generate_password(password):
    sha = hashlib.sha256()
    sha.update(password.encode('utf-8'))
    return sha.hexdigest()


def register(request):
    if request.method == 'GET':

        return render(request,'register.html')
    elif request.method == 'POST':
        # print(request.POST)
        user = User()
        user.username = request.POST.get('username')


        user.password = generate_password(request.POST.get('password'))


        user.token = generate_token()


        user.save()


        response = redirect('handuapp:handugroup')
        # response = redirect('handuapp:handugroup')
        # response.set_cookie('username',user.username)

        # request.session['username'] = user.username
        request.session['token'] = user.token
        return response


def lander(request):
    if request.method == 'GET':
        return render(request,'lander.html')
    elif request.method == 'POST':

        username = request.POST.get('username')
        password = generate_password(request.POST.get('password'))

        users = User.objects.filter(username=username).filter(password=password)
        if users.count():
           response = redirect('handuapp:handugroup')
           # response.set_cookie('username',username)

           # request.session['username'] = username
           # request.session.set_expiry(0)

           user = users.first()
           user.token = generate_token()
           user.save()
           request.session['token'] = user.token
           request.session.set_expiry(0)



           return response
        else:

            return render(request,'lander.html',context={'err':'用户名或密码错误'})


def cart(request):
    token = request.session.get('token')
    if token:
        user = User.objects.get(token=token)
        carts = Cart.objects.filter(user=user).exclude(number=0)

        data = {
            'carts':carts
        }
        return render(request,'cart.html',context=data)
    else:
        return redirect('handuapp:lander')


def details(request,listid):
    token = request.session.get('token')
    users = User.objects.filter(token=token)


    if users.count():
        user = users.first()
        username = int(user.username)

    else:
        username = None

    #获取购物车信息
    token = request.session.get("token")
    carts =[]
    if token:
        user = User.objects.get(token=token)
        carts = Cart.objects.filter(user=user)





    list = List.objects.get(id=listid)

    data = {
        'list': list,
        'username':username,
        'carts':carts,
    }


    return render(request,'details.html',data)


def logout(request):

    response = redirect('handuapp:handugroup')
    # response.delete_cookie('username')

    # response.delete_cookie('sessionid')
    # del request.session['username']

    request.session.flush()

    return response


def addcart(request):
    token = request.session.get('token')

    if token: #加操作
        user = User.objects.get(token=token)
        goodsid = request.GET.get('goodsid')
        goods = List.objects.get(pk=goodsid)

        #第一次操作：添加一条新记录
        #后续操作：只需修改number



        #判断该商品是否存在
        carts = Cart.objects.filter(user=user).filter(list1=goods)
        if carts.exists():
            cart = carts.first()
            cart.number = cart.number + 1
            cart.save()
        else:
            cart = Cart()
            cart.user = user
            cart.list1= goods
            cart.number = 1
            cart.save()
        return JsonResponse({'msg':'{}添加购物车成功!'.format(goods.name),'status':1,'number':cart.number})
    else:   #跳转到登录

        #ajax 用于数据传输
        #服务端不能使用重定向
        return JsonResponse({'msg':'请登录后操作','status':0})

def subcart(request): #减操作
    token = request.session.get('token')
    user = User.objects.get(token=token)
    goodsid = request.GET.get('goodsid')
    goods = List.objects.get(pk=goodsid)


    cart = Cart.objects.filter(user=user).filter(list1=goods).first()

    cart.number = cart.number -1
    cart.save()

    responseData = {
        'msg':'{}-商品删减成功'.format(goods.name),
        'status':1,
        'number':cart.number
    }
    return JsonResponse(responseData)


def changecartstatus(request):
    cartid = request.GET.get('cartid')
    cart = Cart.objects.get(pk=cartid)
    cart.isselect = not cart.isselect
    cart.save()

    data = {
        'msg':'状态修改成功',
        'status':1,
        'isselect':cart.isselect
    }
    return JsonResponse(data)


def changecartall(request):
    token = request.session.get('token')
    user = User.objects.get(token=token)


    isall = request.GET.get('isall')

    if isall == 'true':
        isall = True
    else:
        isall = False
    print(isall)
    carts = Cart.objects.filter(user=user).update(isselect = isall)

    data = {
        'msg': '状态修改成功',
        'status': 1,

    }
    return JsonResponse(data)

#生成订单
def generate_identifire():
    tempstr = str(time.time())+str(random.random())

    return tempstr


def generateorder(request):
    token = request.session.get('token')
    print(token)
    user = User.objects.get(token=token)
    print(user)
    # 订单
    order = Order()
    order.user = user
    order.identifier = generate_identifire()
    order.save()

    # 订单商品
    carts = Cart.objects.filter(user=user).filter(isselect=True).exclude(number=0)
    # 只有选中的商品，才是添加到订单中，从购物车中删除
    for cart in carts:
        orderGoods = OrderGoods()
        orderGoods.order = order
        orderGoods.goods = cart.list1
        orderGoods.number = cart.number
        orderGoods.save()

        # 从购物车中删除
        cart.delete()

    data = {
        'msg': '下单成功',
        'status': 1,
        'identifier': order.identifier
    }

    return JsonResponse(data)


def orderdetail(request, identifier):
    order = Order.objects.get(identifier=identifier)

    return render(request, 'orderdetail.html', context={'order': order})




@csrf_exempt
def appnotify(request):
    # http://112.74.55.3/axf/returnview/?charset=utf-8&out_trade_no=15477988300.6260414050156342&method=alipay.trade.page.pay.return&total_amount=93.00&sign=oaTJZPDeswBfEbQGkBND8w8DDOWGMdz8lw6TlL25Sp73TZtTBqUBx2vazVi5sI6pFLSgfF%2FRsxsiY20S5UzZeCJ5hfrGXp4NCg6ZpZE%2FWS1CsMnI74lO%2F8ttTx1j%2FzfhrJJuTIHJ503Z1wiDZoXHer91ynI%2FCTLn8W0de2fVhnBi5hTo7MJHJBZQnVQ%2BnFJ73cKBB16xdIJ15ISVUrYYi%2FUGJr2jh%2BllGiiTVm4o0maDuYH3ljuGVxAI4yvP%2BevAfo7B2MK%2F1BW3%2FVu8JRLatEIqeyV2Qk87%2F%2FGRndFRjRDuuZMU8zzix0eg0oKYVeBmfOnRPXhMFAs8dGPedC1D2Q%3D%3D&trade_no=2019011822001416700501217055&auth_app_id=2016091800542542&version=1.0&app_id=2016091800542542&sign_type=RSA2&seller_id=2088102176233911&timestamp=2019-01-18+16%3A08%3A08

    # 获取订单号，并且修改订单状态
    if request.method == 'POST':
        from urllib.parse import parse_qs
        body_str = request.body.decode('utf-8')
        post_data = parse_qs(body_str)
        post_dir = {}

        print(body_str)
        print(post_data)
        print(post_data.items())
        for key, value in post_data.items():
            post_dir[key] = value[0]

        out_trade_no = post_dir['out_trade_no']
        print(out_trade_no)

        # 更新状态
        Order.objects.filter(identifier=out_trade_no).update(status=1)

        return JsonResponse({'msg': 'success'})


def returnview(request):

    return redirect('axf:mine')


def pay(request):
    identifier = request.GET.get('identifier')
    order = Order.objects.get(identifier=identifier)

    sum = 0
    for orderGoods in order.ordergoods_set.all():
        sum += int(orderGoods.goods.price) * orderGoods.number

    # 支付地址
    url = alipay.direct_pay(
        subject='MacBookPro - 2019款',  # 支付宝页面显示的标题
        out_trade_no=identifier,  # AXF订单编号
        total_amount=str(sum),  # 订单金额
        return_url='http://112.74.55.3/axf/returnview/'
    )

    # 拼接上支付网关
    alipayurl = 'https://openapi.alipaydev.com/gateway.do?{data}'.format(data=url)

    return JsonResponse({'alipayurl': alipayurl, 'status': 1})