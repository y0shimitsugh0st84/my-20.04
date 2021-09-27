
FROM accetto/ubuntu-vnc-xfce-firefox-g3:vnc-novnc
USER root

ENV DISPLAY=:1 \
    VNC_PORT=5901 \
    NO_VNC_PORT=6901
EXPOSE $VNC_PORT $NO_VNC_PORT

ENV HOME=/headless \
    TERM=xterm \
    STARTUPDIR=/dockerstartup \
    INST_SCRIPTS=/headless/install \
    NO_VNC_HOME=/headless/noVNC \
    DEBIAN_FRONTEND=noninteractive \
    VNC_COL_DEPTH=24 \
    VNC_RESOLUTION=1280x1024 \
    VNC_PW=vncpassword \
    VNC_VIEW_ONLY=false
WORKDIR $HOME

ADD ./add_stuff/ $INST_SCRIPTS/
ADD ./bin_new/ /usr/bin/
RUN chmod a+x /usr/bin/geckodriver
RUN cp /usr/bin/geckodriver /usr/bin/geckodriver13

RUN find $INST_SCRIPTS -name '*.sh' -exec chmod a+x {} +
RUN find  /usr/bin -name '*geckodrive' -exec chmod a+x {} +
ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

### Install some common tools
#RUN $INST_SCRIPTS/install_tools.sh




ENTRYPOINT [ "/usr/bin/tini", "--", "/dockerstartup/startup.sh" ]
