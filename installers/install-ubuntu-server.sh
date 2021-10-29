#!/usr/bin/env bash

apt-get install \
	ufw

sudo ufw enable && \
	sudo ufw default deny incoming && \
	sudo ufw default allow outgoing && \
	sudo ufw allow ssh
