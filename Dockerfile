FROM ubuntu:16.04

RUN apt-get update && apt-get install -y python python-pip
# Copy requirements file first for caching
COPY requirements.txt requirements.txt

# Install dependencies
RUN pip install -r requirements.txt

# Copy all project files to the working directory
COPY . /opt/
ENTRYPOINT FLASK_APP=/opt/app.py flask run --host=0.0.0.0 --port=8080
