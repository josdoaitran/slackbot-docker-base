FROM public.ecr.aws/sam/build-python3.11:latest

COPY requirements.txt /err/

#COPY app.sh /app.sh
#RUN chmod +x  /app.sh
#RUN /app.sh
#RUN rm -f /app.sh

RUN pip3 install --upgrade pip
RUN pip3 install --no-cache-dir -r /err/requirements.txt
RUN rm -f /err/requirements.txt
RUN cp /usr/share/zoneinfo/America/Chicago /etc/localtime


RUN mkdir -p /err/data
RUN mkdir -p /err/log

RUN mkdir -p /err/local_plugins
RUN mkdir -p /err/local_backends

COPY backend_plugins /opt/errbot/backend
