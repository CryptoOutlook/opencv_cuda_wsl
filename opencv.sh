

# git opencv opencv-contrib

cd /root

mkdir opencv && cd opencv

git clone https://github.com/opencv/opencv.git

git clone https://github.com/opencv/opencv_contrib.git



# ******** Dependencies

apt install -y build-essential cmake pkg-config unzip yasm git checkinstall

conda install -y numpy pandas

/root/miniconda3/bin/pip install opencv-python



# Image I/O libs

apt install -y libjpeg-dev libpng-dev libtiff-dev


# *****************************************************
# Video/Audio Libs - FFMPEG, GSTREAMER, x264 and so on.
# *****************************************************

# Install basic codec libraries
apt install -y libavcodec-dev libavformat-dev libswscale-dev

# Install GStreamer development libraries
apt install -y libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev

# Install additional codec and format libraries
apt install -y libxvidcore-dev libx264-dev libmp3lame-dev libopus-dev

# Install additional audio codec libraries
apt install -y libmp3lame-dev libvorbis-dev

# Install FFmpeg (which includes libavresample functionality)
apt install -y ffmpeg

# Optional: Install VA-API for hardware acceleration
apt install -y libva-dev


# **********************************
# Cameras programming interface libs
# **********************************

# Install video capture libraries and utilities
apt install -y libdc1394-25 libdc1394-dev libxine2-dev libv4l-dev v4l-utils

# Create a symbolic link for video device header
ln -s /usr/include/libv4l1-videodev.h /usr/include/linux/videodev.h




# ***********************************************************************************************
# GTK
# GTK is requried for GUI features, Camera support (v4l), Media Support (ffmpeg, gstreamer…), etc.
# ************************************************************************************************

apt install -y libavcodec-dev libavformat-dev libswscale-dev

apt install -y libgstreamer-plugins-base1.0-dev libgstreamer1.0-dev

apt install -y libgtk-3-dev



#
# Parallelism library C++ for CPU
#

apt-get install -y libtbb-dev


#
# Optimization libraries for OpenCV
#

apt-get install -y libatlas-base-dev gfortran



#
# Optional libraries
#

apt-get install -y libprotobuf-dev protobuf-compiler
apt-get install -y libgoogle-glog-dev libgflags-dev
apt-get install -y libgphoto2-dev libeigen3-dev libhdf5-dev doxygen




# ******** optional but add the latest support for PNG, JPEG, JPEG2000, TIFF, WebP, etc. formats


apt install -y libpng-dev libjpeg-dev libopenexr-dev libtiff-dev libwebp-dev



# ******** 

# Build

mkdir build && cd build


cmake \
-D WITH_CUDA=ON \
-D WITH_CUDNN=ON \
-D WITH_CUBLAS=1 \
-D WITH_CUFFT=ON  \
-D WITH_CUBLAS=1 \
-D WITH_NVCUVID=OFF  \
-D WITH_OPENMP=ON  \
-D WITH_TBB=ON \
-D WITH_V4L=ON \
-D WITH_QT=ON \
-D WITH_OPENGL=ON \
-D WITH_GSTREAMER=ON \
-D OPENCV_DNN_CUDA=0N \
-D CUDA_ARCH_BIN=8.6 \
-D CUDA_ARCH_PTX=8.6 \
-D CMAKE_C_COMPILER=gcc-12 \
-D CMAKE_CXX_COMPILER=g++-12 \
-D OPENCV_EXTRA_MODULES_PATH=/root/opencv/opencv_contrib/modules/ \
-D BUILD_opencv_python2=OFF \
-D BUILD_opencv_python3=ON \
-D PYTHON_DEFAULT_EXECUTABLE=/root/miniconda3/bin/python \
-D PYTHON3_EXECUTABLE=/root/miniconda3/bin/python \
-D PYTHON3_LIBRARY=/root/miniconda3/lib/libpython3.11.so.1.0 \
-D PYTHON3_LIBRARIES=/root/miniconda3/lib/python3.11/site-packages \
-D PYTHON_NUMPY_PATH==/root/miniconda3/lib/python3.11/site-packages \
-D CMAKE_INSTALL_PREFIX=/usr/local \
-S /root/opencv/opencv .



# *******************************
# Assigning no. of cores to build
# *******************************

make -j 10


# **********************************
# Building opencv into site-packages
# **********************************

make install



# remove apt setup files
apt-get clean -y
rm -rf /var/lib/apt/lists/*


<<comments

cmake \
-D CMAKE_BUILD_TYPE=RELEASE \
-D CMAKE_INSTALL_PREFIX=/usr/local \
-D CMAKE_C_COMPILER=gcc-12 \
-D CMAKE_CXX_COMPILER=g++-12 \
-D ENABLE_FAST_MATH=ON  \
-D CUDA_FAST_MATH=ON  \
-D WITH_CUBLAS=ON  \
-D WITH_CUDA=ON \
-D WITH_CUDNN=ON \
-D WITH_CUFFT=ON  \
-D WITH_CUBLAS=1 \
-D WITH_NVCUVID=OFF  \
-D WITH_OPENMP=ON  \
-D WITH_TBB=ON \
-D WITH_V4L=ON \
-D WITH_QT=ON \
-D WITH_OPENGL=ON \
-D WITH_GSTREAMER=ON \
-D CUDA_ARCH_BIN=8.6 \
-D CUDA_ARCH_PTX="" \
-D BUILD_OPENCV_CUDACODEC=ON \
-D OPENCV_DNN_CUDA=ON \
-D OPENCV_GENERATE_PKGCONFIG=ON \
-D OPENCV_PC_FILE_NAME=opencv.pc \
-D OPENCV_ENABLE_NONFREE=ON \
-D OPENCV_EXTRA_MODULES_PATH=/root/opencv/opencv_contrib/modules \
-D HAVE_opencv_python3=ON \
-D OPENCV_PYTHON3_INSTALL_PATH=/root/miniconda3/lib/python3.11/site-packages \
-D PYTHON3_EXECUTABLE=/root/miniconda3/bin/python3.11 \
-D PYTHON_LIBRARIES=/root/miniconda3/lib/python3.11/site-packages \
-D INSTALL_PYTHON_EXAMPLES=OFF \
-D INSTALL_C_EXAMPLES=OFF \
-D BUILD_EXAMPLES=OFF \
-D CUDNN_INCLUDE_DIR=/usr/include \
-S /root/opencv/opencv .


cmake -S /root/opencv/opencv . \
-D WITH_CUDA=ON \
-D BUILD_opencv_dnn=ON \
-D OPENCV_DNN_CUDA=ON \
-D BUILD_opencv_world=ON \
-D OPENCV_EXTRA_MODULES_PATH=/root/opencv/opencv_contrib/modules/ \
-D OPENCV_PYTHON3_VERSION=ON \
-D CUDA_FAST_MATH=ON \
-D ENABLE_FAST_MATH=ON \
-D WITH_NVCUVID=OFF \
-D WITH_NVCUVENC=OFF \
-D OPENCV_GENERATE_SETUPVARS=OFF \
-D CUDA_ARCH_BIN=8.6 \
-D CMAKE_BUILD_TYPE=Release \
-D CMAKE_CONFIGURATION_TYPE=Release




cmake \
-D WITH_CUDA=ON \
-D WITH_CUDNN=ON \
-D OPENCV_DNN_CUDA=0N \
-D BUILD_opencv_dnn=ON \
-D CUDA_ARCH_BIN=8.6 \
-D CMAKE_C_COMPILER=gcc-12 \
-D CMAKE_CXX_COMPILER=g++-12 \
-D OPENCV_EXTRA_MODULES_PATH=/root/opencv/opencv_contrib/modules/ \
-D PYTHON3_EXECUTABLE=$(which python3) \
-S /root/opencv/opencv .




cmake \
-D CMAKE_BUILD_TYPE=RELEASE
-D CMAKE_INSTALL_PREFIX=/usr/local \
-D CMAKE_PREFIX_PATH=/usr/lib  \
-D OPENCV_EXTRA_MODULES_PATH=../opencv_contrib/modules  \
-D WITH_CUDA=ON  \
-D CUDA_ARCH_BIN=8.6  \
-D ARCH=sm_86  \
-D gencode=arch=compute_86,code=sm_86  \
-D ENABLE_FAST_MATH=ON  \
-D CUDA_FAST_MATH=ON  \
-D WITH_CUBLAS=ON  \
-D WITH_CUFFT=ON  \
-D WITH_NVCUVID=ON  \
-D WITH_OPENMP=ON  \
-D BUILD_EXAMPLES=ON  \
-D BUILD_DOCS=OFF  \
-D BUILD_PERF_TESTS=OFF  \
-D BUILD_TESTS=OFF  \
-D WITH_TBB=ON  \
-D WITH_IPP=ON  \
-D WITH_NVCUVID=ON  \
-D WITH_CSTRIPES=ON  \
-D WITH_OPENCL=ON  \
-D WITH_FFMPEG=ON  \
-D CMAKE_PREFIX_PATH=/usr/lib  \
-D CMAKE_CXX_FLAGS="-Ofast"  \
-S /root/opencv/opencv .


comments