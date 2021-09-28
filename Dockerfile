
FROM accetto/ubuntu-vnc-xfce-firefox-g3:vnc-novnc
RUN whoami
RUN id


ENV VNC_PORT=5901 \
    NO_VNC_PORT=6901 \
    INST_SCRIPTS=/headless/install




ADD ./add_stuff/ $INST_SCRIPTS/
ADD ./bin_new/ /usr/bin/
#USER root
#RUN chmod a+x /usr/bin/geckodriver
#RUN cp /usr/bin/geckodriver /usr/bin/geckodriver13

#RUN find $INST_SCRIPTS -name '*.sh' -exec chmod a+x {} +
#RUN find  /usr/bin -name '*geckodrive' -exec chmod a+x {} +
#ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'
#USER headless
### Install some common tools
RUN $INST_SCRIPTS/install_tools.sh

#EXPOSE ${VNC_PORT}
USER 0


ENTRYPOINT [ "/usr/bin/tini", "--", "/dockerstartup/startup.sh" ]
