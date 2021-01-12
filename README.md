# ugmp-docker

usage:
```dockerfile
FROM alexdev2000/ugmp-docker:latest

##
# Add gamemode to workdir
##
ADD . .

##
# Ensure dependencies
##
RUN \
    sampctl p ensure --platform windows

##
# Build gamemode
##
RUN \
    sampctl p build --platform windows

##
# Run server...
##
ENTRYPOINT [ "wine", "sampctl.exe", "p", "run" ]
```
