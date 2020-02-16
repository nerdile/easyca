#!/bin/bash

if [[ -d "requests/$1" ]]; then
  echo "Error: Request $1 already exists"
  exit 1
fi

if [[ ! -f "openssl.cnf" ]]; then
  cp openssl.example.cnf openssl.cnf
fi

if [[ ! -f "requests.cnf" ]]; then
  cp requests.example.cnf requests.cnf
fi

mkdir requests/$1
cp requests.cnf requests/$1/openssl.cnf
vi requests/$1/openssl.cnf

./req_create.sh $1

