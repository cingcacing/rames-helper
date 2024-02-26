#!/usr/bin/env python2
# phoenix-daemon.py
import argparse
from flask import Flask
import os
import signal
import subprocess
import sys

app = Flask(__name__)
app.env = 'production'

@app.route('/')
def hello_world():
    return 'rames.id phoenix daemon'

def start_server():
    pid = subprocess.Popen(["/usr/bin/env", "python2", "phoenix-daemon.py", "run"]).pid
    print("Server started with PID", pid)

def stop_server():
    process = subprocess.Popen(["pgrep", "-f", "python2 phoenix-daemon.py run"], stdout=subprocess.PIPE)
    pid, _ = process.communicate()
    if pid:
        os.kill(int(pid), signal.SIGTERM)
        print("Server stopped")
    else:
        print("Server is not running")

def status_server():
    process = subprocess.Popen(["pgrep", "-f", "python2 phoenix-daemon.py run"], stdout=subprocess.PIPE)
    pid, _ = process.communicate()
    if pid:
        print("Server is running with PID", pid)
    else:
        print("Server is not running")

def run_server():
    app.run(host='0.0.0.0', port=56782)

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Manage the Flask server.')
    parser.add_argument('command', choices=['start', 'stop', 'status', 'run'])
    args = parser.parse_args()

    if args.command == 'start':
        start_server()
    elif args.command == 'stop':
        stop_server()
    elif args.command == 'status':
        status_server()
    elif args.command == 'run':
        run_server()
