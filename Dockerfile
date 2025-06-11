FROM redmine:6.0.5-alpine

USER root

RUN apk update && \
    apk add --no-cache --virtual .build-deps build-base git && \
    echo -e "gem 'dalli'\ngem 'sidekiq'\ngem 'redis'\ngem 'redmineup'" > /usr/src/redmine/Gemfile.local && \
    gosu redmine bundle install && \
    apk del .build-deps

USER redmine
