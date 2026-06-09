#!/bin/bash

case "$1" in
  build_generator)
    docker build -t hw-generator ./generator
    ;;

  *)
    echo "Unknown command: $1"
    echo "Available commands:"
    echo "  build_generator"
    ;;
esac