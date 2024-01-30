#!/bin/bash

git clone https://gitlab.com/siphomateke/tongfang-control.git /tmp/tongfang-control

cd /tmp/tongfang-control

python3 setup.py build

python3 setup.py install
