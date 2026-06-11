#!/bin/bash

case "$1" in
  build_generator)
    docker build -t hw-generator ./generator
    ;;

  run_generator)
    mkdir -p data
    docker run --rm -v "$(pwd)/data:/data" hw-generator
    ;;

  *)
    echo "Unknown command: $1"
    echo "Available commands:"
    echo "  build_generator"
    echo "  run_generator"
    ;;
esac