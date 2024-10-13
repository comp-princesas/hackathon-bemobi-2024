from django.contrib.auth.hashers import make_password
from django.http import JsonResponse
from django.shortcuts import render
from django.views import View
from .models import User

class RegisterView(View):
    def get(self, request):
        return render(request, 'myapp/register.html')

    def post(self, request):
        # Obtendo dados do formulário
        email = request.POST.get('email')
        password = request.POST.get('password')

        # Verifique se os dados estão presentes
        if not email or not password:
            return JsonResponse({'error': 'Email and password are required.'}, status=400)

        # Criptografando a senha antes de salvar
        hashed_password = make_password(password)

        # Salvando o usuário no banco de dados
        user = User.objects.create(email=email, password=hashed_password)

        return JsonResponse({'message': 'User created successfully!'}, status=201)

