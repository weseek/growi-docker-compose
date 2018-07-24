FROM hackmdio/hackmd:1.2.0-alpine

# copy script for applying GROWI agent and invoke
COPY apply-growi-agent.sh /hackmd/apply-growi-agent.sh
RUN chmod +x /hackmd/apply-growi-agent.sh
RUN /hackmd/apply-growi-agent.sh

# overwrite config.json
RUN rm -f /files/config.json && rm -f /hackmd/config.json
COPY config.json /files/
RUN ln -s /files/config.json /hackmd/config.json
