# Python3 MapReduce on a notebook server - mrjob

# Stack with no hub:
# $ cd python/py3base; docker build -t pdonorio/py3kbase .
# $ cd ../py3dataconda; docker build -t pdonorio/py3dataconda .
# $ cd ../py3mapreduce; docker build -t pdonorio/py3mapreduce .

FROM pdonorio/jupy3k
#FROM pdonorio/py3dataconda
MAINTAINER "Paolo D'Onorio De Meo <p.donoriodemeo@gmail.com>"

###############################
# Add mrjob from Yelp
WORKDIR /tmp

## For CONDA, when python 3.5 will work!!

# # CONDA_ENV_PATH = /opt/miniconda/envs/py3k
# ENV myscript /tmp/script.sh
# RUN echo "source /opt/miniconda/bin/activate $CONDAENV" > $myscript
# RUN echo "\$CONDA_ENV_PATH/bin/pip install -e ." >> $myscript

RUN git clone https://github.com/Yelp/mrjob && cd mrjob && \
# # COULD HAVE BEEN DONE BETTER
#     bash $myscript \
    pip3 install -e . \
    && cd .. && rm -r mrjob

WORKDIR /data