# docker-redmine

Enhanced Redmine installation with memcached and sidekiq support.

**docker-redmine** is an Alpine-based Docker container running [Redmine](https://www.redmine.org). It includes additional useful gems to extend Redmine's functionality:

- dalli: Memcached client for caching performance improvements
- sidekiq: Background job processing for asynchronous tasks
- redmineup: Common libraries for [RedmineUP](https://www.redmineup.com) plugins

## Source Code

You can find the full source code on [GitHub](https://github.com/krautsalad/docker-redmine).
