#!/bin/bash

if [[ -z "$1" ]]; then
  echo "Usage: mkca.sh caname"
  exit 1
fi

if [[ ! -d "data" ]]; then
  mkdir data
fi

if [[ -d "data/$1" ]]; then
  echo "Error: folder already exists"
  exit 2
fi

mkdir data/$1

cp openssl.cnf data/$1/.

pushd data/$1
echo 01 > serial
touch index.txt
mkdir private
mkdir issued

openssl req -new -x509 -extensions v3_ca -keyout private.pem -out public.pem -days 3650 -config ./openssl.cnf

popd

cp data/$1/public.pem $1.cer

