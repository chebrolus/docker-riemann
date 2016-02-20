# Targets

.PHONE: all

all: build run

build:
	docker build -t  riemann .

run:
	docker run -d -t riemann

start: 
	docker run -i -t riemann /bin/bash
