# Usa una imagen base con Python y soporte para GPU si es necesario
FROM nvidia/cuda:11.1-cudnn8-runtime-ubuntu18.04

# Establece el directorio de trabajo
WORKDIR /app

# Instala las dependencias del sistema
RUN apt-get update && apt-get install -y \
    python3-pip \
    git \
    && rm -rf /var/lib/apt/lists/*

# Copia los archivos del repositorio al contenedor
COPY . /app

# Instala las dependencias de Python
RUN pip3 install -r requirements.txt

# Exponer el puerto donde la aplicación correrá
EXPOSE 8000

# Ejecuta la aplicación
CMD ["python3", "Webui.py"]
