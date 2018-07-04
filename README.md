# TensorFlow with Python 3.6 Development Environment
This is a docker environment for replicating a standard machine learning dev setup of anaconda + python 3.6 + tensorflow.  The official TF docker images [are slow to update their Python version](https://github.com/tensorflow/tensorflow/issues/16875#issuecomment-365089037), and don't have all the built in stuff you expect in a full featured Anaconda development setup.

The image is a bit hefty for my taste (about 2.5GB at last count) but it gets the job done for running unit tests and doing some basic development. Note that **it doesn't utilize the GPU accelerated TF**.  It installs several specific python libraries that you may not be intersted in, but they're convenient for what I need.  The only real trick in here was getting the matching libc++ needed for the latest tensorflow and the opengl libaries needed for running matplotlib.

## Usage
Check versions by running 
```
docker run --rm -it  riansanderson/anaconda-py3-tensorflow python --version && python -c 'import tensorflow as tf; print("TensorFlow v%s"%tf.__version__)'
 ```

Play around with an interactive shell that can access your current directory 
```
docker run -it --rm -v ${PWD}:/app riansanderson/anaconda-py3-tensorflow /bin/bash
```

If you use matplotlib to generate plots to files you'll need to configure matplotlib to use a non-interactive backend. There [are several ](https://github.com/matplotlib/matplotlib/issues/8929#issuecomment-317231426) ways [to do it](https://www.scivision.co/matplotlib-default-settings-matplotlibrc-where-is-it/), I put this single line in a matplotlibrc file in the unittest directory where tests were being run out of:
```
backend : agg
```

