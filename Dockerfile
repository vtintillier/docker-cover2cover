FROM alpine/git AS downloader

WORKDIR /repo
RUN git clone https://github.com/rix0rrr/cover2cover.git

# Python support can be specified down to the minor or micro version
# (e.g. 3.6 or 3.6.3).
# OS Support also exists for jessie & stretch (slim and full).
# See https://hub.docker.com/r/library/python/ for all supported Python
# tags from Docker Hub.
FROM python:2-alpine

COPY --from=downloader /repo/cover2cover/cover2cover.py /usr/local/bin/cover2cover

ENTRYPOINT ["cover2cover"]
