# Generated by Django 3.2.7 on 2023-08-08 09:38

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('flatresidence', '0010_hall_booking_hour'),
    ]

    operations = [
        migrations.CreateModel(
            name='rents',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
                ('m_id', models.CharField(max_length=100)),
                ('amount', models.CharField(max_length=100)),
            ],
        ),
    ]
