"""Fast API test cases"""
from fastapi import FastAPI
from uvicorn import run as server_run

app = FastAPI()


@app.get("/")
async def root():
    """This is the root function"""
    return {"msg": "Hello World"}

if __name__ == "__main__":
    server_run("main:app", port=8000)
