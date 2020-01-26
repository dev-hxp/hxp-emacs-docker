FROM ubuntu:latest
RUN apt update
RUN apt install -y git
RUN useradd -G sudo -u 1000 --create-home emacs

ENV HOME /home/emacs
RUN cd /home/emacs
RUN git clone https://github.com/XipingHu/hxp-emacs.git
RUN cd hxp-emacs
RUN ./autogen.sh
RUN ./configure
RUN make
RUN make install
WORKDIR /home/emacs
CMD /bin/bash
