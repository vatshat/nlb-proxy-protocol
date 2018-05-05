FROM haproxy:1.7
COPY haproxy.pem /etc/cert/haproxy.pem
COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["haproxy", "-f", "/usr/local/etc/haproxy/haproxy.cfg"]