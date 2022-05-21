# Errbot - the pluggable chatbot

FROM debian:stable-slim

ENV ERR_USER err

# Add err user and group
RUN groupadd -r $ERR_USER \
    && useradd -r \
       -g $ERR_USER \
       -d /srv \
       -s /bin/bash \
       $ERR_USER

COPY requirements.txt /err/
COPY app.sh /app.sh
COPY entrypoint.sh /entrypoint.sh
COPY config.py /err/

RUN chmod +x /app.sh /entrypoint.sh

ENV PATH /app/venv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# Set default locale for the environment
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

# Install packages and perform cleanup
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
         ncompress \
    && locale-gen C.UTF-8 \
    && /usr/sbin/update-locale LANG=C.UTF-8 \
    && echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen \
    && locale-gen \
    && pip3 install virtualenv \
    && pip3 install -U setuptools \
	&& rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/apt/archives

RUN pip install -r /err/requirements.txt
RUN rm -f /err/requirements.txt
RUN cp /usr/share/zoneinfo/America/Chicago /etc/localtime

RUN /app.sh
RUN rm -f /app.sh

EXPOSE 3141 3142

VOLUME ["/err/data/"]
RUN chmod +x /err
WORKDIR /err
ENTRYPOINT ["/entrypoint.sh"]