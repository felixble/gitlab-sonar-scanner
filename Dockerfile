FROM alpine
## Based on this example http://stackoverflow.com/a/40612088/865222
ENV SONAR_SCANNER_VERSION cli-3.0.3.778-linux

RUN apk add --no-cache wget && \
    wget https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/sonar-scanner-${SONAR_SCANNER_VERSION}.zip && \
    unzip sonar-scanner-${SONAR_SCANNER_VERSION}.zip && \
    rm sonar-scanner-${SONAR_SCANNER_VERSION}.zip && \
    cd /usr/bin && ln -s /sonar-scanner-${SONAR_SCANNER_VERSION}/bin/sonar-scanner sonar-scanner && \
    apk del wget

COPY sonar-scanner-run.sh /usr/bin/
