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

ENV SPARK_HOME /usr/local/spark

#/usr/local/spark/bin/spark-submit
#/usr/local/spark/bin/spark-class
#/usr/local/spark/lib/spark-assembly-1.4.1-hadoop2.6.0.jar

# HDFS with spark libs
RUN service ssh start && \
    $HADOOP_PREFIX/etc/hadoop/hadoop-env.sh && \
    $HADOOP_PREFIX/sbin/start-dfs.sh && \
    $HADOOP_PREFIX/bin/hdfs dfsadmin -safemode leave && \
    $HADOOP_PREFIX/bin/hdfs dfs -put $SPARK_HOME/lib /spark

ENV SPARK_JAR hdfs:///spark/$SPARK_BIN.jar
ENV PATH $PATH:$SPARK_HOME/bin:$HADOOP_PREFIX/bin

RUN echo "spark.master\tspark://master:7077" \
    > $SPARK_HOME/conf/spark-defaults.conf

EXPOSE 7077
