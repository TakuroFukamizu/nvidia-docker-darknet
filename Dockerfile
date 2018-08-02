FROM nvidia/cuda:8.0-runtime-ubuntu16.04 AS build-env

LABEL maintainer "Takuro Fukamizu <takuro.f.1987@gmail.com>"

# install dependencies
RUN set -ex; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
    build-essential \
    curl \
    make \
    gcc \
    git \
    perl \
    wget \
    ; \
    rm -rf /var/lib/apt/lists/*

# Build darknet with GPU
WORKDIR /
RUN set -x; \
    git clone https://github.com/pjreddie/darknet.git; \
    git checkout ${DNT_COMMIT} $; \
    sed -e s/GPU=0/GPU=1/ darknet/Makefile; \
    (cd darknet && make && rm -rf scripts src results obj .git)

# basic assets
RUN set -x; \
    cd darknet; \
    wget https://pjreddie.com/media/files/yolov3.weights; \
    wget https://pjreddie.com/media/files/yolov3-tiny.weights; \
    wget https://pjreddie.com/media/files/darknet53.conv.74

# ----------------------------------

FROM nvidia/cuda:8.0-runtime-ubuntu16.04 AS exec-env
COPY --from=build-env /darknet /opt/darknet

## Test run
WORKDIR /opt/darknet
# CMD ["./darknet", "detect", "cfg/yolov3.cfg", "yolov3.weights", "data/dog.jpg"]

