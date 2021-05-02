# cronjobs

List of repositories to autofix on a regular interval.

[![Gitpod ready-to-code](https://img.shields.io/badge/Gitpod-ready--to--code-908a85?logo=gitpod)](https://gitpod.io/#https://github.com/autofix-dev/cronjobs)
[![CircleCI](https://circleci.com/gh/autofix-dev/cronjobs.svg?style=svg)](https://circleci.com/gh/autofix-dev/cronjobs)

## How to add a repository

This repository uses [CircleCI](https://circleci.com/). Everything is configured in [.circleci/config.yml](https://github.com/autofix-dev/cronjobs/blob/master/.circleci/config.yml).

### Autofix bi-weekly

To analyze a repository **twice each week**, and automatically receive a Pull Request when new fixes are available, simply add a few lines to the [`autofix-biweekly`](https://github.com/autofix-dev/cronjobs/blob/291691a9b374350db272babbf8ee73662e2ea943/.circleci/config.yml#L5-L30) job, similar to:

```bash
            git clone --recurse-submodules https://github.com/gitpod-io/workspace-images
            cd workspace-images
            hub fork
            autofix --branches --branch-suffix=$CIRCLE_BUILD_NUM --push=$GITHUB_LOGIN --pull-request
            cd ..
```

Simply replace `workspace-images` in the snippet above with your own repository.

You can also adjust the `autofix` configuration to your liking (see [available options](https://github.com/autofix-dev/autofix/blob/master/README.md)).

### Autofix monthly

To analyze a repository only **once per month**, and automatically receive a Pull Request when new fixes are available, add similar lines but to the [`autofix-monthly`](https://github.com/autofix-dev/cronjobs/blob/291691a9b374350db272babbf8ee73662e2ea943/.circleci/config.yml#L32-L57) job.
