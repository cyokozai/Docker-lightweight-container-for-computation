ARG lang="C"
ARG dir="results"

###################### BUILDER ######################
FROM python:3.9 as builder

WORKDIR /root

COPY requirements.txt /root/

ENV DEBIAN_FRONTEND = noninter active

RUN python -m pip install --upgrade pip &&\
    pip install --upgrade pip &&\
    pip install -r requirements.txt &&\
    mkdir ${dir} &&\
    cd /etc &&\
    echo "backend : Agg" >> matplotlibrc

###################### PRODUCTION ######################
FROM python:3.9-slim-buster

USER root

WORKDIR /root

COPY --from=builder /usr/local/lib/python3.9/site-packages /usr/local/lib/python3.9/site-packages/
COPY *.py /root/

ENV LANG ${lang}
ENV LANGUAGE ${lang}
ENV LC_ALL ${lang}
ENV TZ=Asia/Tokyo
ENV TZ JST-9

CMD ["python", "main.py"]