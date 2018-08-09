# Setup .bash_profile
rm -f ~/.bash_profile && ln -s $PWD/.bash_profile $HOME/.bash_profile && source ~/.bash_profile

# Install packages
curl -O https://repo.anaconda.com/archive/Anaconda3-5.2.0-Linux-x86_64.sh \
  && bash Anaconda3-5.2.0-Linux-x86_64.sh -f -b -p $HOME/anaconda \
  && echo "export PATH=~/anaconda/bin:${PATH}" >> ~/.bash_profile \
  && source ~/.bash_profile \
  && rm Anaconda3-5.2.0-Linux-x86_64.sh \
  && conda config --add channels conda-forge \
  && conda install nb_conda_kernels --yes \
  && conda install -c damianavila82 rise --yes
pip install --upgrade pip \
  && pip install tensorflow-gpu keras \
  && python cuda_test.py
# Ref: https://towardsdatascience.com/running-jupyter-notebook-in-google-cloud-platform-in-15-min-61e16da34d52
jupyter notebook --generate-config
cat jupyter_config.py >> ~/.jupyter/jupyter_notebook_config.py

# Setup filesystem
mkdir ~/git && git clone https://github.com/harryscholes/agape.git && mv agape ~/git
(cd ~/git/agape && pip install -e ".[gpu]")
mkdir -p ~/lfs/cerevisiae/deepNF
echo "export CEREVISIAEDATA=~/lfs/cerevisiae" >> ~/.bash_profile && source ~/.bash_profile
gsutil cp -r gs://cerevisiae/deepNF $CEREVISIAEDATA
