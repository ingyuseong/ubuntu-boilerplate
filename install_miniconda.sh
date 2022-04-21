#!/usr/bin/env bash

##################################################
# usage:
#    # quick install
#        $ ./install_miniconda.sh ~/apps/miniconda
#    # install and upgrade
#        $ ./install_miniconda.sh ~/apps/miniconda --upgrade
##################################################

# the absolute path of the miniconda installer (e.g Miniconda3-latest-Linux-x86_64.sh)
INSTALLER_PATH=/tmp/Miniconda3-latest-Linux-x86_64.sh

# the installation root directory of miniconda (e.g /opt/conda)
INSTALL_PREFIX=$1
shift

if [ -z $1 ]; then
    UPGRADE=0
else
    if [ $1 = "--upgrade" ]; then
        UPGRADE=1
        shift
    fi
fi

function _install_miniconda() {

    wget -q https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ${INSTALLER_PATH}
    chmod +x ${INSTALLER_PATH}
    ${INSTALLER_PATH} -b -p ${INSTALL_PREFIX}
    rm ${INSTALLER_PATH}

    if [ $UPGRADE -eq 1 ]; then
        ${INSTALL_PREFIX}/bin/conda upgrade -y --all
        ${INSTALL_PREFIX}/bin/conda clean -ya
        ${INSTALL_PREFIX}/bin/conda install -y conda-build conda-verify
    fi
}
echo "----------------Installing miniconda on $HOME/miniconda3...----------------"
_install_miniconda
echo "----------------Activating conda...----------------"
$HOME/miniconda3/bin/conda init
bash
source activate base
which python
