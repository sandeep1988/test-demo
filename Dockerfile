FROM ruby:2.5.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile Gemfile.lock ./ 
RUN gem install bundler && bundle install
RUN bundler install
COPY . ./
EXPOSE 3000
