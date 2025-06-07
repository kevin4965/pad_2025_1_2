FROM python:3.9-slim

WORKDIR /pad_2025_1_2

# Copiar el contenido del proyecto
COPY . .

# Crear carpetas necesarias
RUN mkdir -p static/csv static/db

# Instalar dependencias
RUN pip install --upgrade pip \
    && pip install -e . \
    && rm -rf /root/.cache/pip

# Asegurar que Python encuentre los paquetes dentro de src
ENV PYTHONPATH=/pad_2025_1_2/src

# Usamos CMD directamente para ejecutar el extractor por defecto
CMD ["python", "-m", "edu_pad.main_extractor"]
