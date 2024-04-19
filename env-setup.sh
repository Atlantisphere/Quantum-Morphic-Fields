#!/bin/bash

if ! command -v docker &> /dev/null
then
    echo "Docker could not be found. Please install Docker from https://docs.docker.com/get-docker/"
    exit 1
fi

if ! command -v docker-compose &> /dev/null
then
    echo "docker-compose could not be found. Please install Docker Compose from https://docs.docker.com/compose/install/"
    exit 1
fi

if ! command -v python3 &> /dev/null
then
    echo "Python 3 could not be found. Please install Python from https://www.python.org/downloads/"
    exit 1
fi

if ! command -v pip3 &> /dev/null
then
    echo "pip3 could not be found. It is usually installed with Python. Please check your Python installation."
    exit 1
fi

echo "Select your setup type:"
echo "1) Docker Setup"
echo "2) Local Setup"
read -p "Enter choice [1-2]: " setup_choice

case $setup_choice in
    1)
        echo "Setting up Docker environment..."
        docker-compose up -d
        ;;
    2)
        echo "Setting up local environment..."
        python3 -m venv venv
        source venv/bin/activate
        pip3 install -r requirements.txt
        deactivate
        echo "Local setup complete. Activate the virtual environment with 'source venv/bin/activate'."
        ;;
    *)
        echo "Invalid option. Exiting."
        exit 1
        ;;
esac
