FROM ubuntu:latest

# Locales
RUN apt-get update && apt-get install -y locales
RUN locale-gen en_US.UTF-8
ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

# Common packages
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
	build-essential \
	software-properties-common \
	vim \
	tzdata \
	curl \
	git \
	wget \
	tmux \
	zsh

# Install oh-my-zsh
RUN chsh -s /usr/bin/zsh
RUN curl -L http://install.ohmyz.sh | sh || true

# Set up timezone
ENV TZ 'America/Chicago'
RUN echo $TZ > /etc/timezone && \
    rm /etc/localtime && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
dpkg-reconfigure -f noninteractive tzdata

# Set up dotfiles
COPY ./git/* /root/
COPY ./zsh/* /root/
COPY ./vim/ /root/
COPY ./aliases/* /root/
COPY ./bash/* /root/
COPY ./tmux/* /root/

# Set up volumes
WORKDIR /root/projects
VOLUME /root/projects
VOLUME /root/.ssh

# Set up FZF
RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
RUN ~/.fzf/install

# Install miniconda
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-4.5.11-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh && \
    /opt/conda/bin/conda clean -tipsy && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo "\n# Miniconda" >> ~/.bashrc && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc && \
    echo "\n# Miniconda" >> ~/.zshrc && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.zshrc && \
    echo "conda activate base" >> ~/.zshrc
ENV PATH=/opt/conda/bin:${PATH}

# Install python packages
RUN conda update -y conda
RUN conda install -y \ 
    boto3

# Enable colors
ENV TERM=xterm-256color

CMD ["tmux"]
