FROM jhulibraries/jenkins-ssh-agent-base:20190925-48

USER root
RUN yum install -y gcc gcc-c++ zlib zlib-devel libffi-devel bzip2-devel readline-devel openssl-devel make sqlite-devel

USER jenkins
RUN rm -rf /home/jenkins/.pyenv && \
    git clone https://github.com/pyenv/pyenv.git /home/jenkins/.pyenv && \
    echo 'export PYENV_ROOT="/home/jenkins/.pyenv"' >> ~/.bashrc && \
    echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc && \
    echo 'eval "$(pyenv init -)"' >> ~/.bashrc && \
    export PYENV_ROOT="/home/jenkins/.pyenv" && \
    export PATH="/home/jenkins/.pyenv/bin:$PATH" && \
    /home/jenkins/.pyenv/bin/pyenv install 3.6.9 && \
    /home/jenkins/.pyenv/bin/pyenv install 3.7.4

USER root
