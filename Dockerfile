FROM ruby:2.5.3

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential \
    libpq-dev \
    nodejs \
    git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /app_name
ENV APP_ROOT /app_name
WORKDIR $APP_ROOT

COPY ./Gemfile $APP_ROOT/Gemfile
COPY ./Gemfile.lock $APP_ROOT/Gemfile.lock

RUN bundle update
RUN bundle install

COPY . $APP_ROOT
