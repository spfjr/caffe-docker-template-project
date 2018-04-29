docker run -it --name $1 -p 8888:8888 -v $(pwd):/workspace -d caffe:cpu
