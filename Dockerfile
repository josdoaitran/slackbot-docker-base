FROM alpine:3.13

COPY requirements.txt /err/
COPY base.sh /base.sh
COPY app.sh /app.sh

RUN chmod +x /base.sh /app.sh

RUN apk upgrade --no-cache
RUN apk --no-cache --update add libffi libssl1.1
RUN apk add --no-cache --virtual .build-deps \
     gcc \
     build-base \
     libffi-dev \
     openssl-dev \
     tzdata \
     python3-dev \
     py3-pip
RUN apk add gcc musl-dev python3-dev libffi-dev openssl-dev cargo jpeg-dev zlib-dev
RUN apk add --no-cache openjdk8-jre
RUN pip3 install --upgrade pip
RUN pip3 install errbot==6.1.3
RUN pip3 install errbot[slack]
#RUN pip3 install mysql-connector
RUN pip3 install -r /err/requirements.txt
RUN rm -f /err/requirements.txt
RUN cp /usr/share/zoneinfo/America/Chicago /etc/localtime


RUN /base.sh
RUN rm -f /base.sh

RUN /app.sh
RUN rm -f /app.sh
