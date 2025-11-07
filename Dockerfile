FROM python:3.13
WORKDIR /usr/local/app
RUN pip install --no-cache-dir -r requirements.txt
EXPOSE 8080
RUN useradd app
USER app
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8080"]   
