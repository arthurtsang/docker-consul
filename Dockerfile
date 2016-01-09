FROM progrium/busybox
MAINTAINER Arthur Tsang <amaryllis.arthur@gmail.com>

ADD https://releases.hashicorp.com/consul/0.6.1/consul_0.6.1_linux_amd64.zip /tmp/consul.zip
RUN cd /bin && unzip /tmp/consul.zip && chmod +x /bin/consul && rm /tmp/consul.zip

ADD https://releases.hashicorp.com/consul/0.6.1/consul_0.6.1_web_ui.zip /tmp/webui.zip
RUN mkdir /ui && cd /ui && unzip /tmp/webui.zip && rm /tmp/webui.zip

ADD consul.json /opt/config/consul.json

EXPOSE 8300 8301 8301/udp 8302 8302/udp 8400 8500 53/udp

ENTRYPOINT ["/bin/consul"]
CMD []
