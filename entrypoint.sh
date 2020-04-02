#!/bin/bash

set -e

cd /app

case $1 in
    server)
        echo "Running server"
        exec python manage.py runserver 0.0.0.0:8000
        ;;
    *)
        echo "Running command: $@"
        exec "$@"
esac
