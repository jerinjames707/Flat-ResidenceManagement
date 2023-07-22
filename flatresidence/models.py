from django.db import models
from django.utils import timezone


class member(models.Model):
    name=models.CharField(max_length=100)
    email=models.CharField(max_length=100)
    phone=models.CharField(max_length=100)
    flat_no=models.CharField(max_length=100)
    typee=models.CharField(max_length=100)
    no_member=models.CharField(max_length=100)
    password=models.CharField(max_length=100)

class staff(models.Model):
    name=models.CharField(max_length=100)
    email=models.CharField(max_length=100)
    phone=models.CharField(max_length=100)
    place=models.CharField(max_length=100)
    password=models.CharField(max_length=100)

class gym_detail(models.Model):
    name=models.CharField(max_length=100)
    time=models.CharField(max_length=100)

class hall_detail(models.Model):
    name=models.CharField(max_length=100)
    time=models.CharField(max_length=100)
    seat=models.CharField(max_length=100)
    details=models.CharField(max_length=100)

class pool_detail(models.Model):
    name=models.CharField(max_length=100)
    time=models.CharField(max_length=100)
    details=models.CharField(max_length=100)

class gym_booking(models.Model):
    name=models.CharField(max_length=100)
    time=models.CharField(max_length=100)
    m_id=models.CharField(max_length=100)
    status=models.CharField(max_length=100)

class hall_booking(models.Model):
    name=models.CharField(max_length=100)
    time=models.CharField(max_length=100)
    m_id=models.CharField(max_length=100)
    seat=models.CharField(max_length=100)
    status=models.CharField(max_length=100)

class pool_booking(models.Model):
    name=models.CharField(max_length=100)
    time=models.CharField(max_length=100)
    m_id=models.CharField(max_length=100)
    status=models.CharField(max_length=100)

class work_assign(models.Model):
    s_id=models.CharField(max_length=100)
    s_name=models.CharField(max_length=100)
    work=models.CharField(max_length=100)
    date=models.CharField(max_length=100)
    status=models.CharField(max_length=100)


class payments(models.Model):
    m_id=models.CharField(max_length=100)
    typee=models.CharField(max_length=100)
    cardtype=models.CharField(max_length=100)
    cardname=models.CharField(max_length=100)
    cardnumber=models.CharField(max_length=100)
    cvv=models.CharField(max_length=100)
    message=models.CharField(max_length=100)
    date = models.DateField(default=timezone.now)
