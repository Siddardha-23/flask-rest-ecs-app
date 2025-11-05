FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y
RUN apt-get install -y python3 python3-pip nginx gunicorn supervisor

COPY . /app
RUN pip3 install -r /app/requirements.txt

# Setup nginx
RUN rm /etc/nginx/sites-enabled/default
COPY nginx/flask_chatbot.conf /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/flask_chatbot.conf /etc/nginx/sites-enabled/flask_chatbot.conf
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# Setup supervisord
RUN mkdir -p /var/log/supervisor
COPY nginx/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY nginx/gunicorn.conf /etc/supervisor/conf.d/gunicorn.conf

RUN pip3 install gevent
# # Gunicorn default configuration
COPY nginx/gunicorn.config.py /app/gunicorn.config.py

WORKDIR /app

EXPOSE 80