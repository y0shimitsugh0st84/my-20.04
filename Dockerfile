
FROM accetto/ubuntu-vnc-xfce-g3


ENTRYPOINT [ "/usr/bin/tini", "--", "/dockerstartup/startup.sh" ]
