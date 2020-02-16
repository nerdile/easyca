#!/bin/bash

if [[ -f "requests/$1/request.pem" ]]; then
  echo "Error: Request $1 already exists"
  exit 1
fi

if [[ ! -d "requests/$1" ]]; then
  mkdir requests/$1
fi

if [[ -f "requests/$1/request.cnf" ]]; then
  openssl req -new -nodes -out requests/$1/request.pem -config requests/$1/request.cnf -keyout requests/$1/private.pem
else
  openssl req -new -nodes -out requests/$1/request.pem -config ./openssl.cnf -keyout requests/$1/private.pem
fi

