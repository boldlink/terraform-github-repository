CURRENT_DIR = $(shell pwd)
BASE_DIR := $(CURRENT_DIR)/examples/*
SUBDIRS := $(shell find $(BASE_DIR) -maxdepth 1 -type d)

.PHONY: all modtest_init modtest_plan modtest_aplly modtest_destroy clean_tests


modtest_init:
	for number in $(SUBDIRS) ; do \
			cd $$number && terraform init ; \
	done

modtest_plan:
	for number in $(SUBDIRS) ; do \
			cd $$number && terraform plan ; \
	done

modtest_aplly:
	for number in $(SUBDIRS) ; do \
			cd $$number && terraform apply --auto-approve ; \
	done

mod_test: modtest_init modtest_aplly

modtest_destroy:
	for number in $(SUBDIRS) ; do \
			cd $$number && terraform destroy --auto-approve ; \
	done

clean_tests:
	for number in $(SUBDIRS) ; do \
			cd $$number && rm -rf .terraform ; \
			# cd $$number && rm -rf .terraform.lock.hcl ; \
	done