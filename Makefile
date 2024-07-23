# Makefile to setup configs via symbolic links
# Installs software on system as well

default:
	echo "Please specify a target."

setup:
	mkdir -p ~/.config
	ln -s helix ~/.config/helix
	ln -s neofetch ~/.config/neofetch
	ln -s atuin ~/.config/atuin
	ln -s zsh/.zshrc ~/.zshrc
	ln -s zsh/.zprofile ~/.zprofile

PACKAGES = helix neofetch zsh atuin autojump

install-ubuntu: $(foreach pkg,$(PACKAGES),install-$(pkg)-ubuntu)

install-helix-ubuntu:
	echo "Installing helix"
	add-apt-repository ppa:maveonair/helix-editor
	apt update
	apt install helix

install-neofetch-ubuntu:
	echo "Installing neofetch"
	apt install neofetch

install-zsh-ubuntu:
	echo "Installing zsh"
	apt install zsh
	echo "Installing ohmyzsh"
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	echo "Installing p10k"
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

install-atuin-ubuntu:
	cargo install atuin

install-autojump-ubuntu:
	mkdir -p build
	git clone https://github.com/wting/autojump.git build/autojump
	pushd build/autojump
	./install.py
	popd

clean:
	rm ~/.config/helix
	rm ~/.config/neofetch
	rm ~/.config/atuin
	rm ~/.zshrc
	rm ~/.zprofile
