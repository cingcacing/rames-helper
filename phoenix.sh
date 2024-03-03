#!/bin/bash

# Path to the phoenix service
PHOENIX_SERVICE="/opt/phoenix/phoenix-daemon.py"

# Check if the service path exists
if [ ! -f "$PHOENIX_SERVICE" ]; then
    echo "Phoenix service does not exist at path: $PHOENIX_SERVICE"
    exit 1
fi

# Check if the correct number of arguments are provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 {start|stop|status}"
    exit 1
fi

# Start, stop or check the status of the service based on the argument
case "$1" in
    start)
        echo "Starting phoenix service..."
        python3 $PHOENIX_SERVICE start
        ;;
    stop)
        echo "Stopping phoenix service..."
        python3 $PHOENIX_SERVICE stop
        ;;
    status)
        echo "Checking status of phoenix service..."
        python3 $PHOENIX_SERVICE status
        ;;
    *)
        echo "Invalid argument. Usage: $0 {start|stop|status}"
        exit 1
        ;;
esac

exit 0
