#!/bin/bash

if ! command -v conda &> /dev/null
then
    echo "conda could not be found, please install Anaconda or Miniconda."
    echo "Visit https://www.anaconda.com/products/individual for more information and download options."
    exit
fi

conda create --name quantum-env python=3.9 -y

source activate quantum-env

conda install -c conda-forge notebook matplotlib numpy scipy -y
conda install -c anaconda pandas -y
conda install -c conda-forge qiskit -y

conda install -c conda-forge jupyter_contrib_nbextensions -y
jupyter contrib nbextension install --user

echo "Setup completed. Activate your environment with 'conda activate quantum-env'"
echo "Please rememmber to adjust you IBM API key within the .env file. This is .gitignoerd"