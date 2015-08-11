FROM progrium/busybox
MAINTAINER Arthur Tsang <amaryllis.arthur@gmail.com>

ADD https://dl.bintray.com/mitchellh/consul/0.5.2_linux_amd64.zip /tmp/consul.zip
#ADD ./0.5.2_linux_amd64.zip /tmp/consul.zip
RUN cd /bin && unzip /tmp/consul.zip && chmod +x /bin/consul && rm /tmp/consul.zip

ADD https://dl.bintray.com/mitchellh/consul/0.5.2_web_ui.zip /tmp/webui.zip
#ADD 0.5.2_web_ui.zip /tmp/webui.zip 
RUN cd /tmp && unzip /tmp/webui.zip && mv dist /ui && rm /tmp/webui.zip

ADD consul.json /opt/config/consul.json

EXPOSE 8300 8301 8301/udp 8302 8302/udp 8400 8500 53/udp

ENTRYPOINT ["/bin/consul"]
CMD []
