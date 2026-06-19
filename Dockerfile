FROM mcr.microsoft.com/mssql/server:2025-latest

ENV DEBIAN_FRONTEND=noninteractive
USER root

RUN apt update && \
    apt install -y curl libnss-ldapd ldap-utils && \
    curl https://packages.microsoft.com/keys/microsoft.asc | tee /etc/apt/trusted.gpg.d/microsoft.asc && \
    curl https://packages.microsoft.com/config/ubuntu/22.04/prod.list | tee /etc/apt/sources.list.d/msprod.list
RUN apt update && \
    ACCEPT_EULA=Y apt install -y krb5-user adutil

USER mssql
