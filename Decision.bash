#!/bin/bash
#    _________________________________________________________________________________________________
#   |* ___________________________________________GPL-3_Licence_____________________________________ *|
#   | /                                                                                             \ |
#   | |         This program is free software: you can redistribute it and/or modify                | |
#   | |         it under the terms of the GNU General Public License as published by                | |
#   | |         the Free Software Foundation, either version 3 of the License, or                   | |
#   | |         (at your option) any later version.                                                 | |
#   | |                                                                                             | |
#   | |         This program is distributed in the hope that it will be useful,                     | |
#   | |         but WITHOUT ANY WARRANTY; without even the implied warranty of                      | |
#   | |         MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the                       | |
#   | |         GNU General Public License for more details.                                        | |
#   | |                                                                                             | |
#   | |         You should have received a copy of the GNU General Public License                   | |
#   | |         along with this program.  If not, see <http://www.gnu.org/licenses/>.               | |
#   | |                                                                                             | |
#   | \_____________________________________________________________________________________________/ |
#   |* _____________________________________Questionable_|_2-25-2020________________________________ *|
#   | /                                                                                             \ |
#   | |                                    Written by: Joshua Hoffman                               | |
#   | |                                 joshua.hoffman.ray@protonmail.com                           | |
#   | |                                                                                             | |
#   | \________________________________________Modulation_Project___________________________________/ |
#   |_________________________________________________________________________________________________|


Questionable () {

	while [[ -z "$Sound" ]]; do
	read -ep "Enter "$1"?: " Sound

		if [[ ${Questionable_1:=1} != 0 ]]; then
		Decision "I got: \"$Sound\" - Correct"; Sound_Check="$?"

			if [[ "$Sound_Check" != 1 ]]; then
			unset Sound
			fi

		fi

	done

	if [[ ${Questionable_2:=1} != 0 ]]; then
	echo "You entered: \"$Sound\""
	fi

export "$Sound"

}

Decision () {

	until [[ ${Say_It,,} =~ ^(y|n) ]]; do
	read -${Decision_e:=e} -${Decision_p:=p} $1 (y/n)?: " You_Say && Say_It=${You_Say::1}

		if [[ ! ${Decision_B1:=1} = 0 ]]; then
		read -${Decision_e:=e} -${Decision_p:=p} "You selected $You_Say (y/n)?: " Say_What && Say_What=${Say_What::1}

			if [[ ! ${Say_What,,} =~ ^(y) || ! ${Say_It,,} =~ ^(y|n) ]]; then
			read -p "You seem$Really unsure, press enter to retry..."
			unset Say_What Say_It You_Say && Really=" really$Really"
			fi

		fi

	done

Say_It=${Say_It/n/} && ${Questionable_return:=return} ${#Say_It}

}

Questionable something
