FROM ruby:slim

WORKDIR /code

COPY Gemfile* /code/

RUN gem install bundler && bundle install

COPY * /code/
