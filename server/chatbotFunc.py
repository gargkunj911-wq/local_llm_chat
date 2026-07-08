from langchain_huggingface import HuggingFacePipeline, ChatHuggingFace
from langchain_core.messages import AIMessage, HumanMessage, SystemMessage


hf = HuggingFacePipeline.from_model_id(
    model_id="Qwen/Qwen2.5-1.5B-Instruct",
    task="text-generation",
        pipeline_kwargs={
            "max_new_tokens": 500,
            "return_full_text": False,
        },
    
)

chatbot = ChatHuggingFace(llm = hf)

def AI_answer(user_message):

    listUser = HumanMessage(content=user_message)

    response = chatbot.invoke(user_message)

    listAI = AIMessage(content= response.content)

    return [response.content, listUser, listAI]