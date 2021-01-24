# ugmp-docker

usage:
```dockerfile
FROM alexdev2000/ugmp-docker:latest

##
# Add package to workdir
##
ADD . .

##
# Ensure dependencies
##
RUN \
    sampctl p ensure

##
# Build package
##
RUN \
    sampctl p build

##
# Run server...
##
ENTRYPOINT [ "sampctl", "p", "run" ]
```
