FROM quay.io/domino/compute-environment-images:ubuntu20-py3.9-r4.2-domino5.3-standard

RUN sudo add-apt-repository -y ppa:libreoffice/ppa

RUN sudo apt-get update

RUN sudo apt-get install -y libreoffice

RUN echo 'libssl1.1 libraries/restart-without-asking boolean true' | sudo debconf-set-selections

RUN sudo apt-get install -y texlive-latex-extra
