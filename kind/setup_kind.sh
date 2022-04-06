#!/bin/bash

cd /tmp/

curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.12.0/kind-linux-amd64

chmod +x ./kind

sudo cp kind /usr/local/bin/ && sudo cp kind /bin/ && echo -e "\nKind installed - $(kind --version)\n"
