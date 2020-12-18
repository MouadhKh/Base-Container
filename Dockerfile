FROM 	ubuntu:focal

ENV TEST_DATA=/data
ENV PYTHONPATH=$PYTHONPATH:/opt

#Add test data
ADD bookRecommendations.txt /data
#RUN chmod -R 777 /data

ADD requirements.txt /
EXPOSE 5000
CMD ["/usr/bin/env", "bash"]