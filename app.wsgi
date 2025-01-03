import sys
import os
import logging
from app import app as application  # Import the Flask app

# Set the path to the Flask application directory
sys.path.insert(0, '/app')

# Point WSGI to the Flask app
application = app

# Configure logging to capture errors
logging.basicConfig(stream=sys.stderr, level=logging.ERROR, format='%(asctime)s %(levelname)s %(message)s')
sys.stderr = sys.stdout

# Example: Log an error to test logging
try:
    # Example operation that could fail
    raise Exception("Test exception for logging!")
except Exception as e:
    application.logger.error(f"An error occurred: {e}")
