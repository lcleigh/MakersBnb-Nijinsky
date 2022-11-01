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
mkdir lib
echo "[+] lib folder created"
git init .
echo "[+] git initialized"
echo "adding Sinatra..."
sudo bundle add sinatra sinatra-contrib webrick rack-test
echo "[+] added sinatra"
mkdir spec/integration
touch spec/integration/app_spec.rb
echo "[+] created the integration tests file"
touch config.ru
echo "[+] created the config file"
sudo bundle add pg
echo "[+] pg gem added"
touch lib/database_connection.rb
echo "[+] created the DatabaseConnection class"
touch spec/seeds.sql
echo "[+] created empty sql seeds file"
touch app.rb
echo "[+] add app.rb file"
mkdir views
echo '[+] make views folder'
echo "[!] ready to commit \"Project Setup\""
