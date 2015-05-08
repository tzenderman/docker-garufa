FROM tzenderman/docker-rvm

# Install system libraries.
RUN apt-get update && \
    apt-get install -y python-software-properties && \
    add-apt-repository ppa:nginx/stable && \
    apt-get install -y nginx && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /etc/dpkg/dpkg.cfg.d/02apt-speedup

WORKDIR /code

# Install specific ruby and gem versions.
COPY Gemfile /code/Gemfile
RUN rvm install 2.1.0 && \
    /bin/bash -l -c "rvm use --default 2.1.0 && \
    bundle install" && \
    rvm cleanup all

# Setup Nginx files.
COPY conf/nginx.conf /code/nginx.conf
COPY conf/local.ngx /code/local.ngx
RUN rm -f /etc/nginx/nginx.conf && \
    rm -f /etc/nginx/sites-enabled/* && \
    ln -s /code/nginx.conf /etc/nginx/nginx.conf && \
    ln -s /code/local.ngx /etc/nginx/sites-enabled/local.ngx

# Define mountable directories.
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/ssl"]

EXPOSE 80
EXPOSE 443

ADD start /start
CMD ["/start"]
