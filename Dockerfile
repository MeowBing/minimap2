FROM cuhkhaosun/base

WORKDIR /app

RUN apt-get update \
    && apt-get install -y git \
    && git clone https://github.com/lh3/minimap2 \
    && cd minimap2 \
    && make

ENV PATH="/app/minimap2:${PATH}"

RUN echo '#!/bin/bash' > /app/minimap2/runminimap2.sh \
    && echo 'echo "Start running minimap2"' >> /app/minimap2/runminimap2.sh \
    && echo 'minimap2 -ax map-ont /data/home/grp-sunhao/sunxinhong/reference/GRCh38.p14.genome.fa $INPUT_PATH > $OUTPUT_PATH' >> /app/minimap2/runminimap2.sh \
    && chmod +x /app/minimap2/runminimap2.sh

CMD ["bash", "/app/minimap2/runminimap2.sh"]


