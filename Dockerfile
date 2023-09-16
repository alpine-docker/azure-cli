FROM hashicorp/terraform:1.5.6 as build

FROM alpine/azure_cli:latest

COPY --from=build  /bin/terraform /bin/terraform

ENTRYPOINT []
