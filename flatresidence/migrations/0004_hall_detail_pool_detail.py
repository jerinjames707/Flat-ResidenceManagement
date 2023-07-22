# Generated by Django 3.2.7 on 2023-07-04 08:40

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('flatresidence', '0003_gym_detail'),
    ]

    operations = [
        migrations.CreateModel(
            name='hall_detail',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
                ('time', models.CharField(max_length=100)),
                ('seat', models.CharField(max_length=100)),
                ('details', models.CharField(max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='pool_detail',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
                ('time', models.CharField(max_length=100)),
                ('details', models.CharField(max_length=100)),
            ],
        ),
    ]
