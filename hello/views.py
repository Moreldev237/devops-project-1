from django.shortcuts import render
from django.http import HttpResponse

def hello(request):
    return HttpResponse("<h1>Hello, World! <span> i am NKONGA MOREL aspiring devops engineer </span></h1>" \
    "this is my first project")

