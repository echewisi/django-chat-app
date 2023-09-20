# Generated by Django 3.2.8 on 2023-09-20 22:19

from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('chat', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='chatroom',
            name='member',
        ),
        migrations.AddField(
            model_name='chatmessage',
            name='read',
            field=models.BooleanField(default=False),
        ),
        migrations.AddField(
            model_name='chatmessage',
            name='read_at',
            field=models.DateTimeField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='chatroom',
            name='members',
            field=models.ManyToManyField(to=settings.AUTH_USER_MODEL),
        ),
    ]
