#!/bin/zsh

# Simple script to set up Git and RSpec for a Ruby project
# as per instructions on https://github.com/makersacademy/golden-square/blob/main/pills/setting_up_an_rspec_project.md

createdb makersBnb
echo "[+] makersBnB database created"
psql -h 127.0.0.1 makersBnB < bnb_table.sql
echo "[+] BnB table seed added successfully"
psql -h 127.0.0.1 makersBnB < seeds_accounts.sql
echo "[+] BnB accounts seed added successfully"
psql -h 127.0.0.1 makersBnB < seeds_spaces.sql
echo "[+] BnB spaces seed added successfully"