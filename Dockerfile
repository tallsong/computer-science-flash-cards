FROM python:3.5
MAINTAINER Tinpee <tinpee.dev@gmail.com>

ADD . /src
WORKDIR /src
RUN pip install --upgrade pip  -i http://mirrors.aliyun.com/pypi/simple/  --trusted-host mirrors.aliyun.com \
    && pip install  -i http://mirrors.aliyun.com/pypi/simple/  --trusted-host mirrors.aliyun.com flask gunicorn  

COPY entrypoint.sh /
RUN sed -i 's/\r$//' /entrypoint.sh
RUN chmod +x /entrypoint.sh

VOLUME /src/db

EXPOSE 8000
CMD ["/entrypoint.sh"]


