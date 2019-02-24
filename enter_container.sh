#!/bin/bash

# Enter container
docker run \
 -v /etc/localtime:/etc/localtime:ro \
 -v ~/Code/wasm_code:/root/code \
 -it wasm

