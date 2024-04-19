FROM python:3.9-slim

RUN useradd -m myuser
USER myuser
WORKDIR /app

COPY requirements.txt /app/

RUN pip3 install --no-cache-dir -r requirements.txt

COPY . /app

EXPOSE 8888

CMD ["jupyter-lab", "--ip='127.0.0.1'", "--port=8888", "--no-browser"]
