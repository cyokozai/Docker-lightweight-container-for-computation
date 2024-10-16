###################### BUILDER ######################
FROM python:3.9 as builder

ARG dir="results"

WORKDIR /root

COPY ./requirements.txt /root/

ENV DEBIAN_FRONTEND=noninteractive

RUN python -m pip install --upgrade pip &&\
    pip install --upgrade pip &&\
    pip install -r requirements.txt &&\
    rm requirements.txt &&\
    mkdir ${dir} &&\
    cd /etc &&\
    echo "backend : Agg" >> matplotlibrc

###################### PRODUCTION ######################
FROM python:3.9-slim-buster

ARG lang="C"

USER root

WORKDIR /root

COPY --from=builder /usr/local/lib/python3.9/site-packages /usr/local/lib/python3.9/site-packages/
COPY ./src/*.py /root/

ENV LANG ${lang}
ENV LANGUAGE ${lang}
ENV LC_ALL ${lang}
ENV TZ=Asia/Tokyo
ENV TZ JST-9

CMD ["python", "main.py"]
