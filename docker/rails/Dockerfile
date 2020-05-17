FROM ruby:2.6.3
RUN apt-get update -qq && \
    apt-get install -y apt-utils \
    build-essential \
    libpq-dev \
    nodejs \
    default-mysql-client
RUN mkdir /app
WORKDIR /app
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install -j4
# -j4は同時に4つダウンロード&インストールを実施するオプション
ADD . /app

EXPOSE 3100