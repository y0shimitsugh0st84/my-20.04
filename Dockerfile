
FROM accetto/ubuntu-vnc-xfce-firefox-g3:vnc-novnc


ENTRYPOINT [ "/usr/bin/tini", "--", "/dockerstartup/startup.sh" ]
