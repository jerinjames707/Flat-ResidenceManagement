# Generated by Django 3.2.7 on 2023-08-08 06:13

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('flatresidence', '0009_complaints'),
    ]

    operations = [
        migrations.AddField(
            model_name='hall_booking',
            name='hour',
            field=models.CharField(default=1, max_length=100),
            preserve_default=False,
        ),
    ]