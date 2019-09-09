ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

WORKDIR /data

# Copy data for add-on
COPY run.sh /
COPY mqtt-zwift.py /

# Install requirements for add-on
RUN apk add --update \
    python3 \
    python-dev \
    py-pip \
    build-base \
  && pip install zwift-client \
  && pip install paho-mqtt \
  && pip install python-daemon

#WORKDIR /zwift-app

RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
