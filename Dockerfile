FROM ubuntu:20.04

RUN apt update
RUN apt install -yy gcc g++ cmake

COPY . print/
WORKDIR print

RUN cmake -H. -B_build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=_install
RUN cmake --build _build
RUN cmake --build _build --target install

ENV LOG_PATH /home/lab-07/logs/log.txt
VOLUME /home/lab-07/logs

WORKDIR _install/bin
ENTRYPOINT ./demo
