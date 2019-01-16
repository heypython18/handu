from django.conf.urls import url

from handuapp import views

urlpatterns = [
    url(r'^addcart/$',views.addcart,name='addcart'),

    url(r'^$',views.index,name='handugroup'),
    url(r'^register/$',views.register,name='register'),

    #登录
    url(r'^lander/$',views.lander,name='lander'),

    #购物车
    url(r'^cart/$',views.cart,name='cart'),

    #注册
    url(r'^details/(\d+)/$',views.details,name='details'),

    #退出
    url(r'logout/$',views.logout,name= 'logout'),
]