FROM fedora:latest

ENV SAMPCTL_VERSION="1.9.1"

##
# Update system
##
RUN \
    yum update -y && \
    yum upgrade -y

##
# Install packages
##
RUN \
    yum install -y \
    wget \
    git \
    psmisc \
    glibc.i686 \
    libstdc++.i686 \
    wine.i686 \
	tar

##
# Install sampctl
##
RUN \
    curl https://raw.githubusercontent.com/Southclaws/sampctl/master/install-rpm.sh | sh

##
# Add custom runtimes.json
##
#RUN \
    #rm -rf /root/.samp/runtimes.json && \
    #curl https://raw.githubusercontent.com/sampctl/runtimes/master/runtimes.json >> /root/.samp/runtimes.json

##
# Add custom runtimes.json
##
RUN \
    rm -rf /root/.samp/runtimes.json

COPY docker/runtimes.json /root/.samp/

##
# Set workdir
##
WORKDIR . /app

##
# Download windows sampctl
##
RUN \
    wget https://github.com/Southclaws/sampctl/releases/download/${SAMPCTL_VERSION}/sampctl_${SAMPCTL_VERSION}_windows_amd64.tar.gz && \
	tar -zxvf sampctl_${SAMPCTL_VERSION}_windows_amd64.tar.gz

##
# We done!
##
CMD ["/bin/bash"]
