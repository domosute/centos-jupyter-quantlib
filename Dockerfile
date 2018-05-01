FROM centos

RUN yum update && \
# Installing necessary packages for compilation
yum groupinstall -y core base "Development Tools" && \
yum install -y git boost-devel pcre-devel perl-devel && \
# Downloading Anaconda3 source
cd /opt && \
wget https://repo.continuum.io/archive/Anaconda3-5.1.0-Linux-x86_64.sh && \
# Begin Installation
# Install Anaconda3
chmod +x /opt/Anaconda3-5.1.0-Linux-x86_64.sh &&\
/opt/Anaconda3-5.1.0-Linux-x86_64.sh -b -p /opt/conda && \
/opt/conda/bin/conda update -y --prefix /opt/conda conda && \
# Install Jupyter related Packages
/opt/conda/bin/conda install -y jupyter numpy pandas
# Install QuantLib related Packages
RUN /opt/conda/bin/conda install -y -c domosute boost && \
/opt/conda/bin/conda install -y -c domouste quantlib && \
/opt/conda/bin/conda install -y -c domosute quantlib-python

# Setup for Jupyter Notebook
RUN echo "export PATH=/opt/conda/bin:$PATH" > /etc/profile.d/conda.sh && \
cp /etc/profile.d/conda.sh /root/.bashrc && \
groupadd -g 1000 jupyter && \
useradd -g jupyter -G wheel -m -s /bin/bash jupyter && \
echo "jupyter:jupyter" | chpasswd && \
echo "jupyter ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/jupyter && \
chmod 0440 /etc/sudoers.d/jupyter && \
# Below file enable password access instead of token
echo "c.NotebookApp.token = 'jupyter'" > /home/jupyter/jupyter_notebook_config.py && \
# Remove files to reduce image size
rm -f /opt/Anaconda3-5.1.0-Linux-x86_64.sh && \
# Conda clean up
/opt/conda/bin/conda clean -y --all

EXPOSE 8888
USER jupyter
WORKDIR /home/jupyter

CMD ["/bin/bash", "-c", "/opt/conda/bin/jupyter-notebook --ip=*"]
