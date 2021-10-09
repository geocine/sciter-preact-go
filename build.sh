#!/bin/bash
curl -L https://unpkg.com/htm/preact/standalone.mjs?module > ./res/preact.js
pkger
go build -o ./bin/app main.go