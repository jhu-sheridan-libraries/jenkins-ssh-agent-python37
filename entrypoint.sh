#!/bin/bash

set -xe

source ~/.bashrc

exec /usr/sbin/sshd -D -e
