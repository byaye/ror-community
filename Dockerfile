FROM ruby:2.6.3-stretch
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

RUN gem install bundler --version 2.1.4 --force

RUN mkdir /ror-community
WORKDIR /ror-community
COPY Gemfile /ror-community/Gemfile
COPY Gemfile.lock /ror-community/Gemfile.lock
RUN bundle install
COPY . /ror-community

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
