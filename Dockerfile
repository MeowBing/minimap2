FROM cuhkhaosun/base

RUN apt-get update \
    && apt-get install -y git \
    && git clone https://github.com/lh3/minimap2 \
    && cd minimap2 \
    && make

WORKDIR /app

CMD ["bash"]


