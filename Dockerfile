# Use an official Ubuntu with Apache2 as a parent image
FROM ubuntu/apache2

# Update the package list and install necessary packages
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    libapache2-mod-wsgi-py3

# Install Flask
RUN pip3 install python3-Flask

# Set the working directory in the container
WORKDIR /var/www/html

# Copy the current directory contents into the container at /var/www/html
COPY ./ /var/www/html/

# Configure Apache2 to serve the Flask application
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
RUN a2enmod wsgi

# Copy Apache configuration file for the Flask app
COPY ./myapp.conf /etc/apache2/sites-available/000-default.conf

# Expose port 80 for Apache2
EXPOSE 80

# Command to run the Flask application
CMD ["python3", "app.py"]
