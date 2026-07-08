from fastapi import FastAPI
from models import ChatRequest
from chatbotFunc import AI_answer

app = FastAPI()

# Chats = []

@app.get("/")
def alwaysRun():
    return {
        "msg" : "Welcome to Kunj's ChatBot"
    }


@app.post("/AI")
def userPrompt(data: ChatRequest):
    
    # str userPrompt_f = data.userMess

    outputs = AI_answer(data.userMess)

    # Chats.append(outputs[1])
    # Chats.append(outputs[2])

    return {
        "AI_response" : outputs[0]
    }

