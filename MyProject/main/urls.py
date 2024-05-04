from django.urls import path
from .views import *

urlpatterns = [
    path('', home, name="home"),
    path('find_bus', findbus, name="find-bus"),
    path('book', bookings, name="book"),
    path('cancelling', cancellings, name="cancelling"),
    path('see_bookings', seebookings, name="see-bookings"),
    path('signup', signup, name="signup"),
    path('signin', signin, name="signin"),
    path('success', success, name="success"),
    path('sign_out', signout, name="sign-out"),

]
