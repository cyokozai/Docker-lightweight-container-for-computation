###################### BUILDER ######################

FROM julia:latest AS builder

ARG dir=results

WORKDIR /root

COPY ./src/*.jl /root/

ENV DEBIAN_FRONTEND = noninter active

RUN julia -e 'using Pkg; Pkg.update()' &&\
    mkdir ${dir}

CMD ["julia", "pkginstall.jl"]

###################### PRODUCTION ######################

FROM julia:latest

ARG lang=C

WORKDIR /root

COPY --from=builder /usr/local/julia/ /usr/local/julia/
COPY --from=builder /root /root/

ENV LANG $lang
ENV LANGUAGE $lang
ENV LC_ALL $lang
ENV TZ=Asia/Tokyo
ENV TZ JST-9

CMD ["julia", "main.jl"]
