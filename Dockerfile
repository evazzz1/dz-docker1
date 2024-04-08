# Используем базовый образ с JDK
FROM bellsoft/liberica-openjdk-alpine:11.0.16.1-1

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем исходные файлы проекта в контейнер
COPY ./src /app/src

# Копируем скомпилированные классы проекта в контейнер
COPY ./out /app/out

# Устанавливаем переменную окружения CLASSPATH
ENV CLASSPATH=/app/out

# Запускаем команду Javadoc при запуске контейнера
CMD javadoc -sourcepath /app/src -cp $CLASSPATH -d /app/doc -subpackages ru.gb.jcore.sample