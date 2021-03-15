#!/bin/bash

VIMRC="$HOME/.vimrc"
BACKUP_FILE="$HOME/.vimrc.bak"
SCRIPT_DIR=$(dirname $(readlink -f $0))

# action: install uninst
ACT=$1

HELP() {
	echo "sh $0 [install|uninstall]"
}

INSTALL() {
	#echo "install..."
	if [ -e $BACKUP_FILE ]; then
		ans=""
		read -p "backup file already exists, overwrite it? y/N: " ans
		if [[ "$ans" != "y" ]]; then
			return
		fi
	fi
	if [ -e $VIMRC ]; then
		echo "backup old config file: $VIMRC"
		mv $VIMRC $BACKUP_FILE
	fi
	ln -s $SCRIPT_DIR/vimrc $VIMRC
}

UNINSTALL() {
	#echo "uninstall..."
	if [ ! -L $VIMRC ]; then
		echo "file $VIMRC not exist or is not a symbolic link."
		return	
	fi
	if [ ! -e $BACKUP_FILE ]; then
		echo "no backup file($BACKUP_FILE), nothing to do."
		return
	fi
	mv $BACKUP_FILE $VIMRC
}

MAIN() {
	case $ACT in
	""|"install")
		INSTALL
	;;
	"uninst"|"uninstall")
		UNINSTALL
	;;
	*)
		HELP
	esac
}

MAIN

