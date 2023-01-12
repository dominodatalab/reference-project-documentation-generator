FROM quay.io/domino/base:Ubuntu18_DAD_Py2.7_R3.5-20190501

RUN echo "ubuntu    ALL=NOPASSWD: ALL" >> /etc/sudoers

RUN sudo add-apt-repository -y ppa:libreoffice/ppa

RUN sudo apt-get update

RUN sudo apt-get install -y libreoffice

RUN echo 'libssl1.1 libraries/restart-without-asking boolean true' | sudo debconf-set-selections

RUN sudo apt-get install -y texlive-latex-extra

