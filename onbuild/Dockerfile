FROM registry.cn-shanghai.aliyuncs.com/alfredg/nginx-gunicorn

ONBUILD COPY ./requirements.txt /tmp/requirements.txt
ONBUILD RUN pip install --no-cache-dir -r /tmp/requirements.txt
ONBUILD COPY ./app /app
