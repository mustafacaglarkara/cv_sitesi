from django.shortcuts import render

# Create your views here.


def index(request):
    context = {
        'title': "Anasayfa",
        'isim': "Mustafa Çağlar KARA"
    }
    return render(request, 'index.html', context)

