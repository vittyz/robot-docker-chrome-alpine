FROM python:2.7.14-alpine3.7

ENV http_proxy http://10.1.1.10:8080
ENV https_proxy http://10.1.1.10:8080
RUN env
RUN set | grep proxy
RUN apk update
RUN apk add --no-cache \
   udev \
   chromium \
   chromium-chromedriver \
   xvfb \
   ttf-freefont \
   libexif 

#RUN apk add font-xfree86-type1

RUN pip install --no-cache-dir \
 robotframework==3.0.2 \
 robotframework-selenium2library==3.0.0 \
 selenium==3.3.1 \
 robotframework-seleniumlibrary \
 robotframework-httplibrary \
 requests \
 robotframework-requests \
 pyyaml \
 robotframework-jsonvalidator


# Chrome requires docker to have cap_add: SYS_ADMIN if sandbox is on.
# Disabling sandbox and gpu as default.
RUN sed -i "s/self._arguments\ =\ \[\]/self._arguments\ =\ \['--no-sandbox',\ '--disable-gpu'\]/" /usr/local/lib/python2.7/site-packages/selenium/webdriver/chrome/options.py

#RUN unset http_proxy
#RUN unset https_proxy

COPY entry_point.sh /opt/bin/entry_point.sh
RUN chmod +x /opt/bin/entry_point.sh

ENV SCREEN_WIDTH 1366
ENV SCREEN_HEIGHT 768
ENV SCREEN_DEPTH 16

WORKDIR /out
ENTRYPOINT [ "/opt/bin/entry_point.sh" ]


