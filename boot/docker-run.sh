#!/bin/bash

# Activate your custom env
source /opt/raga_ai_env/bin/activate

# Move to project code
cd /code

# Default port/host if not provided
RUN_PORT=${PORT:-8000}
RUN_HOST=${HOST:-0.0.0.0}

# Start FastAPI with Gunicorn + Uvicorn worker
gunicorn -k uvicorn.workers.UvicornWorker -b $RUN_HOST:$RUN_PORT main:app
