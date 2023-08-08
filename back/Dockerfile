# /path/to/app/Dockerfile
FROM ruby:3.2-slim

RUN apt update -q && \
    apt install -qy \
    build-essential \
    libpq-dev \
    libvips \
    glibc-source \
    --no-install-recommends && \
    apt clean

ENV BUNDLER_VERSION='2.3.26'
RUN gem install bundler --no-document -v '2.3.26'

# Установка часового пояса
# RUN apk add --update tzdata && \
#     cp /usr/share/zoneinfo/Europe/London /etc/localtime && \
#     echo "Europe/London" > /etc/timezone

WORKDIR /code

COPY Gemfile ./
COPY Gemfile.lock ./

RUN bundle install

# Настройка переменных окружения для production
ENV RACK_ENV=production

# Проброс порта 3000 

COPY . .

ENTRYPOINT ["bundle", "exec"]
# Запуск по умолчанию сервера puma
# CMD ["bundle", "exec", "ruby", "app.rb"]  