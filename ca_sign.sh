#!/bin/bash

if [[ ! -d "ca/$1" ]]; then
  echo "Error: CA $1 does not exist"
  exit 1
fi

if [[ ! -d "requests/$2" ]]; then
  echo "Error: Request $2 does not exist"
  exit 2
fi

if [[ ! -f "openssl.cnf" ]]; then
  cp openssl.example.cnf openssl.cnf
fi

pushd ca/$1
openssl ca -extensions v3_server -out ../../requests/$2/signed.pem -config ./openssl.cnf -infiles ../../requests/$2/request.pem
popd

cp ca/$1/cachain.pem requests/$2/cachain.pem
cp requests/$2/signed.pem certs/$1-$2.cer
cat requests/$2/signed.pem ca/$1/cachain.pem >certs/$1-$2.full.cer

