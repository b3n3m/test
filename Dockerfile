FROM python:3.9.12
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV DockerHome=/home/app/webapp
WORKDIR $DockerHome

COPY . $DockerHome
COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
RUN apt-get update
# RUN uname -a
# RUN cat /etc/os-release
# RUN apt-get install python3.10 -y
# RUN apt-get install python3-pip -y
# RUN apt-get install libmysqlclient-dev -y
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
EXPOSE 8000
CMD /entrypoint.sh