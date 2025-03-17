FROM python:3.10
WORKDIR /app
COPY . /app
# Upgrade pip, setuptools, wheel, and install required dependencies
RUN pip install --upgrade pip setuptools wheel
RUN apt-get update && apt-get install -y build-essential python3-dev
RUN pip install --no-cache-dir numpy cython scipy
RUN pip install --no-cache-dir -r requirements.txt
ENV PORT=8000  
EXPOSE $PORT
CMD ["gunicorn", "--workers=4", "--bind", "0.0.0.0:8000", "app:app"]