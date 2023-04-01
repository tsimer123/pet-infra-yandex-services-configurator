include .env
export

GREEN  := $(shell tput -Txterm setaf 2)
YELLOW := $(shell tput -Txterm setaf 3)
WHITE  := $(shell tput -Txterm setaf 7)
RESET  := $(shell tput -Txterm sgr0)

.PHONY: help
help:
	@echo ''
	@echo 'Usage:'
	@echo '  ${YELLOW}make${RESET} ${GREEN}<target>${RESET}'
	@echo ''
	@echo 'Targets:'
	@echo "  ${YELLOW}help       ${RESET} Show this help message"
	@echo "  ${YELLOW}setup      ${RESET} Setup local environment"
	@echo "  ${YELLOW}init       ${RESET} Setup remote backend and run 'terraform init' at specific dir.   Usage: ${YELLOW}DIR${GREEN}=<dir> ${YELLOW}make${GREEN} init${RESET}"
	@echo "  ${YELLOW}docs       ${RESET} Generate docs for all modules via 'terraform-docs'"
	@echo "  ${YELLOW}plan       ${RESET} Run 'terraform plan' at specific dir.                            Usage: ${YELLOW}DIR${GREEN}=<dir> ${YELLOW}make${GREEN} plan${RESET}"
	@echo "  ${YELLOW}unlock     ${RESET} Run 'terraform force-unlock' at specific dir.                    Usage: ${YELLOW}DIR${GREEN}=<dir> ${YELLOW}ID${GREEN}=<id> ${YELLOW}make${GREEN} unlock${RESET}"
	@echo "  ${YELLOW}list       ${RESET} Run 'terraform state list' at specific dir.                      Usage: ${YELLOW}DIR${GREEN}=<dir> ${YELLOW}make${GREEN} list"
	@echo "  ${YELLOW}show       ${RESET} Run 'terraform state show' at specific dir.                      Usage: ${YELLOW}DIR${GREEN}=<dir> ${YELLOW}RES${GREEN}='<terraform resource>' ${YELLOW}make${GREEN} show${RESET}"
	@echo "  ${YELLOW}apply      ${RESET} Run 'terraform apply' at specific dir.                           Usage: ${YELLOW}DIR${GREEN}=<dir> ${YELLOW}make${GREEN} apply${RESET}"
	@echo "  ${YELLOW}destroy    ${RESET} Run 'terraform destroy' at specific dir.                         Usage: ${YELLOW}DIR${GREEN}=<dir> ${YELLOW}make${GREEN} destroy${RESET}"
	@echo "  ${YELLOW}rm         ${RESET} Run 'terraform state rm' at specific dir.                        Usage: ${YELLOW}DIR${GREEN}=<dir> ${YELLOW}RES${GREEN}='<terraform resource>' ${YELLOW}make${GREEN} rm${RESET}"
	@echo "  ${YELLOW}import     ${RESET} Run 'terraform import' at specific dir.                          Usage: ${YELLOW}DIR${GREEN}=<dir> ${YELLOW}RES${GREEN}='<terraform resource>' ${YELLOW}ID${GREEN}='<resource url>' ${YELLOW}make${GREEN} import${RESET}"
	@echo "  ${YELLOW}lint       ${RESET} Run linters"
	@echo "  ${YELLOW}conftest   ${RESET} Verify policies"

.PHONY: setup
setup:
	./hacks/setup-env.sh

.PHONY: init
init:
	./hacks/init.sh ${DIR}

.PHONY: docs
docs:
	./hacks/terraform-docs.sh -a true -s false

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

.PHONY: show
show:
	cd ${DIR} && terraform state show '${RES}'

.PHONY: apply
apply:
	cd ${DIR} && terraform apply

.PHONY: destroy
destroy:
	cd ${DIR} && terraform destroy

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
	conftest verify -p ./policies --report notes
