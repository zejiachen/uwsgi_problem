## Tinyapp for Presenting A Uwsgi Problem
#### Problem Discription:
According to the uwsgi docs, the reload process should be graceful (when sending SIGHUP).
However, I found that that when I sent SIGHUP to the uwsgi master process, I got nginx connectin reset errors.
Here is a tiny app for showing the problem.
#### How to deploy it:
Firstly, run (We suppose that nginx, virtualenv have been installed on the machine):
./init.sh
then, add the following line to the /etc/hosts:
127.0.0.1 tinyapp.com
#### When the uwsgi problem occurs:
Firstly, run
./run.sh
Secondly, we can get the pid of the master process(named uwsgi\_app\_uWSGI master, through `ps aux` or some other methods), we suppose it as 2002
Thirdly, run:
http\_load -p 5 -r 5 -f 25 ./url.txt
immediately after that, run this in another console(sending SIGHUP when the uwsgi is still processing requests):
kill -HUP 2002

And then we can find that we 'connection reset by peer' in the nginx error log.
The uwsgi log is in /home/projects/uwsgi\_app/var/log
