FROM ruby:3.0.0

RUN apt-get update -qq && apt-get install -y nodejs redis-server beanstalkd

USER root

RUN mkdir /myapp
WORKDIR /myapp

COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN gem install bundler:2.2.4
RUN bundle
COPY . /myapp

CMD ["foreman", "start"]