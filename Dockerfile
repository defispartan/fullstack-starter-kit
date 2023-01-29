FROM alpine:latest

ARG PB_VERSION=0.7.7

RUN apk add --no-cache \
    unzip \
    # this is needed only if you want to use scp to copy later your pb_data locally
    openssh

# download and unzip PocketBase
ADD https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip /tmp/pb.zip
RUN unzip /tmp/pb.zip -d /pb/

RUN apk add --no-cache nodejs yarn

EXPOSE 8090

WORKDIR /pb
COPY client /pb/client

WORKDIR /pb/client
RUN yarn install
# Build vite app into PocketBase webserver directory
RUN yarn build --outDir='/pb/pb_public'


# start PocketBase
CMD ["/pb/pocketbase", "serve", "--http=0.0.0.0:8090"]