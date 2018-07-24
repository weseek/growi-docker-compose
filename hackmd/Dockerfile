FROM hackmdio/hackmd:1.2.0-alpine

# copy script to apply GROWI agent
COPY apply-growi-agent.sh /hackmd/apply-growi-agent.sh
RUN chmod +x /hackmd/apply-growi-agent.sh
# run the script
RUN /hackmd/apply-growi-agent.sh

# overwrite HackMD config file
RUN rm -f /files/config.json && rm -f /hackmd/config.json
COPY config.json /files/
RUN ln -s /files/config.json /hackmd/config.json

# create sqlite data dir
RUN mkdir /files/sqlite && chown hackmd /files/sqlite
RUN ln -s /files/sqlite /hackmd/sqlite
