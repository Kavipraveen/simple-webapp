FROM ubuntu:20.04  # Or a newer Python base image

RUN apt-get update && apt-get install -y python3 python3-pip

RUN pip3 install --upgrade pip

# Copy requirements file first for caching
COPY requirements.txt requirements.txt

# Install dependencies
RUN pip3 install -r requirements.txt

# Copy all project files to the working directory
COPY . /opt/

ENTRYPOINT FLASK_APP=/opt/app.py flask run --host=0.0.0.0 --port=8080
