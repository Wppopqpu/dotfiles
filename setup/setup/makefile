# makefile for advanced dotfile management
SHELL := /bin/bash

TARGET_DIR := $(HOME)
MODULE_DIR := $(HOME)/setup/modules
RES_DIR := $(HOME)/setup/files
SYSTEMD_USER_DIR := $(HOME)/.config/systemd/user

MODULES := $(wildcard $(MODULE_DIR)/*.mk)
include $(MODULES)


.PHONY: help
help:
	@echo "makefile for advanced dotfile management"
	@echo ""
	@echo "available targets:"
	@echo "all - set up everything"

.PHONY: all
all: install-systemd-unit-all

.PHONY: install-systemd-unit-all
install-systemd-unit-all: $(filter install-systemd-unit.%, $(TARGETS))

