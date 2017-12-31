FROM nvidia/cuda:9.0-devel

RUN apt-get update -y \
  && apt-get install -y -qq git automake libssl-dev libcurl4-openssl-dev

RUN git clone https://github.com/tpruvot/ccminer.git /src
WORKDIR /src
RUN cd /src && git checkout cuda-9  && ./autogen.sh && ./configure --with-cuda=/usr/local/cuda && make
