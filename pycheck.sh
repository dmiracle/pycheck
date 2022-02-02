#!/bin/bash
RED='\033[0;31m'
GR='\033[0;32m'
CY='\033[0;36m'
NC='\033[0m' # No Color
python_which=$(which python 2>/dev/null)
python3_which=$(which python3 2>/dev/null)
python_ver=$(python --version 2>/dev/null)
python3_ver=$(python3 --version 2>/dev/null)
conda_ver=$(conda info 2>/dev/null)
pyenv_ver=$(pyenv --version 2>/dev/null)

printf "${GR}================PYTHON===============${NC}\n"
if [ "$python_which" ]
then
    printf "${RED}python${NC} points at ${CY}$python_which${NC}\n"
    printf "$python_ver\n"
else
    printf "No python\n"
fi
if [ "$python3_which" ]
then
    printf "${RED}python3${NC} points at ${CY}$python3_which${NC}\n"
    printf "$python3_ver\n"
else 
    printf "No python3\n"
fi
printf "${GR}================CONDA================${NC}\n"
if [ "$conda_ver" ]
then
    printf "${RED}conda${NC} version ${CY}$conda_ver${NC}\n"
    printf "${CY}Environments:${NC}\n"
    conda env list
    printf "${CY}Python versions available:${NC}\n"
    conda search python
else
    printf "No conda\n"
fi
printf "${GR}================PYENV================${NC}\n"
if [ "$pyenv_ver" ]
then
    printf "${RED}pyenv${NC} version ${CY}$pyenv_ver${NC}\n"
    printf "${CY}Python versions available:${NC}\n"
    pyenv versions
else 
    printf "No pyenv\n"
fi