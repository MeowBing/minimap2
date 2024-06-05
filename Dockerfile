FROM cuhkhaosun/base

WORKDIR /app

RUN apt-get update \
    && apt-get install -y git \
    && git clone https://github.com/lh3/minimap2 \
    && cd minimap2 \
    && make

ENV PATH="/app/minimap2:${PATH}"

WORKDIR /app/minimap2

COPY runminimap2.sh /app/minimap2

CMD ["bash"]


