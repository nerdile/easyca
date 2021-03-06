#!/bin/bash

if [[ ! -f "requests/$1/signed.pem" ]]; then
  echo "Error: Signed data not present"
  exit 1
fi

if [[ ! -f "openssl.cnf" ]]; then
  cp openssl.example.cnf openssl.cnf
fi

pushd requests/$1
cat signed.pem cachain.pem private.pem >private-apacheformat.pem
cat signed.pem cachain.pem >fullchain.pem
openssl pkcs12 -export -out $1-private.pfx -inkey private.pem -in signed.pem
popd

