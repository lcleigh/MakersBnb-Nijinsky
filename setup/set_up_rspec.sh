#!/bin/zsh

# Simple script to set up Git and RSpec for a Ruby project
# as per instructions on https://github.com/makersacademy/golden-square/blob/main/pills/setting_up_an_rspec_project.md

sudo gem install bundler
echo "[+] bundler installed"
sudo bundle init
echo "[+] bundler initialized"
sudo bundle add rspec
echo "[+] rspec added"
rspec --init
echo "[+] rspec initialized"
git init .
echo "[+] git initialized"
echo "adding Sinatra..."
sudo bundle add sinatra sinatra-contrib webrick rack-test
echo "[+] added sinatra"
sudo bundle add pg
echo "[+] pg gem added"
echo "[!] ready to commit \"Project Setup\""
