#!/bin/bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS EC2 instance or Mac OS
# for headless setup. 
# define the kernel name in the variable KERNEL
KERNEL="$(uname -s)";
DIRECTORY="$(cd `dirname $0` && pwd)";
export		RED="[0;31m"
export		GREEN="[0;32m"
export		DEFAULT="[0;39m"

if which git > /dev/null; then
	ln -sb ${DIRECTORY}/Ubuntudotfiles/git/gitconfig ~/.gitconfig
	ln -sb ${DIRECTORY}/Ubuntudotfiles/git/gitignore_global ~/.gitignore
	# Download auto completion
	curl https://raw.github.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
	if [ -d ./Ubuntudotfiles ]
		then
			cd Ubuntudotfiles/;
			git pull;
			cd ..
		else
			git clone https://github.com/pierre752/Ubuntudotfiles.git
	fi

	# s is for symboic link and b is for backup
	ln -sb ${DIRECTORY}/Ubuntudotfiles/.screenrc ~/
	ln -sb ${DIRECTORY}/Ubuntudotfiles/.bash_profile ~/
	ln -sb ${DIRECTORY}/Ubuntudotfiles/.bashrc ~/
	ln -sb ${DIRECTORY}/Ubuntudotfiles/.bashrc_custom ~/
	else
		echo "${RED}Attention: ${DEFAULT} Git not found"
fi
if [ ${KERNEL} = "Linux" ]; then
	sh ${DIRECTORY}/Linux/LinuxInstall.sh
fi

unset RED GREEN DEFAULT

echo "All links made correctly for a $KERNEL operating system, if there is an error, please report to pierre752@gmail.com"
