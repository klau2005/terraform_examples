FROM rundeck/rundeck:5.8.0
WORKDIR /usr/local/app
COPY requirements.txt .
EXPOSE 8080
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8080"]   
