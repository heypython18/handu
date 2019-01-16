from django.db import models

# Create your models here.
class HeadImg(models.Model):

    headimg = models.CharField(max_length=200)

class List5(models.Model):

    price = models.CharField(max_length=60)
    unit = models.CharField(max_length=60)
    text = models.CharField(max_length=60)
    himg = models.CharField(max_length=200)

class Hot(models.Model):
    timg = models.CharField(max_length=40)
    name = models.CharField(max_length=40)
    price = models.CharField(max_length=40)
    unit = models.CharField(max_length=40)
    wimg = models.CharField(max_length=40)
    sold = models.CharField(max_length=40)

class List2(models.Model):

    price = models.CharField(max_length=60)
    unit = models.CharField(max_length=60)
    text = models.CharField(max_length=60)
    himg = models.CharField(max_length=200)

class List3(models.Model):

    price = models.CharField(max_length=60)
    unit = models.CharField(max_length=60)
    text = models.CharField(max_length=60)
    himg = models.CharField(max_length=200)

class List4(models.Model):

    price = models.CharField(max_length=60)
    unit = models.CharField(max_length=60)
    text = models.CharField(max_length=60)
    himg = models.CharField(max_length=200)

class List(models.Model):
    price = models.CharField(max_length=30)
    unit = models.CharField(max_length=30)
    text = models.CharField(max_length=30)
    name = models.CharField(max_length=60)
    headimg = models.CharField(max_length=30)
    midimg = models.CharField(max_length=30)
    smallimg1 = models.CharField(max_length=30)
    smallimg2 = models.CharField(max_length=30)
    smallimg3 = models.CharField(max_length=30)
    smallimg4 = models.CharField(max_length=30)
    smallimg5 = models.CharField(max_length=30)


class User(models.Model):
    username = models.CharField(max_length=60)
    password = models.CharField(max_length=255)
    token = models.CharField(max_length=255)


class Cart(models.Model):
    #额外信息（颜色，型号，购买数量）

    #用户
    user = models.ForeignKey(User)

    #商品信息
    list1 = models.ForeignKey(List)
    #商品数量
    number = models.IntegerField()
    #是否选中
    isselect = models.BooleanField(default=True)


