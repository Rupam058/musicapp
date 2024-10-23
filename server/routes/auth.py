import uuid
import bcrypt
from fastapi import Depends, HTTPException, Header
import jwt
from database import get_db
from models.user import User
from pydantic_schemas.user_create import UserCreate
from fastapi import APIRouter
from sqlalchemy.orm import Session
from pydantic_schemas.user_login import UserLogin

router = APIRouter()


@router.post('/signup', status_code=201)
def signup_user(user: UserCreate, db: Session = Depends(get_db)):
    # # Extract the data that coming from req
    # print(user.name)
    # print(user.email)
    # print(user.password)

    # Check if the user already exitsts in db
    user_db = db.query(User).filter(User.email == user.email).first()

    if user_db:
        raise HTTPException(400, 'User with the same email already exists!')
        # return 'User with the same email already exists!'

    # creating a hashed password
    hashed_pw = bcrypt.hashpw(user.password.encode(), bcrypt.gensalt())

    user_db = User(id=str(uuid.uuid4), email=user.email,
                   password=hashed_pw, name=user.name)

    # add the user to the db
    db.add(user_db)
    db.commit()
    db.refresh(user_db)

    return user_db


@router.post('/login')
def login_user(user: UserLogin, db: Session = Depends(get_db)):
    # check if the user with same email already exist
    user_db = db.query(User).filter(User.email == user.email).first()

    if not user_db:
        raise HTTPException(404, 'User with this email does not exitst!')

    # password matching or not
    is_match = bcrypt.checkpw(user.password.encode(), user_db.password)

    if not is_match:
        raise HTTPException(401, 'Wrong password!')

    token = jwt.encode({'id': user_db.id}, 'password_key')

    return {'token': token, 'user': user_db}


@router.get('/')
def current_user_data(db: Session = Depends(get_db), x_auth_token=Header()):
    try:
        # get the user token from the headers
        if not x_auth_token:
            raise HTTPException(401, 'No auth token, access denied!')

        # decode the token
        verified_token = jwt.decode(x_auth_token, 'password_key', ['HS256'])

        if not verified_token:
            raise HTTPException(401, 'Token verification failed')

        # get the id from the token
        uid = verified_token.get('id')
        return uid

        # postgres database get the user info
    except jwt.PyJWTError:
        raise HTTPException(401, 'Invalid token, authorization failed!')
