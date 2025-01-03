# Use an official Python runtime as a parent image 
FROM ubuntu/apache2 

# Update the package list and install necessary packages 

RUN apt-get update && apt-get install -y \ 
python3 \ 
python3-pip \ 
python3-flask

# Install Flask 
RUN pip3 install Flask

# Copy the current directory contents into the container at /var/www/html 
COPY ./ /var/www/html/
