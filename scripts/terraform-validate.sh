#!/bin/sh
set -e

cd ./terraform

terraform init
terraform fmt
teffaform validate
terraform plan