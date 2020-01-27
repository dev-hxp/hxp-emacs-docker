FROM ubuntu:latest
RUN apt update
RUN apt install -y ca-certificates
COPY sources.list /etc/apt/sources.list
RUN apt update
RUN apt install -y make clang gcc autoconf git texinfo
RUN useradd -G sudo -u 1000 --create-home emacs
ENV HOME /home/emacs
WORKDIR /home/emacs/hxp-emacs
# RUN git config --global http.postBuffer 5242880000
# RUN git config --global http.lowSpeedLimit 0
# RUN git config --global http.lowSpeedTime 999999
# RUN git clone https://github.com/XipingHu/hxp-emacs.git --depth 1
# WORKDIR hxp-emacs
# RUN git fetch --unshallow
COPY hxp-emacs .
# RUN make install
RUN git checkout HEAD~1
RUN ./autogen.sh
RUN ./configure --with-gnutls=ifavailable
RUN make
RUN make install
CMD /bin/bash
