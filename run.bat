@echo off

REM Name of the virtual environment
set VENV_NAME=venv

REM Create a virtual environment
echo Creating virtual environment...
python -m venv %VENV_NAME%
echo.

REM Activate the virtual environment
echo Activating virtual environment...
call %VENV_NAME%\Scripts\activate
echo.

REM Install dependencies from requirements.txt
echo Installing dependencies from requirements.txt...
pip install -r requirements.txt
echo.

REM Execute Django commands
echo Running makemigrations...
python backend\manage.py makemigrations
echo.

echo Running migrate...
python backend\manage.py migrate
echo.

echo Starting Django development server...
python backend\manage.py runserver
echo Django development server is running.
