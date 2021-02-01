.phony: install

install:
	@echo "installing dash's vimrc..."
	bash ./install.sh install
	@echo "done."

uninst:
	@echo "uninstalling dash's vimrc..."
	bash ./install.sh uninstall
	@echo "done."

