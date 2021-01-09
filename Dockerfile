FROM 	ubuntu:focal

ENV TEST_DATA=/data
ENV PYTHONPATH=$PYTHONPATH:/opt

#Add test data
ADD bookRecommendations.txt /data
#RUN chmod -R 777 /data

ADD requirements.txt /
ADD pip-20.2.2-py2.py3-none-any.whl /wheels

RUN apt-get update && apt-get -yq install --no-install-recommends \
    wget python3 python3-setuptools

#install git
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git
    
# install python dependencies
RUN	/bin/sh -c "python3 /wheels/pip-20.2.2-py2.py3-none-any.whl/pip install -r /requirements.txt" \
    && rm -rf /pip-20.2.2-py2.py3-none-any.whl /requirements.txt

EXPOSE 5000
CMD ["/usr/bin/env", "bash"]