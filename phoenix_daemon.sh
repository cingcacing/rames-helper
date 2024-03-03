#!/bin/bash

PID_FILE="/opt/phoenix/phoenix.pid"
SERVER_PORT=56782

start_server() {
    if [ -f $PID_FILE ]; then
        echo "Server is already running"
    else
        nohup python2 -m SimpleHTTPServer $SERVER_PORT > /dev/null 2>&1 &
        echo $! > $PID_FILE
        echo "Server started"
    fi
    exit 0
}

stop_server() {
    if [ -f $PID_FILE ]; then
        kill $(cat $PID_FILE)
        rm $PID_FILE
        echo "Server stopped"
    else
        echo "Server is not running"
    fi
    exit 0
}

status_server() {
    if [ -f $PID_FILE ]; then
        echo "Server is running with PID $(cat $PID_FILE)"
    else
        echo "Server is not running"
    fi
    exit 0
}

case "$1" in
    start)
        start_server
        ;;
    stop)
        stop_server
        ;;
    status)
        status_server
        ;;
    *)
        echo "Usage: $0 {start|stop|status}"
        exit 1
esac
