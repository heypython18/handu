import hashlib
import random
import time

from django.http import HttpResponse
from django.shortcuts import render, redirect

# Create your views here.
from handuapp.models import HeadImg, List5, Hot, List2, List3, List4, List, User


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

    return render(request,'cart.html')


def details(request,listid):

    list = List.objects.get(id=listid)


    return render(request,'details.html',{'list':list})


def logout(request):

    response = redirect('handuapp:handugroup')
    # response.delete_cookie('username')

    # response.delete_cookie('sessionid')
    # del request.session['username']

    request.session.flush()

    return response