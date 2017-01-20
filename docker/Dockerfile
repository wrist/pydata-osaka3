FROM continuumio/miniconda3

MAINTAINER Hiromasa OHASHI <stoicheia1986@gmail.com>

RUN apt-get update --fix-missing
RUN apt-get install -y make build-essential autoconf automake libtool autoconf-doc libtool-doc pkg-config autogen

RUN conda install jupyter -y
RUN conda install numpy scipy cython matplotlib -y

WORKDIR /opt/notebooks

# libsndfileをgithubから落としてビルドする
RUN git clone https://github.com/erikd/libsndfile
RUN apt-get install -y 
RUN cd libsndfile && ./autogen.sh && ./configure && make

# notebookをgithubから落とす
ADD dummyfile /tmp
RUN git clone --depth 1 https://github.com/wrist/pydata-osaka3
