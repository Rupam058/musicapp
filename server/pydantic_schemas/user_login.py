from pydantic import BaseModel


class UserLogin(BaseModel):
    email: str
    password: str # we are not getting any binary from user