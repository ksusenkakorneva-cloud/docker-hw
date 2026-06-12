# Docker HW

Проект состоит из двух контейнеров:

- generator — генерирует CSV-файл с данными о котиках;
- reporter — анализирует CSV-файл и создает HTML-отчёт.

## Сборка генератора

```bash
./run.sh build_generator
```

## Генерация данных

```bash
./run.sh run_generator
```

Результат сохраняется в:

```text
data/data.csv
```

## Создание локальных данных

```bash
./run.sh create_local_data
```

Создает копию данных в папке:

```text
local_data/
```

## Сборка репортера

```bash
./run.sh build_reporter
```

## Создание отчёта

```bash
./run.sh run_reporter
```

Результат сохраняется в:

```text
data/report.html
```

## Показать структуру проекта

```bash
./run.sh structure
```

## Очистить папку data

```bash
./run.sh clear_data
```

Удаляет:

```text
data.csv
report.html
```

## Посмотреть содержимое /data в контейнере generator

```bash
./run.sh inside_generator
```

## Посмотреть содержимое /data в контейнере reporter

```bash
./run.sh inside_reporter
```

## Запуск отчёта через веб-сервер

```bash
./run.sh report_server
```

После запуска открыть:

```text
http://localhost:8080/report.html
```

Для остановки сервера:

```text
Ctrl + C
```