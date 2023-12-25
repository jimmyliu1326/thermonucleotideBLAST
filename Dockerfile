FROM debian:trixie-slim

# install dependencies
RUN apt-get update && \
    apt-get install -y \
    libmpich-dev \
    libopenmpi-dev \
    libz-dev \
    git \
    build-essential

# Clone the forked thermonucleotideBLAST respository and compile
RUN git clone https://github.com/jimmyliu1326/thermonucleotideBLAST.git && \
    cd thermonucleotideBLAST && \
    make all

# add tntblast to PATH
RUN ln -s /thermonucleotideBLAST/tntblast /usr/bin/tntblast