# Jsonnet Lint for GitHub Action
This action allows you to run `jsonnet-lint` with no additional options.


## Usage
To use the action simply create an `jsonnet-lint.yml` (or choose custom `*.yml` name) in the `.github/workflows/` directory.

For example:

```yaml
name: jsonnet Lint  # feel free to pick your own name

on: [push, pull_request]

jobs:
  build:

    runs-on: ubuntu-latest

    steps:
    # Important: This sets up your GITHUB_WORKSPACE environment variable
    - uses: actions/checkout@v2

    - name: Lint jsonnet
      # replace "master" with any valid ref
      uses: dadav/jsonnet-lint-action@master
      with:
        # [required]
        # Paths to jsonnet files (i.e., .jsonnet, .libsonnet etc..)
        # or valid jsonnet directories with globs.
        # If you want to lint multiple jsonnet files, use the following syntax
        # targets: |
        #   config.jsonnet
        #   templates.libsonnet
        targets: ""
```

```yaml

on:
  push:
    branches:
    - stable
    - release/v*
```

or on various [events](https://help.github.com/en/articles/events-that-trigger-workflows)

<br>

## License
The Dockerfile and associated scripts and documentation in this project are released under the [MIT](license).

