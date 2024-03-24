FROM cuhkhaosun/base
RUN apt-get update \
    && curl -L https://github.com/lh3/minimap2/releases/download/v2.27/minimap2-2.27_x64-linux.tar.bz2 \
    && tar -jxvf minimap2-2.27_x64-linux.tar.bz2 -C / \
    && cd /minimap2-2.27_x64-linux/minimap2 \
    && make
WORKDIR /app
CMD ["bash"]
