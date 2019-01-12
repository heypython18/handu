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