FROM frekele/java:jdk8

MAINTAINER frekele <leandro.freitas@softdevelop.com.br>

ENV NEXUS_VERSION=3.0.0-03
ENV NEXUS_DATA=/nexus-data

ENV JAVA_MAX_MEM=1024m
ENV JAVA_MIN_MEM=256m
ENV EXTRA_JAVA_OPTS=""

# Change to tmp folder
WORKDIR /tmp

# Download and extract apache ant to opt folder
RUN mkdir -p /opt/sonatype/nexus \
    && wget --no-check-certificate --no-cookies http://download.sonatype.com/nexus/3/nexus-${NEXUS_VERSION}-unix.tar.gz \
    && wget --no-check-certificate --no-cookies http://download.sonatype.com/nexus/3/nexus-${NEXUS_VERSION}-unix.tar.gz.md5 \
    && echo "$(cat nexus-${NEXUS_VERSION}-unix.tar.gz.md5) nexus-${NEXUS_VERSION}-unix.tar.gz" | md5sum -c \
    && tar -zvxf nexus-${NEXUS_VERSION}-unix.tar.gz --strip-components=1 -C /opt/sonatype/nexus \
    && rm -f nexus-${NEXUS_VERSION}-unix.tar.gz \
    && rm -f nexus-${NEXUS_VERSION}-unix.tar.gz.md5 \
    && chown -R root:root /opt/sonatype/nexus

## Configure Nexus Runtime ENV
RUN sed \
    -e "s|karaf.home=.|karaf.home=/opt/sonatype/nexus|g" \
    -e "s|karaf.base=.|karaf.base=/opt/sonatype/nexus|g" \
    -e "s|karaf.etc=etc|karaf.etc=/opt/sonatype/nexus/etc|g" \
    -e "s|java.util.logging.config.file=etc|java.util.logging.config.file=/opt/sonatype/nexus/etc|g" \
    -e "s|karaf.data=data|karaf.data=${NEXUS_DATA}|g" \
    -e "s|java.io.tmpdir=data/tmp|java.io.tmpdir=${NEXUS_DATA}/tmp|g" \
    -i /opt/sonatype/nexus/bin/nexus.vmoptions

# Create nexus user with PID 200
RUN useradd -r -u 200 -m -c "nexus role account" -d ${NEXUS_DATA} -s /bin/false nexus

# Add Volume
VOLUME ${NEXUS_DATA}

# Open Port
EXPOSE 8081

# Add the files
ADD rootfs /

# Change to root folder
WORKDIR /root
