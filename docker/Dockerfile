ARG REDMINE_VERSION

FROM redmine:${REDMINE_VERSION:-latest}

USER root

RUN apk update && \
    apk add --no-cache pandoc && \
    apk add --no-cache --virtual .build-deps build-base git && \
    echo -e "gem 'dalli'\ngem 'sidekiq'\ngem 'redis'\ngem 'redmineup'" > /usr/src/redmine/Gemfile.local && \
    gosu redmine bundle install && \
    apk del .build-deps && \
    rm -rf /root/.cache /tmp/* /var/cache/apk/* /var/tmp/*

USER redmine
