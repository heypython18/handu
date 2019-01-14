from django.shortcuts import render

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

    data = {
        'headimg':headimg,
        'list5':list5,
        'hot':hot,
        'list2':list2,
        'list3': list3,
        'list4': list4,
        'list':list
    }

    return render(request,'handu Group.html',context=data)


def register(request):
    return render(request,'register.html')


def lander(request):
    return render(request,'lander.html')


def cart(request):
    return render(request,'cart.html')


def details(request,listid):

    list = List.objects.get(id=listid)


    return render(request,'details.html',{'list':list})

