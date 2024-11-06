

apt install -y build-essential cmake pkg-config unzip yasm git checkinstall python3 python3-dev python3-numpy


# git opencv opencv-contrib

cd /root

mkdir opencv && cd opencv

git clone https://github.com/opencv/opencv.git

git clone https://github.com/opencv/opencv_contrib.git

cd opencv

git checkout 4.9.0

cd ..

cd opencv_contrib

git checkout 4.9.0

cd ..

mkdir build && cd build

cmake \
-D CMAKE_INSTALL_PREFIX=/root/miniconda3 \
-D WITH_CUDA=ON \
-D WITH_CUDNN=ON \
-D OPENCV_DNN_CUDA=0N \
-D BUILD_opencv_dnn=ON \
-D CUDA_ARCH_BIN=8.6 \
-D CMAKE_C_COMPILER=gcc-12 \
-D CMAKE_CXX_COMPILER=g++-12 \
-D OPENCV_EXTRA_MODULES_PATH=/root/opencv/opencv_contrib/modules/ \
-D PYTHON3_EXECUTABLE=/root/miniconda3/bin/python3.11 \
-D PYTHON_LIBRARIES=/root/miniconda3/lib/libpython3.11.so \
-S /root/opencv/opencv .

make -j 10

make install


<<comments

--     Link libraries:              Dynamic load
--
--   Python 3:
--     Interpreter:                 /usr/bin/python3 (ver 3.10.12)
--     Libraries:                   /usr/lib/x86_64-linux-gnu/libpython3.10.so (ver 3.10.12)
--     Limited API:                 NO
--     numpy:                       /usr/lib/python3/dist-packages/numpy/core/include (ver 1.21.5)
--     install path:                lib/python3.10/dist-packages/cv2/python-3.10

comments

