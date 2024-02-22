###################### BUILDER ######################
FROM ubuntu:latest AS builder

WORKDIR /root

COPY *.jl /root/

# Install necessary packages
RUN apt-get update && apt-get upgrade &&\
    apt-get install -y wget &&\
    wget https://julialang-s3.julialang.org/bin/linux/x64/1.7/julia-1.7.0-linux-x86_64.tar.gz &&\
    tar zxvf julia-1.7.0-linux-x86_64.tar.gz -C /usr --strip-components 1 &&\
    rm julia-1.7.0-linux-x86_64.tar.gz &&\
    julia -e 'using Pkg; Pkg.update()'
    CMD ["julia", "pkginstall.jl"]

###################### PRODUCTION ######################
FROM julia:alpine:latest

WORKDIR /root

COPY --from=builder /usr/local/julia/packages /usr/local/julia/packages
COPY --from=builder /root /root/
CMD ["julia", "main.jl"]