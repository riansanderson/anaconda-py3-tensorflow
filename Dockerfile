FROM purposefly/anaconda

# necessary base library updates to get tensorflow and matplotlib to run on Debian:Jessie
RUN echo "deb http://ftp.us.debian.org/debian unstable main contrib non-free" >> /etc/apt/sources.list.d/unstable.list \
  && apt-get update && apt install -y -t unstable libstdc++6 libquadmath0 \
  && apt install -y libgl1-mesa-swx11 \
  && rm -rf /var/lib/apt 

# running CPU version of Tensorflow for simplicity
RUN pip install --no-cache-dir --ignore-installed --upgrade https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-1.8.0-cp36-cp36m-linux_x86_64.whl

# project specific python libraries that aren't in anaconda
RUN pip install --no-cache-dir absl-py pyquaternion pydub sortedcontainers 