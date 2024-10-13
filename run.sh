#!/bin/bash

# Name of the virtual environment
VENV_NAME="venv"

# Create a virtual environment
echo "Creating virtual environment..."
python3 -m venv $VENV_NAME
echo ""

# Activate the virtual environment
echo "Activating virtual environment..."
source $VENV_NAME/bin/activate
echo ""

# Install dependencies from requirements.txt
echo "Installing dependencies from requirements.txt..."
pip install -r requirements.txt
echo ""

# Execute Django commands
echo "Running makemigrations..."
python backend/manage.py makemigrations
echo ""


echo "Running migrate..."
python backend/manage.py migrate
echo ""


echo "Starting Django development server..."
python backend/manage.py runserver
echo -e "\033[1;32mDjango development server is running.\033[0m"

