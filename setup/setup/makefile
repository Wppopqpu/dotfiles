# makefile for advanced dotfile management
SHELL := /bin/bash

TARGET_DIR := $(HOME)
MODULE_DIR := $(HOME)/setup/modules
RES_DIR := $(HOME)/setup/files
SYSTEMD_USER_DIR := $(HOME)/.config/systemd/user
CONFIG_DIR := $(HOME)/.config

MODULES := $(wildcard $(MODULE_DIR)/*.mk)
include $(MODULES)


.PHONY: help
help:
	@echo "makefile for advanced dotfile management"
	@echo ""
	@echo "available targets:"
	@echo "all - set up everything"

.PHONY: all
all: install-systemd-unit-all gui cli

.PHONY: install-systemd-unit-all
install-systemd-unit-all: $(filter install-systemd-unit.%, $(TARGETS))
	@echo systemd units installed

.PHONY: cli
cli: $(filter cli.%, $(TARGETS))

.PHONY: gui
gui: gui.theme

.PHONY: gui.theme
gui.theme: $(filter gui.theme.%, $(TARGETS))

