from django.shortcuts import render

# Create your views here.
from handuapp.models import HeadImg, List5


def index(request):

    headimg =HeadImg.objects.all()
    list5 = List5.objects.all()

    return render(request,'handu Group.html',context={'headimg':headimg,'list5':list5})