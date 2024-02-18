#!/bin/bash

curl -sS https://raw.githubusercontent.com/cingcacing/rames-helper/main/resources/superset-mpack.txt | xargs pip3.9 install apache-superset==3.0.3
