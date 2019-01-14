from django.conf.urls import url

from handuapp import views

urlpatterns = [

    url(r'^$',views.index,name='handugroup'),
    url(r'^register/$',views.register,name='register'),
    url(r'^lander/$',views.lander,name='lander'),
    url(r'^cart/$',views.cart,name='cart'),
    url(r'^details/(\d+)/$',views.details,name='details')

]