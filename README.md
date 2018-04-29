# Basic GPU caffe project

## Description

Repository was created to ease the procedure of `caffe` installation.  Since I wasn't able to install `caffe` for 2 days on freshly installed ubuntu 16.04, I decided to create middleware docker with caffe installed, where I would be able to develop `caffe` and create models, and install `caffe` itself without problems.

Dockerfiles are based on `Dockerfile`s available at https://github.com/BVLC/caffe/blob/master/docker/gpu/Dockerfile. 

## Prerequisites
### General

- docker (https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-docker-ce-1)
- be sure that port 8888 is not already occupied by any service, otherwise change port in the `Dockerfile`s `start.sh`
### CPU
- working CPU :)

### GPU
- nvidia-docker available at https://github.com/NVIDIA/nvidia-docker (see **Quickstart** section)
- note: in case of problems with driver installation, the best working solution for me was  https://www.pcsuggest.com/install-nvidia-drivers-ubuntu/#1_Add_the_Ubuntu_graphics-drivers_PPA :
    - don't forget to install `nvidia-prime` with `apt-get`
    - check what is the newest available driver version for you graphics card at http://www.nvidia.pl/Download/index.aspx
- working GPU :) 

## Installation

### CPU
```
git submodule update --init --recursive # ommit if you already have caffe repository here
docker build -t caffe:cpu -f Dockerfile.cpu . 
chmod +x start-cpu.sh
./start-cpu.sh <container-name>
```

### GPU
```
git submodule update --init --recursive # ommit if you already have caffe repository here
nvidia-docker build -t caffe:gpu -f Dockerfile.gpu . 
chmod +x start-gpu.sh
./start-gpu.sh <container-name>
```

## Usage

### Running scripts
1. Run script using PyCharm with connected remote interpreter
2. Enter container using
    ```
    docker exec -it <container-name> bash
    ```
    and run `python` command on a particular script.

### Caffe development

In case of `caffe` development you can add as a submodule your own modified `caffe` repository or download using first command in the `Installation` section.

### Jupyter
You can access jupyter after run at
```
http://localhost:8888
```
**Password**: `caffe`

### PyCharm development
Feel free to create `PyCharm` project in this repo and connect using remote interpreter. Instructions are available at: https://www.jetbrains.com/help/ruby/using-docker-as-a-remote-interpreter.html

### Modifying
In case of adding new packages you can either:

1. Modify `requirements.txt`, add new line with package name, rebuild -> rerun
2. Or access docker with
    ```
    docker exec -it <container-name> bash
    ```
    and install package with `pip install <package-name>`

## License
Copyright 2018 @Kacper Kania, MIT License

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


