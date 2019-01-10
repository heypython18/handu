from django.conf.urls import url

from handuapp import views

urlpatterns = [

    url(r'^$',views.index,name='handugroup'),

]