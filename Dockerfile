FROM node:0.12

ENV MMS_RELEASE 1.9.4

RUN curl -L -O http://packages.litixsoft.de/mms/${MMS_RELEASE}/mms-v${MMS_RELEASE}-community-linux.tar.gz \
    && tar -xzf mms-v${MMS_RELEASE}-community-linux.tar.gz \
    && mkdir mms \
    && tar -xzf mms-v${MMS_RELEASE}-community-linux-x86_64.tar.gz -C mms --strip-components=1 \
    && rm -f mms-v${MMS_RELEASE}-community-linux*.gz \
    && mv mms/lx-mms /opt/ \
    && rm -rf mms \
    && ln -s /opt/lx-mms/start /usr/local/bin/lx-mms \
    && sed -i 's/127.0.0.1/0.0.0.0/' /opt/lx-mms/config.js \
    && cd /opt/lx-mms \
    && npm install   

WORKDIR /opt/lx-mms/

EXPOSE 3333

CMD ["/usr/local/bin/lx-mms"]