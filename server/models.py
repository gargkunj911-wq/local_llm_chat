from pydantic import BaseModel

class ChatRequest(BaseModel):
    userMess : str