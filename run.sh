#!/bin/bash

case "$1" in
  build_generator)
    docker build -t hw-generator ./generator
    ;;

  run_generator)
    mkdir -p data
    docker run --rm -v "$(pwd)/data:/data" hw-generator
    ;;

  create_local_data)
    mkdir -p local_data
    python3 generator/generate.py local_data
    ;;

  build_reporter)
    docker build -t hw-reporter ./reporter
    ;;

  run_reporter)
    mkdir -p data
    docker run --rm -v "$(pwd)/data:/data" hw-reporter
    ;;

  *)
    echo "Unknown command: $1"
    echo "Available commands:"
    echo "  build_generator"
    echo "  run_generator"
    echo "  create_local_data"
    echo "  build_reporter"
    echo "  run_reporter"
    ;;
esac