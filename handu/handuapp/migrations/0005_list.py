# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2019-01-12 01:59
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('handuapp', '0004_list2_list3_list4'),
    ]

    operations = [
        migrations.CreateModel(
            name='List',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('price', models.CharField(max_length=30)),
                ('unit', models.CharField(max_length=30)),
                ('text', models.CharField(max_length=30)),
                ('name', models.CharField(max_length=30)),
                ('headimg', models.CharField(max_length=30)),
                ('midimg', models.CharField(max_length=30)),
                ('smallimg1', models.CharField(max_length=30)),
                ('smallimg2', models.CharField(max_length=30)),
                ('smallimg3', models.CharField(max_length=30)),
                ('smallimg4', models.CharField(max_length=30)),
                ('smallimg5', models.CharField(max_length=30)),
            ],
        ),
    ]
