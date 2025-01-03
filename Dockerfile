# Use the official Python image as the base image
FROM python:3.8

# Install Apache2 and mod_wsgi
RUN apt-get update && \
    apt-get install -y apache2 && \
    apt-get install -y libapache2-mod-wsgi-py3 && \
    apt-get clean

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container
COPY . /app

# Install the required Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Enable mod_wsgi module in Apache
RUN a2enmod wsgi

# Expose port 80 (Apache's default port)
EXPOSE 80

# Copy the Apache config file for Flask app (you will need to create this file)
COPY apache-flask.conf /etc/apache2/sites-available/000-default.conf

# Start Apache in the foreground (required by Docker)
CMD ["apache2ctl", "-D", "FOREGROUND"]
