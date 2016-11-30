FROM python:2.7

MAINTAINER Dani Hodovic

RUN     apt-get update && \
	apt-get install libpq-dev build-essential -y && \
	pip install pgcli

ENTRYPOINT ["pgcli"]
