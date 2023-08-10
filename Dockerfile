# Name the node stage "builder"
FROM node:14 AS builder
# Set working directory
WORKDIR /app
# Copy all files from current directory to working dir in image
# install node modules and build assets
COPY ./front .
RUN npm install && npm run build


# backend build
FROM ruby:3.2-slim AS ruby

WORKDIR /app

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

COPY back/Gemfile .
COPY back/Gemfile.lock .

RUN bundle install

# Настройка переменных окружения для production
ENV RACK_ENV=production

COPY ./back .

# Copy static assets from builder stage
COPY --from=builder /app/dist ./public

LABEL org.opencontainers.image.source=https://github.com/PinJron/Compliments