FROM debian:unstable

RUN apt-get update && apt-get install -y docker.io 

# Install patched version of autopkgtest.
# https://salsa.debian.org/ci-team/autopkgtest/merge_requests/3
COPY autopkgtest_5.3_all.deb autopkgtest_5.3_all.deb
RUN dpkg -i autopkgtest_5.3_all.deb || apt-get -f install -y

# Support for docker:dind
ENV DOCKER_HOST=tcp://docker:2375
