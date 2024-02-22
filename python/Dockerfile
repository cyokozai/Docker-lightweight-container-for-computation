###################### BUILDER ######################
FROM python:3.9 as builder

WORKDIR /root

COPY requirements.txt /root/

RUN python -m pip install --upgrade pip &&\
    pip install --upgrade pip &&\
    pip install -r requirements.txt &&\
    mkdir results &&\
    cd /etc &&\
    echo "backend : Agg" >> matplotlibrc

###################### PRODUCTION ######################
FROM python:3.9-slim-buster

USER root

WORKDIR /root

COPY --from=builder /usr/local/lib/python3.9/site-packages /usr/local/lib/python3.9/site-packages/
COPY *.py /root/

CMD ["python", "main.py"]