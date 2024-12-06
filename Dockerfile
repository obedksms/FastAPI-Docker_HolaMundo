# Imagen base
ARG PYTHON_VERSION=3.11.4
FROM python:${PYTHON_VERSION}-slim AS base

# Crea un usuario sin privilegios bajo el cual se ejecutará la aplicación.
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

# Carpeta de trabajo
WORKDIR /app

# Copia el archivo de dependencias y asegúrate de que las dependencias se instalen correctamente
COPY --chown=appuser requirements.txt .

# Instalar dependencias como root para evitar problemas de permisos
USER root
RUN pip install --no-cache-dir -r requirements.txt

# Volver a cambiar al usuario sin privilegios
USER appuser


# Copia el código fuente dentro del contenedor.
COPY --chown=appuser . .

# Exponer puerto 
EXPOSE 8000

# Ejecuta la aplicación.
CMD python3 -m uvicorn main:app --host=0.0.0.0 --port=8000
