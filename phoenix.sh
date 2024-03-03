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
        python2 $PHOENIX_SERVICE start
        return_code=$?
        if [ $return_code -eq 0 ]; then
            echo "Phoenix service started successfully."
        else
            echo "Failed to start phoenix service."
        fi
        exit $return_code
        ;;
    stop)
        echo "Stopping phoenix service..."
        python2 $PHOENIX_SERVICE stop
        return_code=$?
        if [ $return_code -eq 0 ]; then
            echo "Phoenix service stopped successfully."
        else
            echo "Failed to stop phoenix service."
        fi
        exit $return_code
        ;;
    status)
        echo "Checking status of phoenix service..."
        python2 $PHOENIX_SERVICE status
        return_code=$?
        if [ $return_code -eq 0 ]; then
            echo "Phoenix service is running."
        else
            echo "Phoenix service is not running."
        fi
        exit $return_code
        ;;
    *)
        echo "Invalid argument. Usage: $0 {start|stop|status}"
        exit 1
        ;;
esac

exit 0
