FROM fedora:latest

ENV SAMPCTL_VERSION="1.9.1"
ENV PORT=7777

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
    curl \
    wget \
    psmisc \
    tar \
    git \
    glibc.i686 \
    libstdc++.i686

##
# Install sampctl
##
RUN \
    curl https://raw.githubusercontent.com/Southclaws/sampctl/master/install-rpm.sh | sh

##
# Set workdir
##
WORKDIR /app

##
# Expose port
##
EXPOSE ${PORT}/udp

##
# We done!
##
CMD ["/bin/bash"]
