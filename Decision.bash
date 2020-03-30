#!/bin/bash

Decision () {

	until [[ ${Say_It,,} =~ ^(y|n) ]]; do
	read -${Decision_e:=e}${Decision_p:=p} "$1 (y/n)?: " You_Say && Say_It=${You_Say::1}

		if [[ ! ${Decision_B1:=0} = 0 ]]; then
		read -${Decision_e:=e}${Decision_p:=p} "You selected $You_Say (y/n)?: " Say_What && Say_What=${Say_What::1}

			if [[ ! ${Say_What,,} =~ ^(y) || ! ${Say_It,,} =~ ^(y|n) ]]; then
			read -p "You seem$Really unsure, press enter to retry..."
			unset Say_What Say_It You_Say && Really=" really$Really"
			fi

		fi

	done

Say_It=${Say_It/n/} && ${Questionable_return:=return} ${#Say_It}

}

Decision "Yes or no"; echo $?
