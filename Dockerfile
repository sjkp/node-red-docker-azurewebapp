#FROM nodered/node-red-docker
#COPY settings.js /usr/src/node-red/node_modules/node-red/
#RUN ln -s /home /data
#ENV PORT=80
#EXPOSE 80
FROM node:6

# Home directory for Node-RED application source code.
RUN mkdir -p /usr/src/node-red

# User data directory, contains flows, config and nodes.
RUN mkdir -p /home/data

WORKDIR /usr/src/node-red

# Add node-red user so we aren't running as root.
RUN useradd --home-dir /usr/src/node-red --no-create-home node-red \
  ##  && chown -R node-red:node-red /home/data \
    && chown -R node-red:node-red /usr/src/node-red

USER node-red

# package.json contains Node-RED NPM module and node dependencies
COPY package.json /usr/src/node-red/
RUN npm install

# User configuration directory volume
EXPOSE 1880

# Environment variable holding file path for flows configuration
ENV FLOWS=flows.json
ENV NODE_PATH=/usr/src/node-red/node_modules:/home/data/node_modules

CMD ["npm", "start", "--", "--userDir", "/home/data"]