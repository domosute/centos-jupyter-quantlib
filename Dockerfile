FROM centos

RUN yum update && \
# Installing necessary packages for compilation
yum groupinstall -y core base "Development Tools" && \
yum install -y git boost-devel python-devel pcre-devel perl-devel && \
# Downloading source files (Anaconda3, Quantlib, SWIG, Quantlib-SWIG)
cd /opt && \
wget https://repo.continuum.io/archive/Anaconda3-5.1.0-Linux-x86_64.sh && \
git clone https://github.com/lballabio/QuantLib.git /opt/QuantLib/ && \
git clone https://github.com/swig/swig.git /opt/SWIG/ && \
git clone https://github.com/lballabio/QuantLib-SWIG.git /opt/QuantLib-SWIG/ && \
# Begin Installation
# 1). Install Anaconda3
chmod +x /opt/Anaconda3-5.1.0-Linux-x86_64.sh &&\
/opt/Anaconda3-5.1.0-Linux-x86_64.sh -b -p /opt/conda && \
/opt/conda/bin/conda update -y --prefix /opt/conda conda && \
/opt/conda/bin/conda install -y jupyter numpy pandas && \
# 2). Install QuantLib
cd /opt/QuantLib && \
./autogen.sh && \
./configure && \
make install && \
ldconfig && \
# 3). Install SWIG
cd /opt/SWIG/ && \
./autogen.sh && \
./configure && \
make && \
make install && \
# 4). Install QuantLib-SWIG
cd /opt/QuantLib-SWIG && \
./autogen.sh && \
./configure && \
make -C Python install && \
cd /opt/QuantLib-SWIG/Python && \
/opt/conda/bin/python3.6 setup.py install && \
# Setup for Jupyter Notebook
echo "export PATH=/opt/conda/bin:$PATH" > /etc/profile.d/conda.sh && \
groupadd -g 1000 jupyter && \
useradd -g jupyter -G wheel -m -s /bin/bash jupyter && \
echo "jupyter:jupyter" | chpasswd && \
echo "jupyter ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/jupyter && \
chmod 0440 /etc/sudoers.d/jupyter && \
# Below file enable password access instead of token
echo "c.NotebookApp.token = 'jupyter'" > /home/jupyter/jupyter_notebook_config.py && \
# Remove files to reduce image size
rm -f /opt/Anaconda3-5.1.0-Linux-x86_64.sh && \

EXPOSE 8888
USER jupyter
WORKDIR /home/jupyter

CMD ["/bin/bash", "-c", "/opt/conda/bin/jupyter-notebook --ip=*"]
