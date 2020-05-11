FROM tiangolo/uvicorn-gunicorn-fastapi:python3.7

WORKDIR /code

# dont write pyc files
ENV PYTHONDONTWRITEBYTECODE 1
# dont buffer to stdout/stderr
ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /code/requirements.txt
ADD ./app /code

# dependencies
RUN set -eux \
    && pip install --upgrade pip setuptools wheel \
    && pip install -r /code/requirements.txt \
    && rm -rf /root/.cache/pip

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8501"]
