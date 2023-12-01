#!/bin/bash

color='\033[0;32m'
NC='\033[0m' # No Color

printf "
${color}                                                                                        
 @@@@@@@    @@@@@@    @@@@@@   @@@@@@@      @@@@@@@   @@@  @@@   @@@@@@@  @@@  @@@  @@@ @@@  
 @@@@@@@@  @@@@@@@@  @@@@@@@   @@@@@@@@     @@@@@@@@  @@@  @@@  @@@@@@@@  @@@  @@@  @@@ @@@  
 @@!  @@@  @@!  @@@  !@@       @@!  @@@     @@!  @@@  @@!  @@@  !@@       @@!  !@@  @@! !@@  
 !@!  @!@  !@!  @!@  !@!       !@!  @!@     !@!  @!@  !@!  @!@  !@!       !@!  @!!  !@! @!!  
 @!@!!@!   @!@!@!@!  !!@@!!    @!@@!@!      @!@  !@!  @!@  !@!  !@!       @!@@!@!    !@!@!   
 !!@!@!    !!!@!!!!   !!@!!!   !!@!!!       !@!  !!!  !@!  !!!  !!!       !!@!!!      @!!!   
 !!: :!!   !!:  !!!       !:!  !!:          !!:  !!!  !!:  !!!  :!!       !!: :!!     !!:    
 :!:  !:!  :!:  !:!      !:!   :!:          :!:  !:!  :!:  !:!  :!:       :!:  !:!    :!:    
 ::   :::  ::   :::  :::: ::    ::           :::: ::  ::::: ::   ::: :::   ::  :::     ::    
 ::   : :  ::   : :  :: : :     :           :: :  :    : :  :    :: :: :   :   :::     :     
                                                                                         
${NC}
"

read -p "
Deseja executar o payload[1] ou um script[2]?
[1, 2]: " esc

if [[ "$esc" = 1 ]]; then
	script="#!/usr/bin/env python3"'\n'"import time"'\n'"NULL_CHAR = chr(0)"'\n'"def write_report(report):"'\n''\t'"with open('/dev/hidg0', 'rb+') as fd:"'\n''\t''\t'"fd.write(report.encode())"'\n'

	read -p "Pressione enter quando estiver pronto..." esq
	hold=false
	timer=0
	while IFS= read -r line; do
		if [[ $line = "win" ]]; then
		    line="write_report(chr(8)+NULL_CHAR+NULL_CHAR*5)\n"
		elif [[ $line = "win+r" ]]; then
		    line="write_report(chr(8)+NULL_CHAR+chr(21)+NULL_CHAR*5)\n"
		elif [[ "$line" = "." ]]; then
		    line="write_report(NULL_CHAR*2 +chr(55)+NULL_CHAR*5)\n" 
		elif [[ "$line" = "$" ]]; then
		    line="write_report(chr(2)+NULL_CHAR+chr(33)+NULL_CHAR*5)\n" 
		elif [[ "$line" = "|" ]]; then
		    line="write_report(chr(2)+NULL_CHAR+chr(49)+NULL_CHAR*5)\n"   
		elif [[ "$line" = "\\" ]]; then
		    line="write_report(NULL_CHAR*2 +chr(49)+NULL_CHAR*5)\n"  
		elif [[ "$line" = "{" ]]; then
		    line="write_report(NULL_CHAR*2 +chr(47)+NULL_CHAR*5)\n"   
		elif [[ "$line" = "}" ]]; then
		    line="write_report(NULL_CHAR*2 +chr(48)+NULL_CHAR*5)\n"   
		elif [[ "$line" = "=" ]]; then
		    line="write_report(NULL_CHAR*2 +chr(46)+NULL_CHAR*5)\n" 
		elif [[ "$line" = '"' ]]; then
		    line="write_report(chr(2)+NULL_CHAR+chr(52)+NULL_CHAR*5)\n"      
		elif [[ "$line" = "-" ]]; then
		    line="write_report(NULL_CHAR*2 +chr(45)+NULL_CHAR*5)\n"
		elif [[ "$line" = "_" ]]; then
		    line="write_report(chr(2)+NULL_CHAR+chr(45)+NULL_CHAR*5)\n"
		elif [[ $line =~ ^delay\ [+-]?[0-9]+\.?[0-9]*$ ]]; then
		    number=$(echo "$line" | sed 's/^delay //')
		    line="time.sleep($number)\n"
		elif [[ $line = "esc" ]]; then
		    line="write_report(NULL_CHAR*2+chr(23)+NULL_CHAR*5)\n"
		elif [[ $line = "ctrl" ]]; then
			line="write_report(chr(1)+NULL_CHAR+chr(44)+NULL_CHAR*5)\n"
		elif [[ $line = "alt" ]]; then
			line="write_report(NULL_CHAR*2+chr(226)+NULL_CHAR*5)\n"
		elif [[ $line = "shift" ]]; then
			line="write_report(NULL_CHAR*2+chr(225)+NULL_CHAR*5)\n"
		elif [[ $line = "tab" ]]; then
			line="write_report(NULL_CHAR*2+chr(43)+NULL_CHAR*5)\n"
		elif [[ $line = "enter" ]]; then
			line="write_report(NULL_CHAR*2+chr(88)+NULL_CHAR*5)\n"
		elif [[ $line = "spc" ]]; then
			line="write_report(NULL_CHAR*2+chr(44)+NULL_CHAR*5)\n"
		elif [[ $line = "volumeup" ]]; then
			line="write_report(NULL_CHAR*2+chr(128)+NULL_CHAR*5)\n"
		elif [ $line = "volumedown" ]; then
			line="write_report(NULL_CHAR*2+chr(129)+NULL_CHAR*5)\n"
		elif [[ $line = "hold" ]]; then
			line=""
			hold=true
		elif [ $line = "up" ]; then
			line="write_report(NULL_CHAR*2+chr(82)+NULL_CHAR*5)\n"
		elif [ $line = "down" ]; then
			line="write_report(NULL_CHAR*2+chr(81)+NULL_CHAR*5)\n"
		elif [ $line = "left" ]; then
			line="write_report(NULL_CHAR*2+chr(80)+NULL_CHAR*5)\n"
		elif [ $line = "right" ]; then
			line="write_report(NULL_CHAR*2+chr(79)+NULL_CHAR*5)\n"
		elif [ $line = "a" ]; then
			line="write_report(NULL_CHAR*2+chr(4)+NULL_CHAR*5)\n"
		elif [ $line = "b" ]; then
			line="write_report(NULL_CHAR*2+chr(5)+NULL_CHAR*5)\n"
		elif [ $line = "c" ]; then
			line="write_report(NULL_CHAR*2+chr(6)+NULL_CHAR*5)\n"
		elif [ $line = "d" ]; then
			line="write_report(NULL_CHAR*2+chr(7)+NULL_CHAR*5)\n"
		elif [ $line = "D" ]; then
			line="write_report(chr(2)+NULL_CHAR+chr(7)+NULL_CHAR*5)\n"
		elif [ $line = "e" ]; then
			line="write_report(NULL_CHAR*2+chr(8)+NULL_CHAR*5)\n"
		elif [ $line = "f" ]; then
			line="write_report(NULL_CHAR*2+chr(9)+NULL_CHAR*5)\n"
		elif [ $line = "F" ]; then
			line="write_report(chr(2)+NULL_CHAR+chr(9)+NULL_CHAR*5)\n"
		elif [ $line = "g" ]; then
			line="write_report(NULL_CHAR*2+chr(10)+NULL_CHAR*5)\n"
		elif [ $line = "h" ]; then
			line="write_report(NULL_CHAR*2+chr(11)+NULL_CHAR*5)\n"
		elif [ $line = "i" ]; then
			line="write_report(NULL_CHAR*2+chr(12)+NULL_CHAR*5)\n"
		elif [ $line = "j" ]; then
			line="write_report(NULL_CHAR*2+chr(13)+NULL_CHAR*5)\n"
		elif [ $line = "k" ]; then
			line="write_report(NULL_CHAR*2+chr(14)+NULL_CHAR*5)\n"
		elif [ $line = "l" ]; then
			line="write_report(NULL_CHAR*2+chr(15)+NULL_CHAR*5)\n"
		elif [ $line = "L" ]; then
			line="write_report(chr(2)+NULL_CHAR+chr(15)+NULL_CHAR*5)\n"
		elif [ $line = "m" ]; then
			line="write_report(NULL_CHAR*2+chr(16)+NULL_CHAR*5)\n"
		elif [ $line = "n" ]; then
			line="write_report(NULL_CHAR*2+chr(17)+NULL_CHAR*5)\n"
		elif [ $line = "o" ]; then
			line="write_report(NULL_CHAR*2+chr(18)+NULL_CHAR*5)\n"
		elif [ $line = "O" ]; then
			line="write_report(NULL_CHAR*2+chr(18)+NULL_CHAR*5)\n"
		elif [ $line = "p" ]; then
			line="write_report(NULL_CHAR*2+chr(19)+NULL_CHAR*5)\n"
		elif [ $line = "P" ]; then
			line="write_report(chr(2)+NULL_CHAR+chr(19)+NULL_CHAR*5)\n"
		elif [ $line = "q" ]; then
			line="write_report(NULL_CHAR*2+chr(20)+NULL_CHAR*5)\n"
		elif [ $line = "r" ]; then
			line="write_report(NULL_CHAR*2+chr(21)+NULL_CHAR*5)\n"
		elif [ $line = "s" ]; then
			line="write_report(NULL_CHAR*2+chr(22)+NULL_CHAR*5)\n"
		elif [ $line = "S" ]; then
			line="write_report(chr(2)+NULL_CHAR+chr(22)+NULL_CHAR*5)\n"
		elif [ $line = "t" ]; then
			line="write_report(NULL_CHAR*2+chr(23)+NULL_CHAR*5)\n"
		elif [ $line = "u" ]; then
			line="write_report(NULL_CHAR*2+chr(24)+NULL_CHAR*5)\n"
		elif [ $line = "v" ]; then
			line="write_report(NULL_CHAR*2+chr(25)+NULL_CHAR*5)\n"
		elif [ $line = "V" ]; then
			line="write_report(chr(2)+NULL_CHAR+chr(25)+NULL_CHAR*5)\n"
		elif [ $line = "w" ]; then
			line="write_report(NULL_CHAR*2+chr(26)+NULL_CHAR*5)\n"
		elif [ $line = "W" ]; then
			line="write_report(chr(2)+NULL_CHAR+chr(26)+NULL_CHAR*5)\n"
		elif [ $line = "x" ]; then
			line="write_report(NULL_CHAR*2+chr(27)+NULL_CHAR*5)\n"
		elif [ $line = "y" ]; then
			line="write_report(NULL_CHAR*2+chr(28)+NULL_CHAR*5)\n"
		elif [ $line = "z" ]; then
			line="write_report(NULL_CHAR*2+chr(29)+NULL_CHAR*5)\n"
		elif [ $line = "0" ]; then
			line="write_report(NULL_CHAR*2 +chr(39)+NULL_CHAR*5)\n"
		elif [ $line = "1" ]; then
			line="write_report(NULL_CHAR*2 +chr(30)+NULL_CHAR*5)\n"
		elif [ $line = "2" ]; then
			line="write_report(NULL_CHAR*2 +chr(31)+NULL_CHAR*5)\n"
		elif [ $line = "3" ]; then
			line="write_report(NULL_CHAR*2 +chr(32)+NULL_CHAR*5)\n"
		elif [ $line = "4" ]; then
			line="write_report(NULL_CHAR*2 +chr(33)+NULL_CHAR*5)\n"
		elif [ $line = "5" ]; then
			line="write_report(NULL_CHAR*2 +chr(34)+NULL_CHAR*5)\n"
		elif [ $line = "6" ]; then
			line="write_report(NULL_CHAR*2 +chr(35)+NULL_CHAR*5)\n"
		elif [ $line = "7" ]; then
			line="write_report(NULL_CHAR*2 +chr(36)+NULL_CHAR*5)\n"
		elif [ $line = "8" ]; then
			line="write_report(NULL_CHAR*2 +chr(37)+NULL_CHAR*5)\n"
		elif [ $line = "9" ]; then
			line="write_report(NULL_CHAR*2 +chr(38)+NULL_CHAR*5)\n"
		fi
		if [ $hold = false ]; then
			release="write_report(NULL_CHAR*8)\n"
			script="$script$line$release"
		else
	    		script="$script$line"
			((timer++))
			if [ $timer = 2 ]; then
				hold=false
				timer=0
			fi
		fi
	

	done < payload.dd
        echo -e $script >> script.py
        sudo python3 script.py
	rm -r script.py

elif [[ "$esc" = 2 ]]; then
    read -p "**Scripts devem estar dentro da pasta script
    Digite o nome do script: " scr

    sudo python3 scripts/$scr
fi
