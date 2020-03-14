FROM python:3

RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive \
    apt-get install -y ffmpeg \
  && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app/

COPY ./pip-requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r pip-requirements.txt

COPY . /usr/src/app/

ENTRYPOINT [ "python", "./chromecastplay.py" ]
