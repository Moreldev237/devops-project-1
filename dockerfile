# Image Python officielle
FROM python:3.12-slim

# Empêche Python de créer des fichiers .pyc
ENV PYTHONDONTWRITEBYTECODE=1

# Affiche directement les logs dans le terminal
ENV PYTHONUNBUFFERED=1

# Dossier de travail dans le container
WORKDIR /app

# Installer les dépendances système nécessaires à psycopg2
RUN apt-get update && apt-get install -y \
    gcc \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Copier le fichier requirements
COPY requirements.txt .

# Installer les dépendances Python
RUN pip install --no-cache-dir -r requirements.txt

# Copier le code Django
COPY ./django_hello_wolrd /app

# Exposer le port utilisé par Gunicorn
EXPOSE 8000

# Commande de lancement
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "django_hello_wolrd.wsgi:application"]