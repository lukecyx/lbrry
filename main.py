from fastapi import FastAPI

from http import HTTPStatus


app = FastAPI()


@app.get("/")
async def root():
    return {"message": "Hello World"}


@app.get("/check_health")
def check_health() -> int:
    """Check the health of the app.

    Only return 200, if app is down we'll get a 502.
    """

    return HTTPStatus.OK.value
