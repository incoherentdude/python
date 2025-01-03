import sys
import logging
from app import app as application

# Log any potential errors
logging.basicConfig(stream=sys.stderr)
sys.stderr = sys.stdout
