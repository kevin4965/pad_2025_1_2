FROM python:3.9-slim

WORKDIR /pad_2025_1_2

# Copiar todo el contenido
COPY . .

# Crear carpetas necesarias
RUN mkdir -p static/csv static/db

# Instalar dependencias
RUN pip install --upgrade pip \
    && pip install -e . \
    && rm -rf /root/.cache/pip

# Establecer PYTHONPATH para que encuentre los módulos en src/
ENV PYTHONPATH=/pad_2025_1_2/src

# Comando por defecto al correr el contenedor
CMD ["python", "-m", "edu_pad.main"]
