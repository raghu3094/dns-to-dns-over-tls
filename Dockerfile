FROM python:2.7-alpine

ENV PYTHONUNBUFFERED=0

COPY requirements.txt /
RUN pip install -r /requirements.txt

WORKDIR /app
COPY proxy.py /app

EXPOSE 53

CMD ["python", "proxy.py"]
