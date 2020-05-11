from fastapi import FastAPI
from redis import Redis

app = FastAPI(title="aws-swarm-app", debug=True, version="0.0.2")
redis = Redis(host='redis', port=6379)

@app.get("/ping")
def ping():
    return {"ping": "pong!"}


@app.get('/')
async def hits():
    count = redis.incr('hits')
    return f'I have been seen {count} times.\n'