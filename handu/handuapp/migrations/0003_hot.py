# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2019-01-11 13:49
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('handuapp', '0002_list5'),
    ]

    operations = [
        migrations.CreateModel(
            name='Hot',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('timg', models.CharField(max_length=40)),
                ('name', models.CharField(max_length=40)),
                ('price', models.CharField(max_length=40)),
                ('unit', models.CharField(max_length=40)),
                ('wimg', models.CharField(max_length=40)),
                ('sold', models.CharField(max_length=40)),
            ],
        ),
    ]