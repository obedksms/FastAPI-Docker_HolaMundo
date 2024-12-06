# Hola Mundo con FastAPI y Docker


Crear un programa holaMundo con FasrAPI y desplegarlo con Docker

---

## Características
- ✅ HolaMundo
- ✅ Entorno Virtual
- ✅ Docker
- ✅ GitHub




## Instalación durante creacion de proyecto

1. Clonar el repositorio
1. Crear entorno Virtual: *python -m venv venv *
2. Avtivar entorno virtual: *venv\Scripts\activate*  --> Windows 
3. Instalar dependencias: *pip install -r requirements.txt*
4. Probar app con: uvicorn: *main:app --reload --port 8080*


## Dockerización
1. Crear imagen: *docker build -t name_imagen:Version .*
2. Crear y jecutar contenedor: *docker run -d -p 80:8000 --nombre_contenedor id_imagen*
3. Ingresar al contenedor : *docker exec -it nombre_contenedor bash*


## Prueba
1. En el navegador ir a localhost:80









