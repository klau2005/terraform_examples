FROM python:3.13
WORKDIR /usr/local/app
COPY requirements.txt .
RUN apt update && apt install -y python3-pip
RUN pip3 install --no-cache-dir -r requirements.txt
EXPOSE 8080
RUN useradd app
USER app
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8080"]   
