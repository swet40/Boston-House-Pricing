FROM python:3.10
WORKDIR /app
COPY . /app
RUN pip install --no-cache-dir -r requirements.txt
ENV PORT=${PORT:-8000}
EXPOSE $PORT
CMD ["gunicorn", "--workers=4", "--bind", "0.0.0.0:8000", "app:app"]