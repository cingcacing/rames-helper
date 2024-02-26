#!/usr/bin/env python2.7
# app.py
from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'RAMES.ID PHOENIX daemon status UP'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=56782)
