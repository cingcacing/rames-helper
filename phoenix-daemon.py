#!/usr/bin/env python2.7
# app.py
import argparse
from flask import Flask
from multiprocessing import Process
import os
import signal
import sys
import time

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'RAMES.ID PHOENIX'

def run_server():
    app.run(host='0.0.0.0', port=56782)

def start_server():
    p = Process(target=run_server)
    p.start()
    print("Server started with PID", p.pid)
    with open("server.pid", "w") as f:
        f.write(str(p.pid))

def stop_server():
    try:
        with open("server.pid", "r") as f:
            pid = int(f.read())
        os.kill(pid, signal.SIGTERM)
        print("Server stopped")
    except FileNotFoundError:
        print("Server is not running")

def status_server():
    try:
        with open("server.pid", "r") as f:
            pid = int(f.read())
        print("Server is running with PID", pid)
    except FileNotFoundError:
        print("Server is not running")

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Manage the Flask server.')
    parser.add_argument('command', choices=['start', 'stop', 'status'])
    args = parser.parse_args()

    if args.command == 'start':
        start_server()
    elif args.command == 'stop':
        stop_server()
    elif args.command == 'status':
        status_server()
