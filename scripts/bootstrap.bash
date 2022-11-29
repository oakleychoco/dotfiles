#!/usr/bin/env bash

# For some manually install tools need to install in `.bin` folder.
mkdir $HOME/.dotfiles/.bin

# Initial settings
info "Start to Symlink .bash_profile"
ln -sf $HOME/.dotfiles/configs/.bash_profile $HOME/.bash_profile
source $HOME/.dotfiles/configs/.bash_profile


# Install homebrew without sudo.
# @see https://docs.brew.sh/Installation
if [[ -z $(command -v brew) ]];then
    info "Start to install Homebrew"

    mkdir -p $DOTFILES_PATH/.homebrew && \
    curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C $DOTFILES_PATH/.homebrew && \
    chmod +x $DOTFILES_PATH/.homebrew/bin/brew && \
    success "Install Homebrew successful."
fi


if [[ -z $(command -v brew) ]];then
    fail "Homebrew install failed."
fi


# Install zsh
[[ -z $(command -v zsh) ]] && \
    info "Start to install zsh" && \
    brew install zsh && \
    success "Install zsh successful."


# Start to use zsh
exec zsh
if [ $? != 0 ];then
    fail "zsh failed."
fi


# Install oh-my-zsh.
# @see https://ohmyz.sh/#install
[[ ! -d $HOME/.oh-my-zsh ]] && \
    info "Start to install zsh" && \
    curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh | bash && \
    success "Install oh-my-zsh successful."


info "Start to install zsh-plugins."
# zsh-completions
# @see https://github.com/zsh-users/zsh-completions#oh-my-zsh
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions

# zsh-autosuggestions
# @see https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# zsh-syntax-highlighting
# @see https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md#oh-my-zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# spaceship theme
# @see https://spaceship-prompt.sh/getting-started/#installing
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
success "Install zsh-plugins successful."


# Install the version management that manage multiple runtime versions with a single CLI tool
# @see https://asdf-vm.com/guide/getting-started.html#_2-download-asdf
[[ -z $(command -v asdf) ]] && \
    info "Start to install asdf." && \
    brew install asdf && \
    success "Install asdf successful."


# Install sdkman(java version management).
# @see https://sdkman.io/install
[[ -z $(command -v sdk) ]] && \
    info "Start to install sdkman." && \
    curl -s "https://get.sdkman.io" | zsh && \
    success "Install sdkman successful."


success "Bootstrap successful."
exit 0
