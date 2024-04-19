@echo off
cls

where /q docker
if %errorlevel% neq 0 (
    echo Docker could not be found. Please install Docker from https://docs.docker.com/get-docker/
    exit /b
)

where /q docker-compose
if %errorlevel% neq 0 (
    echo docker-compose could not be found. Please install Docker Compose from https://docs.docker.com/compose/install/
    exit /b
)

where /q python
if %errorlevel% neq 0 (
    echo Python could not be found. Please install Python from https://www.python.org/downloads/
    exit /b
)

where /q pip
set PIP_CMD=pip
if %errorlevel% neq 0 (
    where /q pip3
    if %errorlevel% neq 0 (
        echo pip could not be found. It is usually installed with Python. Please check your Python installation.
        exit /b
    ) else (
        set PIP_CMD=pip3
    )
)

echo Select your setup type:
echo 1) Docker Setup
echo 2) Local Setup
set /p setup_choice=Enter choice [1-2]: 

if "%setup_choice%"=="1" (
    echo Setting up Docker environment...
    docker-compose up -d
) else if "%setup_choice%"=="2" (
    echo Setting up local environment...
    python -m venv venv
    call venv\Scripts\activate
    %PIP_CMD% install -r requirements.txt
    call venv\Scripts\deactivate
    echo Local setup complete. Activate the virtual environment with 'venv\Scripts\activate'.
) else (
    echo Invalid option. Exiting.
    exit /b
)
