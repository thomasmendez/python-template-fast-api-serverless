from fastapi import FastAPI
from dotenv import load_dotenv
import os

from app.api.api_v1.api import router as api_router
from mangum import Mangum

load_dotenv()
env = os.getenv("ENV")

app = FastAPI()

if env != None and env != "local" :
    print(env)
    app.root_path = f"/{env}"

@app.get("/")
async def root():
    return {
        "message": "Hello World",
        "environment": env,
    }

app.include_router(api_router, prefix="/api/v1")
# handler = Mangum(app.include_router(APIRouter(prefix="/api/v1")))
handler = Mangum(app)