sudo rsync -aP /var/lib/mysql/arduino ~/backup

    #rsync опции источник приемник
    # -v - Выводить подробную информацию о процессе копирования;
    # -q - Минимум информации;
    # -c - Проверка контрольных сумм для файлов;
    # -a - Режим архивирования, когда сохраняются все атрибуты оригинальных файлов;
    # -R - Относительные пути;
    # -b - Создание резервной копии;
    # -u - Не перезаписывать более новые файлы;
    # -l - Копировать символьные ссылки;
    # -L - Копировать содержимое ссылок;
    # -H - Копировать жесткие ссылки;
    # -p - Сохранять права для файлов;
    # -g - Сохранять группу;
    # -t - Сохранять время модификации;
    # -x - Работать только в этой файловой системе;
    # -e - Использовать другой транспорт, например, ssh;
    # -z - Сжимать файлы перед передачей;
    # --delete - Удалять файлы которых нет в источнике;
    # --exclude - Исключить файлы по шаблону;
    # --recursive - Перебирать директории рекурсивно;
    # --no-recursive - Отключить рекурсию;
    # --progress - Выводить прогресс передачи файла; //P
    # --stat - Показать статистику передачи;
    # --version - Версия утилиты.
