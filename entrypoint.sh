#! /bin/sh
set -e
chown -R 1000 "$JENKINS_HOME"
export JENKINS_OPTS="--sessionTimeout=43200"
export JAVA_OPTS="-Dhudson.tasks.MailSender.SEND_TO_USERS_WITHOUT_READ=true \
                  -Duser.timezone=Asia/Hong_Kong \
                  -Dhudson.security.csrf.requestfield=Jenkins-Crumb \
                  -Xms2048m \
                  -Xmx2048m \
                  -Xmn1024m \
                  -XX:SurvivorRatio=6 \
                  -XX:PermSize=256m \
                  -XX:MaxPermSize=512m \
                  -XX:ParallelGCThreads=4 \
                  -XX:+UseConcMarkSweepGC \
                  -XX:+HeapDumpOnOutOfMemoryError \
                  -XX:HeapDumpPath=/var/jenkins_home/jvm-dumps \
                  -Dhudson.security.csrf.requestfield=Jenkins-Crumb \
                  -Dhudson.slaves.ChannelPinger.pingIntervalSeconds=5 \
                  -Dhudson.slaves.ChannelPinger.pingTimeoutSeconds=5"
exec su-exec jenkins /sbin/tini -- /usr/local/bin/jenkins.sh
