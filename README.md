# arosini.github.io
This repository serves as a container for my personal website.

# Setting Up

## Install Git

    sudo apt-get install git

## Install Curl

    sudo apt-get install curl

## Install NodeJS

    curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
    sudo apt-get install --yes nodejs

## Install RVM and Ruby

    gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
    \curl -sSL https://get.rvm.io | bash -s stable --ruby
    source ~/.rvm/scripts/rvm

## Clone Repository

    git clone https://github.com/arosini/arosini.github.io.git
    cd arosini.github.io

## Install Gems

    sudo apt-get install ruby-dev
    gem install bundler
    bundle install
    bundle update

# Starting the Server

    middleman

# Building

    middleman build [--clean]

# Deploying

    middleman deploy [--build-before]