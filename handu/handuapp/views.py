from django.shortcuts import render

# Create your views here.
from handuapp.models import HeadImg, List5, Hot, List2, List3, List4


def index(request):

    headimg =HeadImg.objects.all()
    list5 = List5.objects.all()
    hot = Hot.objects.all()
    list2 = List2.objects.all()
    list3 = List3.objects.all()
    list4 = List4.objects.all()

    data = {
        'headimg':headimg,
        'list5':list5,
        'hot':hot,
        'list2':list2,
        'list2': list3,
        'list2': list4,
    }

    return render(request,'handu Group.html',context=data)