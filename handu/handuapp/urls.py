from django.conf.urls import url

from handuapp import views

urlpatterns = [
    url(r'^addcart/$',views.addcart,name='addcart'),
    url(r'^subcart/$',views.subcart,name='subcart'),

    url(r'^$',views.index,name='handugroup'),
    url(r'^register/$',views.register,name='register'),

    #登录
    url(r'^lander/$',views.lander,name='lander'),

    #购物车
    url(r'^cart/$',views.cart,name='cart'),

    #注册
    url(r'^details/(\d+)/$',views.details,name='details'),

    #退出
    url(r'^logout/$',views.logout,name= 'logout'),

    #修改购物车选中状态
    url(r'^changecartstatus/$',views.changecartstatus,name='changecartstatus'),

    #是否全选
    url(r'^changecartall/$',views.changecartall,name='changecartall'),
    #下单
    url(r'^generateorder/$',views.generateorder,name='generateorder'),
    #支付
    url(r'^orderdetail/(.+)/$',views.orderdetail,name='orderdetail'),

    url(r'^pay/$', views.pay, name='pay'),  # 支付
    url(r'^appnotify/$', views.appnotify, name='appnotify'),  # 支付完成后(服务器)
    url(r'^returnview/$', views.returnview, name='returnview'),  # 买家支付完成后回到AXF哪个页面(客户端)
]