FROM ruby:2.7.1

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && apt-get update

RUN apt-get install -y postgresql

WORKDIR /app/examle-business-logic

COPY . /app/examle-business-logic
