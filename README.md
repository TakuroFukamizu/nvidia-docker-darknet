# nvidia-docker-darknet

Darknet container image for [Nvidia-docker](https://github.com/NVIDIA/nvidia-docker)

## Run on your docker

```sh
$ docker run --runtime=nvidia -it --rm fkmy/nvidia-docker-darknet:latest

# do something in interactive mode
root@3a19413c64cd:/opt/darknet# ls
LICENSE       LICENSE.gen  LICENSE.meta  LICENSE.v1  README.md  cfg      darknet53.conv.74  examples  libdarknet.a   python               yolov3.weights
LICENSE.fuck  LICENSE.gpl  LICENSE.mit   Makefile    backup     darknet  data               include   libdarknet.so  yolov3-tiny.weights
```

## Rebuilding the containers

```sh
$ export DNT_COMMIT="COMMIT HASH OF SOURCE VERSION" &&  docker build -t fkmy/nvidia-docker-darknet:latest .
```

|      tag       |                                                                source version                                                                 |
| -------------- | --------------------------------------------------------------------------------------------------------------------------------------------- |
| 201805, latest | [f6d861736038da22c9eb0739dca84003c5a5e275 (May 7, 2018)](https://github.com/pjreddie/darknet/commit/f6d861736038da22c9eb0739dca84003c5a5e275) |

