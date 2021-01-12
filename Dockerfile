FROM fedora:latest

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
    wine.i686

##
# Install sampctl
##
RUN \
    curl https://raw.githubusercontent.com/Southclaws/sampctl/master/install-rpm.sh | sh

##
# Add custom runtimes.json
##
RUN \
    rm -rf /root/.samp/runtimes.json && \
    curl https://raw.githubusercontent.com/sampctl/runtimes/master/runtimes.json >> /root/.samp/runtimes.json

##
# We done!
##
CMD ["/bin/bash"]