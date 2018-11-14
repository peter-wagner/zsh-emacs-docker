FROM ubuntu:18.10ap

# Locales
RUN apt-get update && apt-get install -y locales && locale-gen en_US.UTF-8

# Common packages
RUN apt-get update && apt-get install -y \
      curl \
      git  \
      wget \
      zsh  \
      emacs
RUN chsh -s /usr/bin/zsh

# Install Oh-My-zsh
RUN sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
# TODO setup zshrc by downloading it from github

# Install Linuxbrew
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"

RUN brew install node
echo node -v
echo npm -v
RUN brew install yarn

RUN git config --global alias.co checkout
RUN git config --global alias.br branch
RUN git config --global alias.ci commit
RUN git config --global alias.st status