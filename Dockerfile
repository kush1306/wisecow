
FROM ubuntu:24.04

RUN apt-get update && apt-get install -y \
    fortune-mod \
    cowsay \
    netcat-openbsd

WORKDIR /app

ENV PATH="/usr/games:${PATH}"

COPY wisecow.sh .

RUN chmod +x wisecow.sh

EXPOSE 4499

CMD ["./wisecow.sh"]

