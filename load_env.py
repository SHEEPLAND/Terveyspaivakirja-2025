import os
from dotenv import load_dotenv

load_dotenv(dotenv_path="Diary-BE-2025-main/.env") 

# Käyttöliittymätestin tunnukset
USERNAME = os.getenv("USERNAME")
PASSWORD = os.getenv("PASSWORD")

DB_HOST = os.getenv("DB_HOST")
DB_USER = os.getenv("DB_USER")
DB_PASSWORD = os.getenv("DB_PASSWORD")
DB_NAME = os.getenv("DB_NAME")

JWT_SECRET = os.getenv("JWT_SECRET")
JWT_EXPIRES_IN = os.getenv("JWT_EXPIRES_IN")
