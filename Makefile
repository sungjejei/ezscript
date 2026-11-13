.PHONY: install all

PREFIX ?= /usr/local
BINDIR := $(PREFIX)/bin
APPS := nosuspend.sh modify-grub.sh lsc.sh

all:
	@echo "Every source files are shell script files; there is nothing to do."

install:
	@for i in $(APPS); do \
		echo "  INSTALL  $(BINDIR)/$${i%.*}"; \
		install -m 755 "$$i" "$(BINDIR)/$${i%.*}"; \
	done
