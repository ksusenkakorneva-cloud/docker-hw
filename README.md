# Docker HW

Проект состоит из трёх контейнеров:

- `hw-generator` — генерирует CSV-файл с данными о котиках;
- `hw-reporter` — читает CSV-файл и создаёт HTML-отчёт;
- `nginx` — веб-сервер, который раздаёт готовый отчёт.

## Полная цепочка запуска

```bash
./run.sh build_generator
./run.sh run_generator
./run.sh build_reporter
./run.sh run_reporter
./run.sh report_server
```

## Запуск отчёта в GitHub Codespaces

После запуска команды:

```bash
./run.sh report_server
```

открыть вкладку `Ports`, найти порт `8080` и нажать `Open in Browser`.

Для остановки сервера:

```text
Ctrl + C
```

## Остальные команды

```bash
./run.sh create_local_data
./run.sh structure
./run.sh clear_data
./run.sh inside_generator
./run.sh inside_reporter
```