FROM ubuntu:cosmic

ENV DEBIAN_FRONTEND noninteractive

# Install git, Python, node.js
# Install CMake (optional, only needed for tests and building Binaryen)
# Install Java (optional, only needed for Closure Compiler minification)
RUN apt-get update && \
    apt-get install -y git-core python nodejs cmake default-jre

# Install nano (for me)
RUN apt-get install -y nano

# Get the emsdk repo
RUN git clone https://github.com/emscripten-core/emsdk.git ~/emsdk
RUN ~/emsdk/emsdk install latest
RUN ~/emsdk/emsdk activate latest
RUN mkdir ~/code

# Copy startup script
COPY ./startup.sh /root/startup.sh

ENTRYPOINT ["/root/startup.sh"]



