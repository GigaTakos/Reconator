FROM ubuntu:22.04

WORKDIR /opt
RUN apt-get update
RUN apt-get install wget -y
RUN wget https://go.dev/dl/go1.20.1.linux-amd64.tar.gz
RUN rm -rf /usr/local/go && tar -C /usr/local -xzf go1.20.1.linux-amd64.tar.gz
RUN apt-get install jq -y
ENV PATH=$PATH:/usr/local/go/bin
RUN go install github.com/projectdiscovery/httpx/cmd/httpx@latest
RUN go install github.com/projectdiscovery/mapcidr/cmd/mapcidr@latest
COPY reconator.sh /opt/
RUN chmod 644 /opt/reconator.sh
