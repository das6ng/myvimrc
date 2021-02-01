.phony: install

PWD=$(shell pwd)
VIMRC="$(HOME)/.vimrc"
BACKUP_FILE="$(HOME)/.vimrc.bak"
UNINST_CMD="mv $(BACKUP_FILE) $(VIMRC)"

install:
	@echo "installing dash's vimrc..."
	mv $(VIMRC) $(BACKUP_FILE) && ln -s $(PWD)/vimrc $(HOME)/.vimrc
	@echo "done."

uninst:
	@echo "uninstalling dash's vimrc..."
	$(UNINST_CMD)
	@echo "done."

