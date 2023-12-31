# Base Image
FROM python:3.11-bullseye

# Create a directory in the container
WORKDIR /app
# copy 
COPY /src /app

# Copy the requirements file
COPY requirements.txt /app

# Upgrade pip
# Install apache airflow with subpackages
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r /app/requirements.txt
