from django.db import models


# Автобус(автобусна линия).
class Bus(models.Model):
    bus_name = models.CharField('Име на линията', max_length=30)
    source = models.CharField('Начална спирка', max_length=30)
    dest = models.CharField('Крайна спирка', max_length=30)
    nos = models.DecimalField('Брой места в автобуса', decimal_places=0, max_digits=2)
    rem = models.DecimalField('Брой свободни места', decimal_places=0, max_digits=2)
    price = models.DecimalField('Цена', decimal_places=2, max_digits=6)
    date = models.DateField('Дата')
    time = models.TimeField('Час на тръгване')

    def __str__(self):
        return self.bus_name

    class Meta:
        verbose_name = 'Автобус'
        verbose_name_plural = 'Автобуси'


# Клиенти
class User(models.Model):
    user_id = models.AutoField(primary_key=True)
    email = models.EmailField('e-mail')
    name = models.CharField('Име', max_length=30)
    password = models.CharField('Парола', max_length=30)

    def __str__(self):
        return self.email

    class Meta:
        verbose_name = 'Клиент'
        verbose_name_plural = 'Клиенти'


# Резервации
class Book(models.Model):
    BOOKED = 'B'
    CANCELLED = 'C'

    TICKET_STATUS = (
        (BOOKED, 'Запазено'),
        (CANCELLED, 'Отказано'),
    )
    email = models.EmailField(verbose_name='e-mail')
    name = models.CharField(verbose_name='Име', max_length=30)
    userid = models.DecimalField('Клиент id', decimal_places=0, max_digits=2)
    busid = models.DecimalField('Автобус id', decimal_places=0, max_digits=2)
    bus_name = models.CharField(verbose_name='Автобус - име', max_length=30)
    source = models.CharField(verbose_name='Начална спирка',  max_length=30)
    dest = models.CharField(verbose_name='Крайна спирка',  max_length=30)
    nos = models.DecimalField('Брой места',  decimal_places=0, max_digits=2)
    price = models.DecimalField('Цена',  decimal_places=2, max_digits=6)
    date = models.DateField(verbose_name='Дата')
    time = models.TimeField(verbose_name='Час на тръгване')
    status = models.CharField(verbose_name='Състояние', choices=TICKET_STATUS, default=BOOKED, max_length=2)

    def __str__(self):
        return self.email

    class Meta:
        verbose_name = 'Резервация'
        verbose_name_plural = 'Резервации'
