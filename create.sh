#while [[ ! -f /root/tmp3/initialAdminPassword) ]]; do echo .; sleep 1; done
while ! curl --silent http://jenkins-master:8080 | grep 'You are authenticated'; do echo .; sleep 1; done

while ! wget --quiet http://jenkins-master:8080/jnlpJars/agent.jar -O /dev/null; do
    echo "waiting for jar file";
    sleep 1;
done


/etc/tmp2/create-node.sh http://jenkins-master:8080 tarun-node admin:$(cat /root/tmp3/secrets/initialAdminPassword)