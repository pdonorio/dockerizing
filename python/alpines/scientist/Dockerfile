############################################
## Scientific course @CINECA

FROM cineca/scientific:alpine
MAINTAINER "Paolo D'Onorio De Meo <p.donoriodemeo@cineca.it>"

ENV PY36 Python3.6
RUN conda create -y -n $PY36 python=3.6.1 \
    && conda clean -y --all
RUN /bin/bash -c "source activate $PY36 && pip install mypy ipython ipykernel version_information"
USER jovyan
RUN /bin/bash -c "source activate $PY36 && python -m ipykernel install --user --name=$PY36"
USER root

ADD bootstrap.sh $BOOTER
RUN chmod +x $BOOTER
