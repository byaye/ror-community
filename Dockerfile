FROM ruby:2.6.3

COPY . /application
WORKDIR /application
ENV RAILS_ENV production

RUN gem install bundler:2.1.4

RUN bundle install --deployment --without development test

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && apt install -y nodejs && apt install -y yarn

ENTRYPOINT ./entrypoint.sh