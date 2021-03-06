#!/bin/bash
# -- run the test-trigger container, which will send a service deployment request, mocking the GK.
export DOCKER_HOST="tcp://sp.int3.sonata-nfv.eu:2375"
set -e
set -x

docker run --rm --net=sonata -e broker_host=amqp://guest:guest@sp.int3.sonata-nfv.eu:5672/%2F --name int_slm_ia_trigger slm_ia_trigger /plugin/test_trigger/test.sh 2>&1 | tee -i ./int-slm-infrabstractV2/triggerLog.txt

cat ./int-slm-infrabstractV2/triggerLog.txt | grep "OUTPUT" | cut -d\: -f5 > ./int-slm-infrabstractV2/instanceId.conf


