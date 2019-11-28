#while [[ ! -f /root/tmp3/initialAdminPassword) ]]; do echo .; sleep 1; done
while ! curl --silent http://jenkins-master:8080 | grep 'You are authenticated'; do echo .; sleep 1; done
/etc/tmp2/create-node.sh http://jenkins-master:8080 tarun-node admin:$(cat /root/tmp3/initialAdminPassword)