# reference-project-documentation-generator
Use Pandoc, LaTeX, and LibreOffice to automatically generate pixel perfect project documentation

## Prerequisites

This project uses standard python libraries and any base Domino image should work well. The last test was done on standard-environment:quay.io/domino/standard-environment:ubuntu18-py3.8-r4.1-domino4.6

Dockerfile instructions used are below:

```
RUN echo "ubuntu    ALL=NOPASSWD: ALL" >> /etc/sudoers

RUN sudo add-apt-repository -y ppa:libreoffice/ppa

RUN sudo apt-get update

RUN sudo apt-get install -y libreoffice

RUN echo 'libssl1.1 libraries/restart-without-asking boolean true' | sudo debconf-set-selections

RUN sudo apt-get install -y texlive-latex-extra
```


