FROM meandmymonkey/satis

MAINTAINER Andreas Hucks "andreas@inputrequired.org"

ADD ./satis.json /etc/satis.json
ADD ./token /root/token

RUN \
    composer config --global github-oauth.github.com $(cat /root/token) && \
    satis-build && \
    composer config --global github-oauth.github.com none && \
    rm /root/token

CMD ["/usr/bin/supervisord"]