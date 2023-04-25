FROM ruby:2.7.5

RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash - && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update -qq \
  && apt-get install -y build-essential libpq-dev \
  libxml2-dev \
  libxslt-dev \
  nodejs \
  yarn \
  imagemagick \
  tzdata \
  && apt-get clean all \
  && rm -rf /var/lib/apt/lists/*

ENV BUNDLE_VERSION 2.2.28
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV RAILS_LOG_TO_STDOUT=true

RUN yarn install --check-files
RUN gem install bundler --version "$BUNDLE_VERSION" \
  && rm -rf $GEM_HOME/cache/*

ENV DIR /var/www/bloggy
ENV PORT=5000

RUN mkdir ${DIR}
WORKDIR ${DIR}
COPY . ${DIR}

EXPOSE $PORT
CMD ["rails", "server", "-b", "0.0.0.0"]
