#!/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
LIGHT_PURPLE='\033[1;35m'
NC='\033[0m' # No Color

if command -v python3.9; then
  echo -e "${GREEN}Python 3.9 already installed!${NC}"
  echo "TODO: add a config flag that re-installs Python3.9 if the user wants to"
else
  cd /opt
  sudo wget https://www.python.org/ftp/python/3.9.0/Python-3.9.0.tgz
  sudo tar xzf Python-3.9.0.tgz
  cd Python-3.9.0/
  sudo LD_RUN_PATH=/usr/local/lib ./configure --enable-optimizations
  sudo LD_RUN_PATH=/usr/local/lib make altinstall
  echo -e "${GREEN}Python 3.9 installed!${NC}"
fi
