CURRENT_DIR = $(shell pwd)
BASE_DIR := $(CURRENT_DIR)/examples/*
SUBDIRS := $(shell find $(BASE_DIR) -maxdepth 1 -type d)

.PHONY: all


tfinit:
	for folder in $(SUBDIRS) ; do \
			cd $$folder && terraform init ; \
	done

tfplan:
	for folder in $(SUBDIRS) ; do \
			cd $$folder && terraform plan ; \
	done

tfaplly:
	for folder in $(SUBDIRS) ; do \
			cd $$folder && terraform plan && terraform apply --auto-approve ; \
	done

tfdestroy:
	for folder in $(SUBDIRS) ; do \
			cd $$folder && terraform destroy --auto-approve ; \
	done

tfclean:
	for folder in $(SUBDIRS) ; do \
			rm -rf $$folder/.terraform* ; \
	done

examplescreate: tfinit tfaplly

examplesclean: tfdestroy tfclean
