#!/usr/bin/env bash

# If you want to send or receive messages signed by root authorities and these authorities are not installed on the server, you must add a trusted root certificate.

yum install -y curl
curl -k https://curl.haxx.se/ca/cacert.pem -o /etc/pki/tls/certs/ca-bundle.crt
