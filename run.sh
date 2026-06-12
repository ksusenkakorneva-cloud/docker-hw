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

 structure)
  echo "Структура проекта:"
  find . -maxdepth 3 -type f \
    -not -path "./.git/*" \
    -not -path "./data/*" \
    -not -path "./local_data/*" \
    | sort
  ;;

  clear_data)
    rm -f data/*.csv data/*.html
    echo "Папка data очищена от csv и html файлов"
    ;;

  inside_generator)
    docker run --rm -it -v "$(pwd)/data:/data" hw-generator sh -c "echo 'Содержимое /data внутри generator:' && ls -la /data"
    ;;

  inside_reporter)
    docker run --rm -it -v "$(pwd)/data:/data" hw-reporter sh -c "echo 'Содержимое /data внутри reporter:' && ls -la /data"
    ;;

  report_server)
    docker run --rm -p 8080:80 -v "$(pwd)/data:/usr/share/nginx/html:ro" nginx
    ;; 

  *)
    echo "Unknown command: $1"
    echo "Available commands:"
    echo "  build_generator"
    echo "  run_generator"
    echo "  create_local_data"
    echo "  build_reporter"
    echo "  run_reporter"
    echo "  structure"
    echo "  clear_data"
    echo "  inside_generator"
    echo "  inside_reporter"
    echo "  report_server"
    ;;
esac