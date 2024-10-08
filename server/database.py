from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from database_url import DATABASE_URL

engine = create_engine(DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

# This is dependency injection


def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()
