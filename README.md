# ActiveJsonModel Rails Test

A test app whose only purpose is to test the install/execute of the [activejsonmodel gem](https://rubygems.org/gems/activejsonmodel)
in the context where ActiveRecord is installed (full rails stack). This project is used in the [rmorlok/activejsonmodel](https://github.com/rmorlok/activejsonmodel) repo
as part of the test suite.

## Local Testing

By default this repo installs a version of `activejsonmodel` from RubyGems. If the environment variable 
`GITHUB_REPOSITORY` and `GITHUB_SHA` are set, it will install using a github repo and either a branch (`GITHUB_HEAD_REF`)
or commit SHA (`GITHUB_SHA`).

To install from a specific repo via git sha:

```bash
export GITHUB_REPOSITORY=rmorlok/activejsonmodel
export GITHUB_SHA=acc1e205f712fe321847a0c2c94144c1fc2ed5eb
bundle install
bundle exec rake test
```

alternatively, the repo can be configured to [install a local git branch](https://stackoverflow.com/questions/4487948/how-can-i-specify-a-local-gem-in-my-gemfile). You must specify the locally checked out git branch:

```bash
bundle config local.activejsonmodel /my/path/to/activejsonmodel
export LOCAL_BRANCH=my-local-branch
bundle install
bundle exec rake test
```
