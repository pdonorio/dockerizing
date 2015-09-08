# Python3 notebook & pydata stack via continuum conda

# Stack
# $ cd python/py3base; docker build -t pdonorio_py3kbase .
# $ cd ../py3notebook; docker build -t pdonorio_py3knb .
# $ cd ../py3dataconda; docker build -t pdonorio_py3data .
# $ cd ../py3plus; docker build -t pdonorio_jupy3dataslide .

# Run notebook with /opt/start

FROM pdonorio_py3data
MAINTAINER "Paolo D'Onorio De Meo <p.donoriodemeo@gmail.com>"

###############################
# Other python packages
RUN pip3 install jsonschema
# Create a basic profile for current user
RUN ipython3 profile create
# Link extensions from ipython to jupyter
RUN mkdir -p $HOME/.local/share/jupyter
RUN ln -s $HOME/.ipython/nbextensions $HOME/.local/share/jupyter/nbextensions

# Add offline use of mathjax
RUN python3 -m IPython.external.mathjax
# RUN wget https://github.com/mathjax/MathJax/archive/2.5.3.zip
# RUN python3 -m IPython.external.mathjax 2.5.3.zip

# check JUPYTER_CONFIG_DIR
ADD jupyconf.ipy /tmp/script.ipy
RUN ipython /tmp/script.ipy

# # Live slideshows
RUN wget https://github.com/pdonorio/RISE/archive/master.tar.gz \
    && tar xvzf *.gz && cd *master && \
    python3 setup.py install \
    && rm -rf /tmp/*
