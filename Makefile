# Makefile to setup configs via symbolic links
# Installs software on system as well

default:
	echo "Please specify a target."

setup:
	mkdir -p ~/.config
	[ ! -e ~/.config/helix ] && ln -s helix ~/.config/helix || true
	[ ! -e ~/.config/neofetch ] && ln -s neofetch ~/.config/neofetch || true
	[ ! -e ~/.config/atuin ] && ln -s atuin ~/.config/atuin || true
	[ ! -e ~/.config/fish ] && ln -s fish ~/.config/fish || true

PACKAGES = helix neofetch zsh atuin autojump fish

install-ubuntu: $(foreach pkg,$(PACKAGES),install-$(pkg)-ubuntu)

install-helix-ubuntu:
	echo "Installing helix"
	add-apt-repository ppa:maveonair/helix-editor
	apt update
	apt install helix

install-neofetch-ubuntu:
	echo "Installing neofetch"
	apt install neofetch

# install-zsh-ubuntu:
# 	echo "Installing zsh"
# 	apt install zsh
# 	echo "Installing ohmyzsh"
# 	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# 	echo "Installing p10k"
# 	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

install-atuin-ubuntu:
	echo "Installing atuin"
	cargo install atuin

install-autojump-ubuntu:
	echo "Installing autojump"
	mkdir -p build
	git clone https://github.com/wting/autojump.git build/autojump
	pushd build/autojump
	./install.py
	popd

install-fish-ubuntu:
	echo "Installing fish"
	apt install fish

clean:
	rm ~/.config/helix
	rm ~/.config/neofetch
	rm ~/.config/atuin
	rm ~/.zshrc
	rm ~/.zprofile
	rm -r build
