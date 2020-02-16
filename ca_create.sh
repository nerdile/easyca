#!/bin/bash

if [[ -z "$1" ]]; then
  echo "Usage: mkca.sh caname"
  exit 1
fi

if [[ ! -d "ca" ]]; then
  mkdir ca
fi

if [[ -d "ca/$1" ]]; then
  echo "Error: folder already exists"
  exit 2
fi

mkdir ca/$1

cp openssl.cnf ca/$1/.

pushd ca/$1
echo 01 > serial
touch index.txt
mkdir private
mkdir issued

openssl req -new -x509 -extensions v3_ca -keyout private/cakey.pem -out cacert.pem -days 3650 -config ./openssl.cnf
cp cacert.pem cachain.pem

popd

cp ca/$1/cachain.pem certs/$1.cer

