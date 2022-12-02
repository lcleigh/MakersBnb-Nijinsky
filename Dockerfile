# Dockerfile
FROM ruby:3.0

WORKDIR /code
COPY . /code

RUN bundle install

EXPOSE 9292

CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0", "-p", "9292"]