# Generated by Django 3.2.7 on 2023-07-04 11:36

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('flatresidence', '0004_hall_detail_pool_detail'),
    ]

    operations = [
        migrations.CreateModel(
            name='gym_booking',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
                ('time', models.CharField(max_length=100)),
                ('m_id', models.CharField(max_length=100)),
                ('status', models.CharField(max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='hall_booking',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
                ('time', models.CharField(max_length=100)),
                ('m_id', models.CharField(max_length=100)),
                ('seat', models.CharField(max_length=100)),
                ('status', models.CharField(max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='pool_booking',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
                ('time', models.CharField(max_length=100)),
                ('m_id', models.CharField(max_length=100)),
                ('status', models.CharField(max_length=100)),
            ],
        ),
    ]
