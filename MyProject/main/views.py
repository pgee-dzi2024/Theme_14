from django.shortcuts import render, redirect
from .models import User, Bus, Book
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required
from decimal import Decimal
from django.shortcuts import render
from .forms import UserLoginForm, UserRegisterForm


def home(request):
    print('*** page home')
    context = {'title': '', }
    if request.user.is_authenticated:
        print('*** page home Начало')
        context['title'] = 'Начало'
        return render(request, 'main/home.html')
    else:
        print('*** page home Влизане')
        context['title'] = 'Влизане в системата'

        return render(request, 'main/signin.html', context)


@login_required(login_url='signin')
def findbus(request):
    print('*** page findbus')
    context = {}
    if request.method == 'POST':
        source_r = request.POST.get('source')
        dest_r = request.POST.get('destination')
        date_r = request.POST.get('date')
        bus_list = Bus.objects.filter(source=source_r, dest=dest_r, date=date_r)
        if bus_list:
            return render(request, 'main/list.html', locals())
        else:
            context["error"] = "Sorry no buses availiable"
            return render(request, 'main/findbus.html', context)
    else:
        return render(request, 'main/findbus.html')


@login_required(login_url='signin')
def bookings(request):
    print('*** page bookings')
    context = {}
    if request.method == 'POST':
        id_r = request.POST.get('bus_id')
        seats_r = int(request.POST.get('no_seats'))
        bus = Bus.objects.get(id=id_r)
        if bus:
            if bus.rem > int(seats_r):
                name_r = bus.bus_name
                cost = int(seats_r) * bus.price
                source_r = bus.source
                dest_r = bus.dest
                nos_r = Decimal(bus.nos)
                price_r = bus.price
                date_r = bus.date
                time_r = bus.time
                username_r = request.user.username
                email_r = request.user.email
                userid_r = request.user.id
                rem_r = bus.rem - seats_r
                Bus.objects.filter(id=id_r).update(rem=rem_r)
                book = Book.objects.create(name=username_r, email=email_r, userid=userid_r, bus_name=name_r,
                                           source=source_r, busid=id_r,
                                           dest=dest_r, price=price_r, nos=seats_r, date=date_r, time=time_r,
                                           status='B')
                print('------------book id-----------', book.id)
                # book.save()
                return render(request, 'main/bookings.html', locals())
            else:
                context["error"] = "Sorry select fewer number of seats"
                return render(request, 'main/findbus.html', context)

    else:
        return render(request, 'main/findbus.html')


@login_required(login_url='signin')
def cancellings(request):
    print('*** page cancellings')
    context = {}
    if request.method == 'POST':
        id_r = request.POST.get('bus_id')
        # seats_r = int(request.POST.get('no_seats'))

        try:
            book = Book.objects.get(id=id_r)
            bus = Bus.objects.get(id=book.busid)
            rem_r = bus.rem + book.nos
            Bus.objects.filter(id=book.busid).update(rem=rem_r)
            #nos_r = book.nos - seats_r
            Book.objects.filter(id=id_r).update(status='CANCELLED')
            Book.objects.filter(id=id_r).update(nos=0)
            return redirect(seebookings)
        except Book.DoesNotExist:
            context["error"] = "Sorry You have not booked that bus"
            return render(request, 'main/error.html', context)
    else:
        return render(request, 'main/findbus.html')


@login_required(login_url='signin')
def seebookings(request, new={}):
    print('*** page seebookings')
    context = {}
    id_r = request.user.id
    book_list = Book.objects.filter(userid=id_r)
    if book_list:
        return render(request, 'main/booklist.html', locals())
    else:
        context["error"] = "Sorry no buses booked"
        return render(request, 'main/findbus.html', context)


def signup(request):
    print('*** page signup')
    context = {}
    if request.method == 'POST':
        name_r = request.POST.get('name')
        email_r = request.POST.get('email')
        password_r = request.POST.get('password')
        user = User.objects.create_user(name_r, email_r, password_r, )
        if user:
            login(request, user)
            return render(request, 'main/thank.html')
        else:
            context["error"] = "Provide valid credentials"
            return render(request, 'main/signup.html', context)
    else:
        return render(request, 'main/signup.html', context)


def signin(request):
    print('*** page signin')
    context = {'title': 'Влизане в системата', }
    if request.method == 'POST':
        print('*** page signin POST')
        name_r = request.POST.get('name')
        password_r = request.POST.get('password')
        user = authenticate(request, username=name_r, password=password_r)
        if user:
            login(request, user)
            # username = request.session['username']
            context["user"] = name_r
            context["id"] = request.user.id
            print('*** page signin user')
            return render(request, 'main/home.html', context)
            # return HttpResponseRedirect('success')
        else:
            print('*** page signin not user')
            context["error"] = "Неправилно име и/или парола"
            return render(request, 'main/signin.html', context)
    else:
        print('*** page signin not POST')
        context["error"] = "Не сте влезли в системата"
        return render(request, 'main/signin.html', context)


def signout(request):
    print('*** page signout')
    context = {'title': 'Повторно влизане в системата', }
    logout(request)
    context['error'] = "Вие излязохте от системата! "
    return render(request, 'main/signin.html', context)


def success(request):
    print('*** page success')
    context = {'title': 'Успех', }
    context['user'] = request.user
    return render(request, 'main/success.html', context)
