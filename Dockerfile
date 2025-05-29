FROM ruby:3.4.4-slim

RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/

COPY Gemfile ./
RUN gem install bundler:2.6.9 && bundle install

EXPOSE 4000

# Expect the Jekyll site to be in /usr/src/app
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0", "-s", "/usr/src/app"]
