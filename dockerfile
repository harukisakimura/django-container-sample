FROM centos

COPY ./nginx.repo /etc/yum.repos.d/nginx.repo
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./init.sh /usr/local/bin/init.sh

RUN yum -y groupinstall "development tools"
RUN yum -y install \
           wget \
           zlib-devel \
           openssl \
           openssl-devel \
           sqlite \
           sqlite-devel \
           libffi-devel \
           nginx \
&& cd /opt \
&& wget https://www.python.org/ftp/python/3.9.2/Python-3.9.2.tgz \
&& tar xzvf Python-3.9.2.tgz \
&& cd ./Python-3.9.2 \
&& ./configure --with-threads && make install && make clean \
&& rm -rf /opt/Python-3.9.2.tgz \
&& ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

COPY ./requirements.txt /opt/
RUN pip3 install --no-cache-dir -r /opt/requirements.txt

RUN mkdir /var/log/uwsgi
RUN mkdir /var/run/uwsgi

COPY ./src /opt/src

EXPOSE 8000

CMD ["/usr/local/bin/init.sh"]