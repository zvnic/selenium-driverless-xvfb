# Dockerfile
FROM python:3.10-slim

# Установим зависимости для Chrome и Selenium
RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    xvfb \
    chromium \
    chromium-driver \
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

# Установим Python зависимости
COPY requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r /app/requirements.txt

# Копируем исходный код программы
COPY . /app
WORKDIR /app

# Указываем команду по умолчанию
CMD ["python", "main.py"]
