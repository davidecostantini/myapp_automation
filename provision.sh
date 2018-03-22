#!/bin/bash

function prompt_YN_and_store() {
  local question=$1
  local flag_var=$2
  local result_var=$3
  local exit_code=""

  if [[ -z $flag_var ]];
  then
    read -p "$question [y/n]" -n 1 -r
    if [[ $REPLY =~ ^[Yy]$ ]]; then
      exit_code=1
    else
      exit_code=0
    fi
    echo
  else
    # flag_var is already set, pass it straight through
    exit_code=$flag_var
  fi
  if [[ ! -z ${result_var} ]]; then
    export ${result_var}=${exit_code}
  fi
}

DATE=$(date +%H%M%S_%d%m%Y)

# Checking if public key is available
[[ ! -d secrets ]] && mkdir secrets
if [ ! -f "secrets/myapp.pub" ]; then
  echo "I cannot find public key at secrets/myapp.pub, I need it to configure the SSH key in AWS"
  exit 1
fi

# Checking if necessary to initialize Terraform
if [ ! -d ".terraform" ]; then
  echo "Running Terraform Initialization"
  terraform init
fi

echo "Create Terraform plan"
time terraform plan "$@" \
    -out=plan.tfplan

prompt_YN_and_store "Do you want to apply the plan located at $PLAN_PATH?" "" RUN_TERRAFORM_APPLY
if [[ ${RUN_TERRAFORM_APPLY} -eq 1 ]]
then
  time terraform  apply "$@" plan.tfplan
fi
echo "COMPLETED!"
echo ""


echo "Now please go to "http://$(terraform output endpoint)" to check the application!"
