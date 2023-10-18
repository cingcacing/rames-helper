#!/bin/bash
#curl -sS https://raw.githubusercontent.com/apache/superset/2.0.1/requirements/base.txt | tail -n +10 | awk -v ORS=' ' '/^[A-z]/{print}' | xargs pip install apache-superset==2.0.1
curl -sS https://github.com/apache/superset/raw/3.0/requirements/base.txt | tail -n +10 | awk -v ORS=' ' '/^[A-z]/{print}' | xargs pip install apache-superset==3.0
