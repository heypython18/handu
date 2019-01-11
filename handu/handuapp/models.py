from django.db import models

# Create your models here.
class HeadImg(models.Model):

    headimg = models.CharField(max_length=200)

class List5(models.Model):

    price = models.CharField(max_length=60)
    unit = models.CharField(max_length=60)
    text = models.CharField(max_length=60)
    himg = models.CharField(max_length=200)