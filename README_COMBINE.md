Для объединения разделенной схемы в единую можно использовать скрипт `combine.sh`.

Для работоспособности скрипта необходимо установить [jq](https://stedolan.github.io/jq/).

Скрипт поддерживает 2 необязательных параметра:

```bash
bash ./combine.sh INPUT OUTPUT
```

- INPUT = директория, где находится схема, по умолчанию - текущая директория
- OUTPUT - директория, в которую собирается результат, по умолчанию - ./_build

Пример использования:
```bash
bash ./combine.sh . ../build
```
