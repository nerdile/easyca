#!/bin/bash

if [[ ! -f "requests/$1/signed.pem" ]]; then
  echo "Error: Signed data not present"
  exit 1
fi

pushd requests/$1
cat signed.pem cachain.pem private.pem >$1-private.pem
cp signed.pem $1.cer
openssl pkcs12 -export -out $1-private.pfx -inkey private.pem -in signed.pem
popd

