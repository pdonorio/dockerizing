# Python3 notebook & pydata stack via continuum conda

# Stack with no hub:
# $ cd python/py3base; docker build -t pdonorio_py3kbase .
# $ cd ../py3notebook; docker build -t pdonorio_py3knb .
# $ cd ../py3dataconda; docker build -t pdonorio_py3data .

# Run notebook with /opt/start

FROM pdonorio/jupy3k
#FROM pdonorio_py3knb
MAINTAINER "Paolo D'Onorio De Meo <p.donoriodemeo@gmail.com>"

###############################
# (mini)CONDA package manager
RUN wget --quiet \
    https://repo.continuum.io/miniconda/Miniconda-latest-Linux-x86_64.sh && \
    bash Miniconda-latest-Linux-x86_64.sh -b -p /opt/miniconda && \
    rm Miniconda-latest-Linux-x86_64.sh
ENV PATH /opt/miniconda/bin:$PATH
RUN chmod -R a+rx /opt/miniconda

###############################
# Install PyData modules and IPython dependencies
WORKDIR /tmp
RUN conda update --quiet --yes conda
ENV CONDAENV "py3k"
RUN conda create -y -n $CONDAENV python=3 ipython
RUN conda install -y -n $CONDAENV jupyter ipywidgets \
        numpy scipy pandas matplotlib seaborn bokeh scikit-learn sympy \
        six pip sqlalchemy cython pyzmq statsmodels \
        theano tornado jinja2 sphinx pygments nose readline \
        openpyxl xlrd
RUN conda clean -y -t

# Needed by matplotlib inline
RUN apt-get install -y python-qt4

###############################
# Script: Activate virtualenv and launch notebook
ENV STARTSCRIPT /opt/start
#RUN source activate $CONDAENV
RUN echo "#!/bin/bash" > $STARTSCRIPT
RUN echo "source /opt/miniconda/bin/activate $CONDAENV" >> $STARTSCRIPT
RUN echo "# install kernels" >> $STARTSCRIPT
RUN echo "python3 -m ipykernel.kernelspec" >> $STARTSCRIPT
RUN echo "jupyter notebook --ip=0.0.0.0 --no-browser" >> $STARTSCRIPT
RUN chmod +x $STARTSCRIPT

WORKDIR /data
