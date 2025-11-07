FROM python:3.10.19-slim-trixie
WORKDIR /usr/local/app
EXPOSE 8080
RUN useradd app
USER app
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8080"]   
