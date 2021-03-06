# centos-quantlib
Jupyter Notebook with Quantlib Docker image for x86_64 platform

Used [centos](https://hub.docker.com/_/centos/) as base image, and [Anaconda3 5.2.0](https://repo.continuum.io/archive/) for jupyter notebook.

How to Run the Image
------------
1. Clone this repository.
```
git clone https://github.com/domosute/centos-quantlib.git
```
2. Enter into the folder and build the container.
```
docker build -t ql .
```
3. Under docker-enabled environment, execute the following;
```
docker run -d -it -p 9999:9999 -v $PWD/notebook:/home/jupyter --name ql ql
```
4. Access via browser. Type 'jupyter' to access to notebook.
```
https://<IP address of docker mahcine>:9999
```
* Default password is 'jupyter'.  Modify `jupyter_notebook_config.py` accordingly.
