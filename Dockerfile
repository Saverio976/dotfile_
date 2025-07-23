FROM archlinux:latest

RUN pacman --noconfirm -Syyuu \
    && pacman --noconfirm -S zsh git neovim

RUN useradd -ms /bin/zsh testuser

RUN mkdir -p /home/testuser/dotfiles
COPY --chown=testuser:testuser . /home/testuser/dotfiles/dotfiles
ENV XDG_CONFIG_HOME "/home/testuser/.config"
RUN HOME=/home/testuser zsh "/home/testuser/dotfiles/dotfiles/install.sh" "/home/testuser/dotfiles/dotfiles" "testuser:testuser"

USER testuser

CMD zsh
