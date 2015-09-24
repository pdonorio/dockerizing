###########################################
## Spark 1.4.1 over Hadoop 2.6 over Ubuntu
###########################################

FROM sequenceiq/hadoop-ubuntu:2.6.0
MAINTAINER "Paolo D'Onorio De Meo <p.donoriodemeo@gmail.com>"

# From http://www.eu.apache.org/dist/spark/spark-1.4.1/

ENV SPARK_VERSION spark-1.4.1
ENV HADOOP_VERSION hadoop2.6
ENV SPARK_BIN "$SPARK_VERSION-bin-$HADOOP_VERSION"
ENV SPARK_URL "http://www.eu.apache.org/dist/spark/$SPARK_VERSION/$SPARK_BIN.tgz"

# Spark
RUN curl $SPARK_URL | tar -xz -C /usr/local/
RUN cd /usr/local && ln -s $SPARK_BIN spark

#/usr/local/spark/bin/spark-submit