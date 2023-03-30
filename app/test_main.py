"""Fast API test cases"""
from fastapi.testclient import TestClient
from .main import app


client = TestClient(app)


def test_read_main():
    """checks for a response message of hello world"""
    response = client.get("/")
    assert response.json() == {"msg": "Hello World"}


def test_main_status_code():
    """checks the status code"""
    response = client.get("/")
    assert response.status_code == 200
