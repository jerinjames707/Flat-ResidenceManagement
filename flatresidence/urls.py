"""flatresidence URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from . import views
from django.conf.urls import url
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('',views.first),
    path('index',views.index),
    path('register',views.register),
    path('adduser',views.adduser),
    path('login/',views.login),
    path('login/addlogin',views.addlogin),
    path('logout/',views.logout),

    path('staff_register',views.staff_register),
    path('addstaff',views.addstaff),

    path('gym',views.gym),
    path('addgym',views.addgym),
    path('hall',views.hall),
    path('addhall',views.addhall),
    path('pool',views.pool),
    path('addpool',views.addpool),
    path('viewgym',views.viewgym),
    path('viewhall',views.viewhall),
    path('viewpool',views.viewpool),
    path('bookgym/<int:id>',views.bookgym),
    path('bookgym/addbookgym',views.addbookgym),
    path('bookhall/<int:id>',views.bookhall ),
    path('bookhall/addhallbook',views.addhallbook ),
    path('bookpool/<int:id>',views.bookpool ),
    path('bookpool/addpoolbook',views.addpoolbook ),

    path('view_gymbooking',views.view_gymbooking),
    path('view_hallbooking',views.view_hallbooking),
    path('view_poolbooking',views.view_poolbooking),

    path('accept_gym/<int:id>',views.accept_gym ),
    path('reject_gym/<int:id>',views.reject_gym ),

    path('accept_hall/<int:id>',views.accept_hall ),
    path('reject_hall/<int:id>',views.reject_hall ),

    path('accept_pool/<int:id>',views.accept_pool ),
    path('reject_pool/<int:id>',views.reject_pool ),

    path('profile',views.profile),
    path('update/<int:id>',views.update ),
    path('update/updateprofile/<int:id>',views.updateprofile ),

    path('view_staff',views.view_staff),
    path('remove_worker/<int:id>',views.remove_worker ),
    path('assign_work/<int:id>',views.assign_work ),
    path('assign_work/add_assign_work',views.add_assign_work ),


    path('view_members',views.view_members),
    path('remove_member/<int:id>',views.remove_member ),
    path('view_works',views.view_works),
    path('accept_work/<int:id>',views.accept_work ),
    path('reject_work/<int:id>',views.reject_work ),

    path('work_report',views.work_report),
    path('cmplt_work/<int:id>',views.cmplt_work),
    path('payment',views.payment),
    path('addpayment',views.addpayment),
    path('view_workassign',views.view_workassign),
    path('payments_view',views.payments_view),
    path('my_bookings',views.my_bookings),
    path('announcement',views.announcement),
    path('addannouncement',views.addannouncement),
    path('view_announcement',views.view_announcement),


    path('admin/', admin.site.urls),
]
