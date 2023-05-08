FROM python:3

COPY requirements.txt /err/
COPY base.sh /base.sh
COPY app.sh /app.sh

RUN chmod +x /base.sh /app.sh

#RUN apk upgrade --no-cache
#RUN apk --no-cache --update add libffi libssl1.1
#RUN apk add --no-cache --virtual .build-deps \
#     gcc \
#     build-base \
#     libffi-dev \
#     openssl-dev \
#     tzdata \
#     python3-dev \
#     py3-pip
#RUN apk add gcc musl-dev python3-dev libffi-dev openssl-dev cargo jpeg-dev zlib-dev
#RUN apk add --no-cache openjdk8-jre
RUN apt-get update \
  && apt-get -y install --no-install-recommends \
         git \
         qalc \
         locales \
         dnsutils \
         libssl-dev \
         build-essential \
         python3-dnspython \
         python3-dev \
         python3-openssl \
         python3-pip \
         python3-cffi \
         python3-pyasn1 \
         python3-geoip \
         python3-lxml \
    && locale-gen C.UTF-8 \
    && /usr/sbin/update-locale LANG=C.UTF-8 \
    && echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen \
    && locale-gen \
    && pip3 install virtualenv \
    && pip3 install -U setuptools \
	&& rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/apt/archives

RUN pip3 install --upgrade pip
RUN pip3 install -r /err/requirements.txt
RUN rm -f /err/requirements.txt
RUN cp /usr/share/zoneinfo/America/Chicago /etc/localtime


#RUN /base.sh
#RUN rm -f /base.sh
#
#RUN /app.sh
#RUN rm -f /app.sh

COPY backend_plugins /opt/errbot/backend
