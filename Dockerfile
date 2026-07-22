FROM ruby:3.4.5

WORKDIR /rails

RUN apt-get update -qq && apt-get install -y \
    curl \
    git \
    build-essential \
    libpq-dev \
    postgresql-client \
    nodejs \
    npm \
    && rm -rf /var/lib/apt/lists/*

RUN npm install -g yarn

ARG UID=1000
ARG GID=1000

RUN groupadd -g ${GID} appuser \
    && useradd -m -u ${UID} -g ${GID} appuser

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY package.json yarn.lock ./

RUN yarn install

COPY . .

RUN chown -R appuser:appuser /rails

USER appuser

EXPOSE 3000

CMD ["bash", "-c", "rm -f tmp/pids/server.pid && bin/rails server -b 0.0.0.0"]