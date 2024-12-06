# Imagen base
ARG PYTHON_VERSION=3.11.4
FROM python:${PYTHON_VERSION}-slim AS base

ARG UID=10001
RUN adduser \
    --disabled-password \
    --gecos "" \
    --home "/nonexistent" \
    --shell "/sbin/nologin" \
    --no-create-home \
    --uid "${UID}" \
    appuser

USER appuser


WORKDIR /app

COPY --chown=appuser requirements.txt .

USER root
RUN pip install --no-cache-dir -r requirements.txt
USER appuser

COPY --chown=appuser . .

EXPOSE 8000

CMD python3 -m uvicorn main:app --host=0.0.0.0 --port=8000
