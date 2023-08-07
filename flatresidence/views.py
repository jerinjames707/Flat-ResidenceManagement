from django.http import HttpResponse,HttpResponseRedirect
from django.shortcuts import render
from django.shortcuts import redirect
from django.urls import reverse
from  django.core.files.storage import FileSystemStorage
import datetime
import pycurl
from urllib.parse import urlencode
from .models import *

def first(request):
    return render(request,'index.html')

def index(request):
    return render(request,'index.html')

def register(request):
    return render(request,'register.html')


def adduser(request):
    if request.method == 'POST':
        name = request.POST.get('name')
        email = request.POST.get('email')
        phone = request.POST.get('phone')
        flat_no = request.POST.get('flat_no')
        typee = request.POST.get('typee')
        no_member = request.POST.get('no_member')
        password = request.POST.get('password')

        # Check if the email already exists in the member table
        if member.objects.filter(email=email).exists():
            # Email already exists, display an alert message
            return render(request, 'index.html', {'message': 'Email already exists. Please use a different email.'})

        # Email is unique, proceed with inserting the data into the table
        ins = member(name=name, email=email, phone=phone, flat_no=flat_no, typee=typee, password=password, no_member=no_member)
        ins.save()

        return render(request, 'index.html', {'message': 'Successfully Registered'})

    return render(request, 'index.html')






def login(request):
    return render(request,'login.html')


def addlogin(request):
    email = request.POST.get('email')
    password = request.POST.get('password')
    if email == 'admin@gmail.com' and password =='admin':
        request.session['logintdetail'] = email
        request.session['admin'] = 'admin'
        return redirect(index)

    elif member.objects.filter(email=email,password=password).exists():
        userdetails=member.objects.get(email=request.POST['email'], password=password)
        if userdetails.password == request.POST['password']:
            request.session['mid'] = userdetails.id
            request.session['mname'] = userdetails.name
            request.session['mtype'] = userdetails.typee 

            request.session['memail'] = email
            return redirect(index)
    elif staff.objects.filter(email=email,password=password).exists():
        userdetails=staff.objects.get(email=request.POST['email'], password=password)
        if userdetails.password == request.POST['password']:
            request.session['sid'] = userdetails.id
            request.session['sname'] = userdetails.name

            request.session['semail'] = email


            return redirect(index)

    
    else:
        return render(request, 'login.html', {'message4':'Invalid Email or Password'})
    
def logout(request):
    session_keys = list(request.session.keys())
    for key in session_keys:
        del request.session[key]
    return redirect(first)



def staff_register(request):
    return render(request,'staff_register.html')

def addstaff(request):
    if request.method=='POST':
        name=request.POST.get('name')
        email=request.POST.get('email')
        phone=request.POST.get('phone')
        place=request.POST.get('place')
        password=request.POST.get('password')

        if staff.objects.filter(email=email).exists():
            # Email already exists, display an alert message
            return render(request, 'index.html', {'message': 'Email already exists. Please use a different email.'})

        ins=staff(name=name,email=email,phone=phone,place=place,password=password)
        ins.save()

        return render(request,'index.html',{'message':'Successfully Registered'})
    
    return render(request,'index.html')


def gym(request):
    return render(request,'gym.html')

def addgym(request):
    if request.method=='POST':
        name=request.POST.get('name')
        time=request.POST.get('time')
    
        ins=gym_detail(name=name,time=time)
        ins.save()
    return render(request,'index.html',{'message':'Successfully Registered'})

def announcement(request):
    return render(request,'announcement.html')

def addannouncement(request):
    if request.method=='POST':
        announcement=request.POST.get('announcement')
        date=request.POST.get('date')
    
        ins=announcement_detail(announcement=announcement,date=date)
        ins.save()
    return render(request,'index.html',{'message':'Successfully Registered'})



def view_announcement(request):
    a=announcement_detail.objects.all()
    return render(request,'view_announcement.html',{'result':a})

def hall(request):
    return render(request,'hall.html')

def addhall(request):
    if request.method=='POST':
        name=request.POST.get('name')
        time=request.POST.get('time')
        seat=request.POST.get('seat')
        details=request.POST.get('details')
    
        ins=hall_detail(name=name,time=time,seat=seat,details=details)
        ins.save()
    return render(request,'index.html',{'message':'Successfully Registered'})

def pool(request):
    return render(request,'pool.html')

def addpool(request):
    if request.method=='POST':
        name=request.POST.get('name')
        time=request.POST.get('time')
        details=request.POST.get('details')
    
        ins=pool_detail(name=name,time=time,details=details)
        ins.save()
    return render(request,'index.html',{'message':'Successfully Registered'})

def viewgym(request):
    a=gym_detail.objects.all()
    return render(request,'viewgym.html',{'result':a})

def viewhall(request):
    a=hall_detail.objects.all()
    return render(request,'viewhall.html',{'result':a})

def viewpool(request):
    a=pool_detail.objects.all()
    return render(request,'viewpool.html',{'result':a})

def bookgym(request,id):
    a=gym_detail.objects.get(id=id)
    return render(request,'bookgym.html',{'result':a})

def addbookgym(request):
    if request.method=='POST':
        name=request.POST.get('name')
        time=request.POST.get('time')
        m_id=request.session['mid']  
        ins=gym_booking(name=name,time=time,m_id=m_id,status='pending')
        ins.save()
    return render(request,'index.html',{'message':'Successfully Booked'})

def view_gymbooking(request):
    a=gym_booking.objects.all()
    user3= member.objects.all()
    for i in a:
        for j in user3:
            if str(i.m_id)==str(j.id):
               i.m_id=j.name 
    return render(request,'view_gymbooking.html',{'result':a})

def accept_gym(request,id):
    sel=gym_booking.objects.get(id=id)
    a=sel.name
    b=sel.time
    c=sel.m_id
   
    upd=gym_booking(name=a,time=b,m_id=c,status='approved',id=id)
    upd.save()
    return redirect(view_gymbooking)

def reject_gym(request,id):
    sel=gym_booking.objects.get(id=id)
    a=sel.name
    b=sel.time
    c=sel.m_id
   
    upd=gym_booking(name=a,time=b,m_id=c,status='Rejected',id=id)
    upd.save()
    return redirect(view_gymbooking)

def bookhall(request,id):
    a=hall_detail.objects.get(id=id)
    return render(request,'bookhall.html',{'result':a})

def addhallbook(request):
    if request.method=='POST':
        name=request.POST.get('name')
        time=request.POST.get('time')
        seat=request.POST.get('seat')
        m_id=request.session['mid']  
        ins=hall_booking(name=name,time=time,m_id=m_id,status='pending',seat=seat)
        ins.save()
    return render(request,'index.html',{'message':'Successfully Booked'})



def view_hallbooking(request):
    a=hall_booking.objects.all()
    user3= member.objects.all()
    for i in a:
        for j in user3:
            if str(i.m_id)==str(j.id):
               i.m_id=j.name 
    return render(request,'view_hallbooking.html',{'result':a})

def accept_hall(request,id):
    sel=hall_booking.objects.get(id=id)
    a=sel.name
    b=sel.time
    c=sel.m_id
    d=sel.seat
   
    upd=hall_booking(name=a,time=b,m_id=c,seat=d,status='approved',id=id)
    upd.save()
    return redirect(view_hallbooking)

def reject_hall(request,id):
    sel=hall_booking.objects.get(id=id)
    a=sel.name
    b=sel.time
    c=sel.m_id
    d=sel.seat

    upd=hall_booking(name=a,time=b,m_id=c,seat=d,status='Rejected',id=id)
    upd.save()
    return redirect(view_hallbooking)

def bookpool(request,id):
    a=pool_detail.objects.get(id=id)
    return render(request,'bookpool.html',{'result':a})

def addpoolbook(request):
    if request.method=='POST':
        name=request.POST.get('name')
        time=request.POST.get('time')
        m_id=request.session['mid']  
        ins=pool_booking(name=name,time=time,m_id=m_id,status='pending')
        ins.save()
    return render(request,'index.html',{'message':'Successfully Booked'})

def view_poolbooking(request):
    a=pool_booking.objects.all()
    user3= member.objects.all()
    for i in a:
        for j in user3:
            if str(i.m_id)==str(j.id):
               i.m_id=j.name 
    return render(request,'view_poolbooking.html',{'result':a})

def accept_pool(request,id):
    sel=pool_booking.objects.get(id=id)
    a=sel.name
    b=sel.time
    c=sel.m_id
   
    upd=pool_booking(name=a,time=b,m_id=c,status='approved',id=id)
    upd.save()
    return redirect(view_poolbooking)

def reject_pool(request,id):
    sel=pool_booking.objects.get(id=id)
    a=sel.name
    b=sel.time
    c=sel.m_id

    upd=pool_booking(name=a,time=b,m_id=c,status='Rejected',id=id)
    upd.save()
    return redirect(view_poolbooking)

def profile(request):
    p=request.session['mid']
    a=member.objects.get(id=p)
    return render(request,'profile.html',{'result':a})

def update(request,id):
    a=member.objects.get(id=id)
    return render(request,'update.html',{'result':a})

def updateprofile(request,id):
    if request.method=='POST':
        name=request.POST.get('name')
        email=request.POST.get('email')
        phone=request.POST.get('phone')
        flat_no=request.POST.get('flat_no')
        typee=request.POST.get('typee')
        no_member=request.POST.get('no_member')
        password=request.POST.get('password')

        ins=member(name=name,email=email,phone=phone,flat_no=flat_no,typee=typee,password=password,no_member=no_member,id=id)
        ins.save()
    return redirect(profile)

def view_staff(request):
    a=staff.objects.all()
    return render(request,'view_staff.html',{'result':a})


def remove_worker(request,id):
    a=staff.objects.get(id=id)
    a.delete()
    return redirect(view_staff)

def assign_work(request,id):
    a=staff.objects.get(id=id)
    return render(request,'assign_work.html',{'result':a})

def add_assign_work(request):
    if request.method=='POST':
        s_name=request.POST.get('s_name')
        date=request.POST.get('date')
        s_id=request.POST.get('s_id') 
        work=request.POST.get('work') 
        ins=work_assign(s_name=s_name,date=date,s_id=s_id,work=work,status='pending')
        ins.save()
    return render(request,'index.html',{'message':'Successfully Assigned'})

def view_members(request):
    a=member.objects.filter(typee='Renter')
    b=member.objects.filter(typee='Resident')
    return render(request,'view_members.html',{'result':a,'result1':b})

def remove_member(request,id):
    a=member.objects.get(id=id)
    a.delete()
    return redirect(view_members)

def view_works(request):
    s=request.session['sid']
    a=work_assign.objects.filter(s_id=s)
    return render(request,'view_works.html',{'result':a})

def accept_work(request,id):
    sel=work_assign.objects.get(id=id)
    a=sel.s_name
    b=sel.s_id
    c=sel.date
    d=sel.work
   
    upd=work_assign(s_name=a,s_id=b,date=c,work=d,status='accepted',id=id)
    upd.save()
    return redirect(view_works)

def reject_work(request,id):
    sel=work_assign.objects.get(id=id)
    a=sel.s_name
    b=sel.s_id
    c=sel.date
    d=sel.work
   
    upd=work_assign(s_name=a,s_id=b,date=c,work=d,status='Rejected',id=id)
    upd.save()
    return redirect(view_works)

def work_report(request):
    s=request.session['sid']
    a=work_assign.objects.filter(s_id=s,status='accepted')
    return render(request,'work_report.html',{'result':a})

def cmplt_work(request,id):
    sel=work_assign.objects.get(id=id)
    a=sel.s_name
    b=sel.s_id
    c=sel.date
    d=sel.work
   
    upd=work_assign(s_name=a,s_id=b,date=c,work=d,status='completed',id=id)
    upd.save()
    return redirect(work_report)

def payment(request):
    return render(request,'payment.html')

def addpayment(request):
    if request.method=='POST':
        typee=request.POST.get('typee')
        cardtype=request.POST.get('cardtype')
        cardname=request.POST.get('cardname')
        cardnumber=request.POST.get('cardnumber')
        message=request.POST.get('amount')
        cvv=request.POST.get('cvv')
        m_id=request.session['mid']  
        ins=payments(typee=typee,cardtype=cardtype,m_id=m_id,cvv=cvv,cardnumber=cardnumber,message=message,cardname=cardname)
        ins.save()
    return render(request,'index.html',{'message':'Successfully Paied'})

def payments_view(request):
    a=payments.objects.all()
    user3= member.objects.all()
    for i in a:
        for j in user3:
            if str(i.m_id)==str(j.id):
               i.m_id=j.name 
    return render(request,'payments_view.html',{'result':a})

def searchdate(request):
    if request.method == "POST":
        start = request.POST.get('s_date')
        end = request.POST.get('e_date')

        crp = payments.objects.filter(date__range=[start, end])

        user3 = member.objects.all()
        for i in crp:
            for j in user3:
                if str(i.m_id) == str(j.id):
                    i.m_id = j.name

        return render(request, 'payments_view.html', {'result': crp})
    else:
        crp = payments.objects.all()
        user3 = member.objects.all()
        for i in crp:
            for j in user3:
                if str(i.m_id) == str(j.id):
                    i.m_id = j.name
        return render(request, 'payments_view.html', {'result': crp})
    
def search(request):
    if request.method == "POST":
        title = request.POST.get('date')
        #print(title)    
        crp = payments.objects.filter(date=title)
        user3 = member.objects.all()
        for i in crp:
            for j in user3:
                if str(i.m_id) == str(j.id):
                    i.m_id = j.name
        return render(request,'payments_view.html',{'result': crp})
    else:
        crp = payments.objects.all()
        user3 = member.objects.all()
        for i in crp:
            for j in user3:
                if str(i.m_id) == str(j.id):
                    i.m_id = j.name
        return render(request,'payments_view.html',{'result': crp})

def view_workassign(request):
    a=work_assign.objects.all()
    return render(request,'view_workassign.html',{'result':a})

def my_bookings(request):
    m_id=request.session['mid']
    a=hall_booking.objects.filter(m_id=m_id)
    b=gym_booking.objects.filter(m_id=m_id)
    c=pool_booking.objects.filter(m_id=m_id)
    return render(request,'my_bookings.html',{'result':a,'result1':b,'result2':c})

def payhistory(request):
    p=request.session['mid']
    a=payments.objects.filter(m_id=p)
    return render(request,'payhistory.html',{'result':a})

def invoice(request,id):
    pro = payments.objects.get(id=id)
    us = member.objects.get(id=pro.m_id)

    return render(request,'invoice.html',{'result':pro, 'user': us})

def complaint(request):
    return render(request,'complaint.html')

def addcomplaint(request):
    if request.method=='POST':
        issue=request.POST.get('issue')
        detail=request.POST.get('detail')
        m_name=request.session['mname']  
        ins=complaints(issue=issue,detail=detail,m_name=m_name)
        ins.save()
    return render(request,'index.html',{'message':'Successfully Registered'})

def view_complt(request):
    a=complaints.objects.all()
    return render(request,'view_complt.html',{'result':a})


def clear(request,id):
    a=complaints.objects.get(id=id)
    a.delete()
    return redirect(view_complt)