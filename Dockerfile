FROM python:3.7-alpine

RUN apk add --update bash && rm -rf /var/cache/apk/*
# for better layers
RUN pip install slacker colorama

ADD . /data
RUN pip install -r /data/requirements.txt
RUN pip install /data

COPY patch/__init__.py /usr/local/lib/python3.7/site-packages/slacker/

VOLUME ["/backup"]
WORKDIR /backup
ENTRYPOINT ["/bin/bash"]
