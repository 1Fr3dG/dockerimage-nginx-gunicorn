FROM registry.cn-hangzhou.aliyuncs.com/acs/python:3.6

MAINTAINER Alfred Gao <alfredg@alfredg.cn>
# Install Gunicorn WSGI Server
RUN pip install --no-cache-dir gunicorn

# Standard set up Nginx & Supervisord
RUN apt-get update \
	&& apt-get install -y ca-certificates nginx gettext-base supervisor \
	&& rm -rf /var/lib/apt/lists/* \
# forward request and error logs to docker log collector
	&& ln -sf /dev/stdout /var/log/nginx/access.log \
	&& ln -sf /dev/stderr /var/log/nginx/error.log \
# Make NGINX run on the foreground
	&& echo "daemon off;" >> /etc/nginx/nginx.conf

# Copy the modified Nginx conf
RUN rm /etc/nginx/sites-enabled/default
COPY nginx.conf /etc/nginx/sites-enabled/default.conf
COPY gunicon.conf /etc/gunicon.conf

# Custom Supervisord config
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

COPY ./app /app

WORKDIR /app

EXPOSE 80 443
CMD ["/usr/bin/supervisord"]