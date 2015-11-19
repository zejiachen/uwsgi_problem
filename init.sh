mkdir -p /home/projects/uwsgi_app/etc
cp etc/uwsgi_app.yaml /home/projects/uwsgi_app/etc/
cp etc/uwsgi_app.conf /etc/nginx/conf.d/
cp -r code /home/projects/uwsgi_app/
cp requirements.txt /home/projects/uwsgi_app/

cd /home/projects/uwsgi_app
mkdir -p ./var/log

virtualenv virtualenv
source virtualenv/bin/activate
pip install -r ./requirements.txt
mkdir -p virtualenv/lib/python2.7/site-packages/tinyapp
cp -r code/* virtualenv/lib/python2.7/site-packages/tinyapp/
nginx -s reload
