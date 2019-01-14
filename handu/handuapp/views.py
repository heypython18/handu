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
    username = request.COOKIES.get('username')

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


def register(request):
    if request.method == 'GET':

        return render(request,'register.html')
    elif request.method == 'POST':
        # print(request.POST)
        user = User()
        user.username = request.POST.get('username')
        user.password = request.POST.get('password')
        user.save()

        response = redirect('handuapp:handugroup')
        response.set_cookie('username',user.username)


        return response


def lander(request):
    if request.method == 'GET':
        return render(request,'lander.html')
    elif request.method == 'POST':

        username = request.POST.get('username')
        password = request.POST.get('password')

        users = User.objects.filter(username=username).filter(password=password)
        if users.count():
           response = redirect('handuapp:handugroup')
           response.set_cookie('username',username)
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
    response.delete_cookie('username')
    return response