# Generated by Django 3.2.7 on 2023-07-22 07:12

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('flatresidence', '0007_payments'),
    ]

    operations = [
        migrations.CreateModel(
            name='announcement_detail',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('announcement', models.CharField(max_length=100)),
                ('date', models.CharField(max_length=100)),
            ],
        ),
    ]