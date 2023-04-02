include .env
export

GREEN  := $(shell tput -Txterm setaf 2)
YELLOW := $(shell tput -Txterm setaf 3)
WHITE  := $(shell tput -Txterm setaf 7)
RESET  := $(shell tput -Txterm sgr0)

SCRIPT_DIR = $(shell pwd)

.PHONY: help
help:
	@echo ''
	@echo 'Usage:'
	@echo '  ${YELLOW}make${RESET} ${GREEN}<target>${RESET}'
	@echo ''
	@echo 'Targets:'
	@echo "  ${YELLOW}help            ${RESET} Show this help message"
	@echo "  ${YELLOW}setup           ${RESET} Setup local environment"
	@echo "  ${YELLOW}init            ${RESET} Setup remote backend and run 'terraform init' at specific dir. Usage DIR=<dir> make init"
	@echo "  ${YELLOW}docs            ${RESET} Generate docs for all modules via 'terraform-docs'"
	@echo "  ${YELLOW}plan            ${RESET} Run 'terraform plan' at specific dir. Usage DIR=<dir> make plan"
	@echo "  ${YELLOW}unlock          ${RESET} Run 'terraform unlock' at specific dir. Usage DIR=<dir> ID=<id> make unlock"
	@echo "  ${YELLOW}list            ${RESET} Run 'terraform state list' at specific dir. Usage DIR=<dir> make list"
	@echo "  ${YELLOW}apply           ${RESET} Run 'terraform apply' at specific dir. Usage DIR=<dir> make apply"
	@echo "  ${YELLOW}rm              ${RESET} Run 'terraform state rm' at specific dir. Usage DIR=<dir> RES='<terraform resource>' make rm"
	@echo "  ${YELLOW}import          ${RESET} Run 'terraform import' at specific dir. Usage DIR=<dir> RES='<terraform resource>' ID='<resource url>' make import"
	@echo "  ${YELLOW}lint            ${RESET} Run linters"
	@echo "  ${YELLOW}conftest        ${RESET} Verify policies"

.PHONY: setup
setup:
	${SCRIPT_DIR}/hacks/setup-env.sh

.PHONY: init
init:
	${SCRIPT_DIR}/hacks/init.sh ${DIR}

.PHONY: docs
docs:
	${SCRIPT_DIR}/hacks/terraform-docs.sh -a true -s false

.PHONY: plan
plan:
	cd ${DIR} && terraform plan -lock=false 

.PHONY: unlock
unlock:
	cd ${DIR} && terraform force-unlock ${ID}

.PHONY: rm
rm:
	cd ${DIR} && terraform state rm '${RES}'

.PHONY: import
import:
	cd ${DIR} && terraform import '${RES}' '${ID}'

.PHONY: list
list:
	cd ${DIR} && terraform state list

.PHONY: apply
apply:
	cd ${DIR} && terraform apply

.PHONY: fmt
fmt:
	cd ${DIR} && terraform fmt

.PHONY: lint
lint:
	pre-commit run --files ${DIR}/*

.PHONY: lint-all
lint-all:
	pre-commit run -a

.PHONY: conftest
conftest:
	conftest verify -p ${SCRIPT_DIR}/policies --report notes
