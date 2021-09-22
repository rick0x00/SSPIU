#!/bin/bash
username=$USER;
sudo echo "Start";

hash="#############################################################";
linha="_____________________________________________________________";
FIM="Tarefa Finalizada";
Nopcao=0;
opcaoAnt=1;
linhacurta="____________________________________";
packgo=0;
user="anonimo";
dir=$(pwd);
cd /etc

echo "$hash";

PACK(){
	if [ "$packgo" -eq "0"  ];
		then
			MENU;
		elif [ "$packgo" -eq "1" ]; 
			then
			echo "pack de instalação";
	fi	
}

SUSCESS(){
	echo -e "\e[1;32m OK \e[0m"
}

ERROR(){
	echo -e "\e[5;41m ERRO NO PROCESSO \e[0m"
}

Ultimo_Comando(){
	case $? in
		"0")
			ERROR;
		;;
		"1")
			SUSCESS;
		;;
	esac
}

Estado(){
	echo "$linha";
	echo -n "Seu nome de usuário é: " && whoami;
	echo "hora atual e tempo que o computador está ligado:";
	uptime;
	echo "O script está executando do diretório: ";
	pwd;
	echo "Nome do Script: $0";
	echo "PID: $$";
	#echo "Todos os Ultimos Argumentos: $*";
	#echo "Retorno do Ultimo comando: $?";
	#Ultimo_Comando;
	echo "$linha";
}

Atualizar(){
	echo "$linha";
	echo "$hash";
	echo "Update e Upgrade";
	echo "$hash";
	sudo apt update;
	sudo apt upgrade -y;
	echo "$linha";
	echo -e "\e[42m   $FIM   \e[0m";
	echo "$linha";
	PACK;
}

Instalando_Dependencias(){
	echo "$linha";
	echo "$Instalando Dependências";
	echo "$hash";
	echo "Instalando Complemento apt https";
	echo "$hash";
	sudo apt install apt-transport-https -y;
	echo "$linha";
	echo -e "\e[42m   $FIM   \e[0m";
	echo "$linha";
	echo "$hash";
	echo "Instalando Complemento Curl";
	echo "$hash";
	sudo apt install curl -y;
	echo "$linha";
	echo -e "\e[42m   $FIM   \e[0m";
	echo "$linha";
	echo "$hash";
	echo "Instalando Complemento Python-pip";
	echo "$hash";
	# sudo curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py;
	# sudo python3 get-pip.py;
	sudo apt install python3-pip -y;
	pip3 install pyserial; #algo a parte mas que é base para comunicação serial;
	echo "$linha";
	echo -e "\e[42m   $FIM   \e[0m";
	echo "$linha";
	PACK;
}

Instalando_Snaps(){
	echo "$hash";
	echo "Instalando Snaps's";
	echo "$hash";
	sudo apt install snapd -y;
	sudo snap install snap-store -y;
	echo "$linha";
	echo -e "\e[42m   $FIM   \e[0m";
	echo "$linha";
	PACK;	
}

Instalando_CHROME(){
	echo "$hash";
	echo "Instalando Chrome";
	echo "$hash";
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O "chrome".deb;
	sudo apt install ./chrome.deb -y;
	rm ./chrome.deb;
	echo "$linha";
	echo -e "\e[42m   $FIM   \e[0m";
	echo "$linha";
	PACK;
}

Instalando_Sublime(){
	echo "$hash";
	echo "Instalando Sublime-Text";
	echo "$hash";
	wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add - ;
	sudo apt-get install apt-transport-https
	echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list;
	sudo apt update;
	sudo apt install sublime-text -y;
	echo "$linha";
	echo -e "\e[42m   $FIM   \e[0m";
	echo "$linha";
	PACK;
}

Instalando_Spotify(){
	echo "$hash";
	echo "Instalando Spotify";
	echo "$hash";
	curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add - ;
	echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list;
	sudo apt-get update && sudo apt-get install spotify-client -y;
	echo "$linha";
	echo -e "\e[42m   $FIM   \e[0m";
	echo "$linha";
	PACK;
}

Instalando_VirtualBox(){
	echo "$hash";
	echo "Instalando VirtualBox";
	echo "$hash";
	sudo apt install virtualbox -y;
	sudo wget "https://download.virtualbox.org/virtualbox/6.1.12/Oracle_VM_VirtualBox_Extension_Pack-6.1.12.vbox-extpack";
	sudo chmod 777 Oracle_VM_VirtualBox_Extension_Pack-6.1.12.vbox-extpack;
	sudo VBoxManage extpack install --replace Oracle_VM_VirtualBox_Extension_Pack-6.1.12.vbox-extpack;
	sudo rm Oracle_VM_VirtualBox_Extension_Pack-6.1.12.vbox-extpack;
	sudo usermod -a -G vboxusers "$username";
	echo "$linha";
	echo -e "\e[42m   $FIM   \e[0m";
	echo "$linha";
	PACK;
}

Instalando_Wine(){
	echo "$hash";
	echo "Instalando Wine's";
	echo "$hash";
	sudo dpkg --add-architecture i386 ;
	sudo wget -nc https://dl.winehq.org/wine-builds/winehq.key;
	sudo apt-key add winehq.key;
	sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main';
	sudo apt update;
	sudo apt install --install-recommends winehq-stable -y;
	sudo apt install wine-stable -y;
	sudo apt install wine -y;
	sudo apt install wine64 -y;
	sudo apt install wine64-preloader -y;
	sudo apt install wine64-tools -y;
	sudo apt install wine32-preloader -y;
	sudo apt install wine-binfmt -y;
	sudo apt install winetricks -y;
	sudo apt install q4wine -y;
	sudo apt install winetricks -y;
	sudo apt install wine-installer -y;
	sudo apt install winehq-stable -y;
	sudo apt install wine-stable -y;
	sudo apt install wine-stable-i386 -y;
	sudo apt install wine-stable-amd64 -y;
	sudo apt install wine-binfmt -y;
	sudo apt install wine-desktop-files -y;
	echo "$linha";
	echo -e "\e[42m   $FIM   \e[0m";
	echo "$linha";
	PACK;
}

Instalando_Gimp(){
	echo "$hash";
	echo "Instalando Gimp";
	echo "$hash";
	sudo apt install gimp -y;
	echo "$linha";
	echo -e "\e[42m   $FIM   \e[0m";
	echo "$linha";
	PACK;
}

Instalando_MS-fontes(){
	echo "$hash";
	echo "Instalando MS Fontes";
	echo "$hash";
	sudo apt install ttf-mscorefonts-installer -y;
	echo "$linha";
	echo -e "\e[42m   $FIM   \e[0m";
	echo "$linha";
	PACK;
}

Instalando_VLC(){
	echo "$hash";
	echo "Instalando VLC";
	echo "$hash";
	sudo apt install vlc -y;
	echo "$linha";
	echo -e "\e[42m   $FIM   \e[0m";
	echo "$linha";
	PACK;
}

Instalando_GIT(){
	echo "$hash";
	echo "Instalando GIT";
	echo "$hash";
	sudo apt install git -y;
	echo "$linha";
	echo -e "\e[42m   $FIM   \e[0m";
	echo "$linha";
	PACK;
}

Instalando_Flat-remix(){
	echo "$hash";
	echo "Instalando Flat Remix";
	echo "$hash";
	sudo mkdir Stmp;
	cd /Etc/Stmp/;
	sudo git clone https://github.com/daniruiz/flat-remix;
	sudo git clone https://github.com/daniruiz/flat-remix-gtk;
	# sudo git clone https://github.com/daniruiz/flat-remix-gnome;
	# sudo git clone https://github.com/daniruiz/flat-remix-kde;
	mkdir -p ~/.icons && mkdir -p ~/.themes;
	cp -r flat-remix/Flat-Remix* ~/.icons/ && cp -r flat-remix-gtk/Flat-Remix-GTK* ~/.themes/;
	cd ..;
	rm -r Stmp/;
	sudo add-apt-repository ppa:daniruiz/flat-remix
	sudo apt-get update
	sudo apt-get install flat-remix-gnome
	echo "$linha";
	echo -e "\e[42m   $FIM   \e[0m";
	echo "$linha";
	PACK;
}

Instalando_Gnome-Tweaks(){
	echo "$hash";
	echo "Instalando Gnome Tweaks";
	echo "$hash";
	sudo apt install gnome-tweaks gnome-tweak-tool -y;
	echo "$linha";
	echo -e "\e[42m   $FIM   \e[0m";
	echo "$linha";
	PACK;
}

Instalando_fonts-hack-ttf(){
	echo "$hash";
	echo "Instalando Fonte Hack";
	echo "$hash";
	sudo apt install fonts-hack-ttf -y;
	echo "$linha";
	echo -e "\e[42m   $FIM   \e[0m";
	echo "$linha";
	PACK;
}

Instalando_Telegram(){
	echo "$hash";
	echo "Instalando Telegram(Snap)";
	echo "$hash";
	sudo snap install telegram-cli telegram-desktop;
	echo "$linha";
	echo -e "\e[42m   $FIM   \e[0m";
	echo "$linha";
	PACK;
}

Instalando_MEGA(){
	echo "$hash";
	echo "Instalando MEGA";
	echo "$hash";
	wget "https://mega.nz/linux/MEGAsync/xUbuntu_20.04/amd64/megasync-xUbuntu_20.04_amd64.deb" -O "MEGAsync".deb;
	wget "https://mega.nz/linux/MEGAsync/xUbuntu_20.04/amd64/nautilus-megasync-xUbuntu_20.04_amd64.deb" -O "MEGAgestor".deb;
	sudo apt install ./MEGAsync.deb -y;
	sudo apt install ./MEGAgestor.deb -y;
	rm ./MEGAsync.deb;
	rm ./MEGAgestor.deb;
	echo "$linha";
	echo -e "\e[42m   $FIM   \e[0m";
	echo "$linha";
	PACK;
}

Instalando_Odrive(){
	echo "$hash";
	echo "Instalando Odrive(Snap)";
	echo "$hash";
	sudo snap install odrive-unofficial;
	echo "$linha";
	echo -e "\e[42m   $FIM   \e[0m";
	echo "$linha";
	PACK;
}

Instalando_Dropbox(){
	echo "$hash";
	echo "Instalando Dropbox";
	echo "$hash";
	wget "https://linux.dropbox.com/packages/ubuntu/dropbox_2020.03.04_amd64.deb" -O "Dropbox".deb;
	sudo apt install ./Dropbox.deb -y;
	rm ./Dropbox.deb;
	echo "$linha";
	echo -e "\e[42m   $FIM   \e[0m";
	echo "$linha";
	PACK;
}

Instalando_Blender(){
	echo "$hash";
	echo "Instalando Blender";
	echo "$hash";
	sudo apt install blender -y;
	echo "$linha";
	echo -e "\e[42m   $FIM   \e[0m";
	echo "$linha";
	PACK;
}

Instalando_VScode(){
	echo "$hash";
	echo "Instalando VS code(snap)";
	echo "$hash";
	sudo snap install code --classic;
	echo "$linha";
	echo -e "\e[42m   $FIM   \e[0m";
	echo "$linha";
	PACK;
}

Instalando_ArduinoIDE(){
	echo "$hash";
	echo "Instalando Arduino IDE";
	echo "$hash";
	sudo wget https://downloads.arduino.cc/arduino-1.8.12-linux64.tar.xz -O arduinoide.tar.xz;
	sudo tar -xvf arduinoide.tar.xz;
	sudo rm -rf arduinoide.tar.xz;
	cd arduino-1.8.12/;
	pwd;
	sudo ./install.sh;
	cd ..;
	sudo rm -rf arduino*;
	sudo usermod -a -G dialout "$username";
	cd /home/"$username";
	sudo chmod 777 -R Arduino/;
	echo "$linha";
	echo -e "\e[42m   $FIM   \e[0m";
	echo "$linha";
	PACK;
}

Instalando_Esp32BoardLibArduinoIDE(){
	echo "$hash";
	echo "Instalando placa esp32 na ArduinoIDE)";
	echo "$hash";
	sudo usermod -a -G dialout "$username";
	mkdir -p /home/"$username"/Arduino/hardware/espressif;
	cd /home/"$username"/Arduino/hardware/espressif;
	git clone https://github.com/espressif/arduino-esp32.git esp32;
	cd esp32/tools/;
	sudo python3 get.py;
	echo "$linha";
	echo -e "\e[42m   $FIM   \e[0m";
	echo "$linha";
	cd /tmp;
	PACK;
}

Instalando_PlatformIO(){
	echo "$hash";
	echo "Instalando Core PlatformIO";
	echo "$hash";
	python3 -c "$(curl -fsSL https://raw.githubusercontent.com/platformio/platformio/develop/scripts/get-platformio.py)";
	sudo pip3 install -U platformio;
	curl -fsSL https://raw.githubusercontent.com/platformio/platformio-core/master/scripts/99-platformio-udev.rules | sudo tee /etc/udev/rules.d/99-platformio-udev.rules
	sudo cp 99-platformio-udev.rules /etc/udev/rules.d/99-platformio-udev.rules
	sudo service udev restart
	sudo usermod -a -G dialout $username
	sudo usermod -a -G plugdev $username
	echo "$linha";
	echo -e "\e[42m   $FIM   \e[0m";
	echo "$linha";
	cd /tmp;
	PACK;
}


Instalando_Kdenlive(){
	echo "$hash";
	echo "Instalando kdenlive";
	echo "$hash";
	sudo apt install kdenlive kdenlive-data kdenlive-dbg -y;
	echo -e "\e[42m   $FIM   \e[0m";
	echo "$linha";
	cd /tmp;
	PACK;
}

Instalando_RaspImagerInstaller(){
	echo "$hash";
	echo "Instalando kdenlive";
	echo "$hash";
	wget https://downloads.raspberrypi.org/imager/imager_amd64.deb -O "RaspImager".deb;
	sudo apt install ./RaspImager.deb -y;
	rm ./RaspImager.deb;
	echo -e "\e[42m   $FIM   \e[0m";
	echo "$linha";
	cd /tmp;
	PACK;
}

Instalando_FreeCad(){
	echo "$hash";
	echo "Instalando FreeCAD";
	sudo add-apt-repository ppa:freecad-maintainers/freecad-stable;
	sudo apt update;
	sudo apt install freecad -y;
	apt-cache policy freecad
	echo -e "\e[42m   $FIM   \e[0m";
	echo "$linha";
	cd /tmp;
	PACK;
}

Instalando_ADBeFASTBOOT(){
	echo "$hash";
	sudo apt update;
	echo "Instalando ADB";
	sudo apt install ADB -y;
	echo "Instalando Fatsboot";
	sudo apt install fastboot -y;
	echo -e "\e[42m   $FIM   \e[0m";
	echo "$linha";
	cd /tmp;
	PACK;
}

Instalando_scrcpy(){
	echo "$hash";
	echo "Instalando scrcpy (snap)";
	sudo snap install scrcpy;
	echo -e "\e[42m   $FIM   \e[0m";
	echo "$linha";
	cd /tmp;
	PACK;
}


Instalando_Brave(){
	echo "$hash";
	echo "Instalando ADB";
	sudo apt install apt-transport-https curl gnupg;
	curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add - ;
	echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list ;
	sudo apt update;
	sudo apt install brave-browser -y;
	echo -e "\e[42m   $FIM   \e[0m";
	echo "$linha";
	cd /tmp;
	PACK;
}

Instalando_ZSH(){
	echo "$hash";
	echo "Instalando ZSH";
	sudo apt install zsh zsh-antigen zsh-autosuggestions zsh-common zshdb zsh-doc zsh-static zsh-syntax-highlighting;
	echo -e "\e[42m   $FIM   \e[0m";
	echo "$linha";
	cd /tmp;
	PACK;
}


Instalando_ohmyzsh(){
	echo "$hash";
	echo "Instalando Oh-My-ZSH";
	cd ~;
	zsh;
	sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)";
	echo -e "\e[42m   $FIM   \e[0m";
	echo "$linha";
	cd /tmp;
	PACK;
}

Instalando_3270NerdFont(){
	echo "$hash";
	echo "Instalando 3270 Nerd Font";
	echo "$hash";
	wget http://ftp.br.debian.org/debian/pool/main/3/3270font/fonts-3270_2.2.1-1_all.deb -O "netdfont3270".deb;
	sudo apt install ./netdfont3270.deb -y;
	rm ./netdfont3270.deb;
	echo "$linha";
	echo -e "\e[42m   $FIM   \e[0m";
	echo "$linha";
	PACK;
}


Instalando_AnonymiceNerdfont(){
	echo "$hash";
	echo "Instalando Anonymice Nerd font";
	echo "$hash";
	wget 'https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/AnonymousPro.zip' -O "AnonymiceNerdfont".zip;
	unzip AnonymiceNerdfont.zip;
	sudo cp ttf/*.ttf /usr/local/share/fonts;
	sudo cp *.ttf /usr/local/share/fonts;
	rm -f *.zip;
	rm -rf *.ttf;
	fc-cache -f -v;
	fc-list | grep "Anonymice";
	echo "$linha";
	echo -e "\e[42m   $FIM   \e[0m";
	echo "$linha";
	PACK;
}

Instalando_HackNerdFont(){
	echo "$hash";
	echo "Instalando Hack Nerd Font";
	echo "$hash";
	wget 'https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.zip' -O "HackNerdFont".zip;
	unzip HackNerdFont.zip;
	sudo cp ttf/*.ttf /usr/local/share/fonts;
	rm -f *.zip;
	rm -rf *.ttf;
	fc-cache -f -v;
	fc-list | grep "Hack";
	echo "$linha";
	echo -e "\e[42m   $FIM   \e[0m";
	echo "$linha";
	PACK;
}

Instalando_MesloNerdFont(){
	echo "$hash";
	echo "Instalando Meslo Nerd Font";
	echo "$hash";
	wget 'https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf' -O "MesloNerdFontRegular".ttf;
	wget 'https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf' -O "MesloNerdFontBold".ttf;
	wget 'https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf' -O "MesloNerdFontItalic".ttf;
	wget 'https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf' -O "MesloNerdFontBoldItalic".ttf;
	sudo cp ttf/*.ttf /usr/local/share/fonts;
	sudo cp *.ttf /usr/local/share/fonts;
	rm -f *.zip;
	rm -rf *.ttf;
	fc-cache -f -v;
	fc-list | grep "Meslo";
	echo "$linha";
	echo -e "\e[42m   $FIM   \e[0m";
	echo "$linha";
	PACK;
}

Instalando_Pimp_My_Terminal(){
	echo "$hash";
	echo "Instalando Pimp My Terminal";
	echo "$hash";
	cd ~;
	zsh;
	git clone 'https://github.com/daniruiz/dotfiles.git';
	cd dotfiles;
	./install.sh
	echo "$linha";
	echo -e "\e[42m   $FIM   \e[0m";
	echo "$linha";
	PACK;
}

Instalando_Powerlevel10k(){
	echo "$hash";
	echo "Instalando Powelevel10k";
	echo "$hash";
	cd ~;
	zsh;
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k;
	echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc;
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k;
	echo "$linha";
	echo -e "\e[42m   $FIM   \e[0m";
	echo "$linha";
	PACK;
}

Instalando_Gogh(){
	echo "$hash";
	echo "Instalando Gogh";
	echo "$hash";
	cd ~;
	zsh;
	bash -c  "$(wget -qO- https://git.io/vQgMr)";
	echo "$linha";
	echo -e "\e[42m   $FIM   \e[0m";
	echo "$linha";
	PACK;
}

Instalando_LSD(){
	echo "$hash";
	echo "Instalando LSD";
	echo "$hash";
	cd ~;
	wget 'https://github.com/Peltoche/lsd/releases/download/0.20.1/lsd_0.20.1_amd64.deb' -O "LSD".deb;
	sudo apt install ./LSD.deb -y;
	rm -f ./LSD.deb;
	rm -f *.deb;
	echo "$hash";
	echo "Instalando tree";
	echo "$hash";
	sudo apt install tree;
	#command -v lsd > /dev/null && alias ls='lsd --group-dirs first';
	#command -v lsd > /dev/null && alias ls='lsd --tree';
	echo "$linha";
	echo -e "\e[42m   $FIM   \e[0m";
	echo "$linha";
	PACK;
}

Instalando_ytop(){
	echo "$hash";
	echo "Instalando ytop";
	echo "$hash";
	cd ~;
	wget 'https://github.com/cjbassi/ytop/releases/download/0.6.2/ytop-0.6.2-x86_64-unknown-linux-gnu.tar.gz' -O "ytop".tar.gz;
	tar -zxvf ytop.tar.gz;
	sudo cp ytop /usr/bin;
	rm -f *.tar.gz;
	rm -f ytop;
	echo "$linha";
	echo -e "\e[42m   $FIM   \e[0m";
	echo "$linha";
	PACK;
}

Instalando_bashtop(){
	echo "$hash";
	echo "Instalando bashtop";
	echo "$hash";
	cd ~;
	wget 'http://ftp.br.debian.org/debian/pool/main/b/bashtop/bashtop_0.9.25-1~bpo10+1_all.deb' -O "bashtop".deb;
	sudo apt install ./bashtop.deb -y;
	rm -f *.deb;
	echo "$linha";
	echo -e "\e[42m   $FIM   \e[0m";
	echo "$linha";
	PACK;
}


MENU(){
	Estado;
	echo "$linhacurta";
	echo "|              MENU                |";
	echo "$linhacurta";
	echo "| Nº OP. |          Opção          |";
	echo "|   0    |  EXIT                   |";
	echo "|   1    |  Atualizar              |";
	echo "|   2    |  Instalar Dependências  |";
	echo "|   3    |  Multiplas Opções       |";
	echo "|   4    |  Instalar Snap's        |";
	echo "|   5    |  Instalar Chrome        |";
	echo "|   6    |  Instalar Sublime-Text  |";
	echo "|   7    |  Instalar Spotify       |";
	echo "|   8    |  Instalar VirtualBox    |";
	echo "|   9    |  Instalar Pack Wine     |";
	echo "|   10   |  Instalar Gimp          |";
	echo "|   11   |  Instalar MS Fontes     |";
	echo "|   12   |  Instalar VLC           |";
	echo "|   13   |  Instalar GIT           |";
	echo "|   14   |  Instalar Flat Remix    |";
	echo "|   15   |  Instalar Gnome-Tweaks  |";
	echo "|   16   |  Instalar Fonte Hack    |";
	echo "|   17   |  Instalar Telegram(snap)|";
	echo "|   18   |  Instalar MEGA          |";
	echo "|   19   |  Instalar Odrive(snap)  |";
	echo "|   20   |  Instalar Dropbox       |";
	echo "|   21   |  Instalar Blender       |";
	echo "|   22   |  Instalar VS code(snap) |";
	echo "|   23   |  Instalar Arduino IDE   |";
	echo "|   24   |  Instalar Arduino esp32 |";
	echo "|   25   |  Instalar PlatformIO    |";
	echo "|   26   |  Instalar kdenlive      |";
	echo "|   27   |  Instalar Rasp Imager   |";
	echo "|   28   |  Instalar FreeCAD       |";
	echo "|   29   |  Instalar ADB e FASTBOOT|";
	echo "|   30   |  Instalar scrcpy (snap) |";
	echo "|   31   |  Instalar Brave         |";
	echo "|   32   |  Instalar ZSH           |";
	echo "|   33   |  Instalar oh-my-zsh     |";
	echo "|   34   |  Instalar Nerd font 3270|";
	echo "|   35   |  Instalar NF Anonymice  |";
	echo "|   36   |  Instalar Hack Nerd Font|";
	echo "|   37   |  Instalar NF Meslo      |";
	echo "|   38   |  Instalar Pimp my term  |";
	echo "|   39   |  Instalar Powerlevel10k |";
	echo "|   40   |  Instalar Gogh          |";
	echo "|   41   |  Instalar LSD           |";
	echo "|   42   |  Instalar ytop          |";
	echo "|   43   |  Instalar bashtop       |";
	echo "$linhacurta";
	echo "Digite o Número da opçao desejada:";
	read Nopcao;
	echo "$linhacurta";
	case $Nopcao in
		"0")
			cd "$dir";
			exit;
		;;
		"1")
			Atualizar;
		;;
		"2")
			Instalando_Dependencias;
		;;
		"3")
			packgo=1;
			PACK;
		;;
		"4")
			Instalando_Snaps;
		;;
		"5")
			Instalando_CHROME;
		;;
		"6")
			Instalando_Sublime;
		;;
		"7")
			Instalando_Spotify;
		;;
		"8")
			Instalando_VirtualBox;
		;;
		"9")
			Instalando_Wine;
		;;
		"10")
			Instalando_Gimp;
		;;
		"11")
			Instalando_MS-fontes;
		;;
		"12")
			Instalando_VLC;
		;;
		"13")
			Instalando_GIT;
		;;
		"14")
			Instalando_Flat-remix;
		;;
		"15")
			Instalando_Gnome-Tweaks;
		;;
		"16")
			Instalando_fonts-hack-ttf;
		;;
		"17")
			Instalando_Telegram;
		;;
		"18")
			Instalando_MEGA;
		;;
		"19")
			Instalando_Odrive;
		;;
		"20")
			Instalando_Dropbox;
		;;
		"21")
			Instalando_Blender;
		;;
		"22")
			Instalando_VScode;
		;;
		"23")
			Instalando_ArduinoIDE;
		;;
		"24")
			Instalando_Esp32BoardLibArduinoIDE;
		;;
		"25")
			Instalando_PlatformIO;
		;;
		"26")
			Instalando_Kdenlive;
		;;
		"27")
			Instalando_RaspImagerInstaller;
		;;
		"28")
			Instalando_FreeCad;
		;;
		"29")
			Instalando_ADBeFASTBOOT;
		;;
		"30")
			Instalando_scrcpy;
		;;
		"31")
			Instalando_Brave;
		;;
		"32")
			Instalando_ZSH;
		;;
		"33")
			Instalando_ohmyzsh;
		;;
		"34")
			Instalando_3270NerdFont;
		;;
		"35")
			Instalando_AnonymiceNerdfont;
		;;
		"36")
			Instalando_HackNerdFont;
		;;
		"37")
			Instalando_MesloNerdFont;
		;;
		"38")
			Instalando_Pimp_My_Terminal;
		;;
		"39")
			Instalando_Powerlevel10k;
		;;
		"40")
			Instalando_Gogh;
		;;
		"41")
			Instalando_LSD;
		;;
		"42")
			Instalando_ytop;
		;;
		"43")
			Instalando_bashtop;
		;;
	esac
}

MENU;
cd "$dir";
