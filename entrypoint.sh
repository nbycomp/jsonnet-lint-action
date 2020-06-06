#! /usr/bin/env bash

set -Eeuo pipefail
set -x

# Generates client.
# env:
#   [required] TARGETS : Files or directories (i.e., .jsonnet, .libsonnet etc..) to be linted
jsonnet::lint() {
  : "${TARGETS?No targets to check. Nothing to do.}"
  : "${GITHUB_WORKSPACE?GITHUB_WORKSPACE has to be set. Did you use the actions/checkout action?}"
  pushd "${GITHUB_WORKSPACE}"

  # Enable recursive glob patterns, such as '**/*.jsonnet'.
  shopt -s globstar
  for tolint in ${TARGETS}; do
    jsonnet-lint "${tolint}"
  done
  shopt -u globstar
}


if [ "$0" = "${BASH_SOURCE[*]}" ] ; then
  >&2 echo -E "\nRunning Jsonnet Lint...\n"
  jsonnet::lint
fi
