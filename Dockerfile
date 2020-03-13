FROM python:3

WORKDIR /usr/src/app/

COPY ./pip-requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r pip-requirements.txt

COPY . /usr/src/app/

ENTRYPOINT [ "python", "./chromecastplay.py" ]
