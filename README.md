# dockerimage-nginx-uwsgi
Python3 uwsgi image

##Usage

`docker run -p 80:80 registry.cn-shanghai.aliyuncs.com/alfredg/nginx-uwsgi`

You may create a volume mapping for app code:

`docker run -p 80:80 -v /path/to/app:/app registry.cn-shanghai.aliyuncs.com/alfredg/nginx-uwsgi`

Or, you can just create docker image with one-line Dockerfile:

`FROM registry.cn-shanghai.aliyuncs.com/alfredg/nginx-uwsgi:onbuild`

Put `requirement.txt` in the root path and it will be feed to pip.

Put code do \app path, with \app\main.py as entry point.

