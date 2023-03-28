from .main import app
from fastapi.testclient import TestClient


client = TestClient(app)

def test_read_main():
    response = client.get("/")
    assert response.json() == {"msg": "Hello World"}

def test_main_status_code():
    response = client.get("/")
    assert response.status_code == 200
