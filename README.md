# azure-cli

A quick build to resolve several issues I met. Build it for CICD Pipeline

Follow up repo at https://github.com/alpine-docker/azure-cli

1. official `azure_cli` image `mcr.microsoft.com/azure-cli` is too large, 1GB+, there is a PR (https://github.com/Azure/azure-cli/pull/25184), which can reduce the image size to less than 500M, but still waiting for approval and merge. So I built it as `alpine/azure_cli:latest`

So this tag `latest` will only include Azure CLI, nothing else.

The version of azure cli would be the latest version, when I run the build command.

Reference `Dockerfile` is here: https://github.com/hholst80/azure-cli/blob/dev/Dockerfile

2. I'd like to add extra tools in it for CICD pipeline.

to add terraform in it. Tag is terraform version, not Azure CLI version

```
FROM hashicorp/terraform:1.5.6 as build

FROM alpine/azure_cli:latest

COPY --from=build  /bin/terraform /bin/terraform

ENTRYPOINT []
```

Build commands

```
docker build -t alpine/azure_cli:1.5.6 .
docker push alpine/azure_cli:1.5.6
```
