FROM ubi8-minimal
ARG VERSION

RUN \
    microdnf install -y nspr nss expat fontconfig uuid \
    && microdnf clean all
COPY \
    out/$VERSION/headless-shell/headless-shell \
    out/$VERSION/headless-shell/.stamp \
    out/$VERSION/headless-shell/*.so \
    /headless-shell/
EXPOSE 9222
ENV PATH /headless-shell:$PATH
ENTRYPOINT [ "/headless-shell/headless-shell", "--no-sandbox", "--remote-debugging-address=0.0.0.0", "--remote-debugging-port=9222" ]

# Installing: nspr-4.32.0-1.el8_4;x86_64;ubi-8-appstream
# Installing: nss;3.67.0-7.el8_5;x86_64;ubi-8-appstream
# Installing: expat;2.2.5-8.el8;x86_64;ubi-8-baseos
# Installing: fontconfig;2.13.1-4.el8;x86_64;ubi-8-baseos
# Installing: uuid;1.6.2-43.el8;x86_64;ubi-8-appstream
