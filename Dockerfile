FROM python:3.11.7-bookworm

WORKDIR /code

RUN pip3 install --upgrade pip

# Copy requirements file first for caching
COPY requirements.txt requirements.txt

# Install dependencies
RUN pip3 install -r requirements.txt

# Copy all project files to the working directory
COPY . /app

EXPOSE 8080

CMD ["python", "app.py"]
