FROM python:3.10.7-alpine3.16

# Install system dependencies
RUN apk add --update \
  build-base libffi-dev openssl-dev \
  xmlsec xmlsec-dev \
  && rm -rf /var/cache/apk/*

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file and install Python dependencies
COPY requirements.txt .
RUN pip install --upgrade pip && \
  pip install -r requirements.txt

# Copy your application code to the container
COPY game /app
COPY configs /configs


# Make port 9005 available to the world outside this container
EXPOSE 9005

# Command to run the application
CMD ["python", "app.py"]
