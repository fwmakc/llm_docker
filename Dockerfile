FROM python:3.12
# FROM conda/miniconda3

WORKDIR /app

# установка зависимостей
RUN apt update \
    && apt install -y --no-install-recommends \
        bash \
        build-essential \
        cmake \
        curl \
        gcc gcc-multilib g++ \
        git \
        libglib2.0-0 \
        software-properties-common \
        wget

RUN rm -rf /var/lib/apt/lists/*

# ставим конду
# ENV CONDA_DIR /opt/conda
# RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh \
#     && /bin/bash ~/miniconda.sh -b -p /opt/conda
# ENV PATH=$CONDA_DIR/bin:$PATH

# драйвера для nvidia или для amd нужно ставить снаружи, а контейнер увидит их за счет настроек с пробросом gpu

# RUN conda create -n ai python=3.12 -y && conda activate ai

# RUN python3 -m pip install --upgrade pip
RUN python -m pip install --upgrade pip

RUN pip install \
    aiohttp aiohttp_cors \
    flask \
    gunicorn \
    matplotlib \
    numpy \
    # opencv-python opencv-python-headless \
    pandas \
    # selenium webdriver-manager \
    serverhub_agent \
    ultralytics

# RUN pip install tensorflow==2.19.0
# RUN pip install tensorflow
# RUN pip install torch torchvision torchaudio -f https://download.pytorch.org/whl/cu111/torch_stable.html
# RUN pip install vllm
# RUN pip install hugingface_hub

# conda create -n ai python=3.12 -y && conda activate ai
# pip install torch torchvision torchaudio -f https://download.pytorch.org/whl/cu121/torch_stable.html
# pip install vllm>=0.8.4 hugingface_hub
