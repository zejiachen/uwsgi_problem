cd /home/projects/uwsgi_app
source virtualenv/bin/activate
./virtualenv/bin/uwsgi -y ./etc/uwsgi_app.yaml &
