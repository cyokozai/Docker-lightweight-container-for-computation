###################### BUILDER ######################
FROM julia:latest AS builder

WORKDIR /root

COPY *.jl /root/

RUN julia -e 'using Pkg; Pkg.update()' &&\
    mkdir results

CMD ["julia", "pkginstall.jl"]

###################### PRODUCTION ######################
FROM julia:latest

WORKDIR /root

COPY --from=builder /usr/local/julia/ /usr/local/julia/
COPY --from=builder /root /root/

CMD ["julia", "main.jl"]