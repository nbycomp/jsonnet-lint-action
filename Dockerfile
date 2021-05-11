FROM golang:alpine

LABEL "maintainer"="dadav <dadav@protonmail.com>"
LABEL "repository"="https://github.com/nbycomp/jsonnet-lint-action"
LABEL "homepage"="https://github.com/nbycomp/jsonnet-lint-action"

LABEL "com.github.actions.name"="jsonnet-lint"
LABEL "com.github.actions.description"="Run Jsonnet Lint"
LABEL "com.github.actions.icon"="activity"
LABEL "com.github.actions.color"="gray-dark"

# Install jsonnet-lint
RUN apk add --no-cache git bash\
    && go get github.com/google/go-jsonnet/cmd/jsonnet-lint

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
