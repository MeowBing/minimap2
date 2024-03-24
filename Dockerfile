FROM cuhkhaosun/base

RUN apt-get update \
    && curl -L https://github.com/lh3/minimap2/releases/download/v2.27/minimap2-2.27_x64-linux.tar.bz2 -o minimap2.tar.bz2 \
    && tar -jxvf minimap2.tar.bz2 -C / \
    && cd /minimap2-2.27_x64-linux \
    && make

WORKDIR /app

CMD ["bash"]

