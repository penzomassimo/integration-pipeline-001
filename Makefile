#!make
include .env
export $(shell sed 's/=.*//' .env)

docker-ls:
# 	echo $(RESTART_POLICY)
	echo '====== CONTAINERS ======'
	docker container ls
	echo ''
	echo '====== VOLUMES ======'
	docker volume ls
	echo ''
	echo '====== NETWORKS ======'
	docker network ls


cleanup-assets:
	echo '====== Pushing image to repository ======'
	find ./assets/diagrams -type f -iname '.*' -exec rm {} \;
	find ./assets/images -type f -iname '.*' -exec rm {} \;


massimo: cleanup-nifi-svc cleanup-pgadmin-svc


run-basic-conatiner:
	docker run -it -v /data_mp ubuntu:latest /bin/bash 

backup-services:

	echo '====== Backing up: postgresdb-app-1-svc ======'
	docker run \
	--rm \
	--volumes-from postgresdb-app-1-svc \
	-v $(shell pwd)/postgresdb-app-1-svc/backup:/backup \
	ubuntu \
	tar cfz /backup/backup-postgresdb-app-1-svc-vol-01.tar.gz -C /var/lib/postgresql/data .


	echo '====== Backing up: postgresdb-app-2-svc ======'
	docker run \
	--rm \
	--volumes-from postgresdb-app-2-svc \
	-v $(shell pwd)/postgresdb-app-2-svc/backup:/backup \
	ubuntu \
	tar cfz /backup/backup-postgresdb-app-2-svc-vol-01.tar.gz -C /var/lib/postgresql/data .

	echo '====== Backing up: postgresdb-app-3-svc ======'
	docker run \
	--rm \
	--volumes-from postgresdb-app-3-svc \
	-v $(shell pwd)/postgresdb-app-3-svc/backup:/backup \
	ubuntu \
	tar cfz /backup/backup-postgresdb-app-3-svc-vol-01.tar.gz -C /var/lib/postgresql/data .

	
	echo '====== Backing up: postgresdb-app-4-svc ======'
	docker run \
	--rm \
	--volumes-from postgresdb-app-4-svc \
	-v $(shell pwd)/postgresdb-app-4-svc/backup:/backup \
	ubuntu \
	tar cfz /backup/backup-postgresdb-app-4-svc-vol-01.tar.gz -C /var/lib/postgresql/data .

	echo '====== Backing up: nifi-registry-svc ======' 
	docker run \
	--rm \
	--volumes-from nifi-registry-svc \
	-v $(shell pwd)/nifi-registry-svc/backup:/backup \
	ubuntu \
	tar cfz /backup/backup-nifi-registry-svc-vol-01.tar.gz -C /opt/nifi-registry/nifi-registry-current .


	echo '====== Backing up: nifi-svc ======' 
	docker run \
	--rm \
	--volumes-from nifi-svc \
	-v $(shell pwd)/nifi-svc/backup:/backup \
	ubuntu \
	tar cfz /backup/backup-nifi-svc-vol-01.tar.gz -C /opt/nifi/nifi-current .


	echo '====== Backing up: vsftp-svc ======' 
	docker run \
	--rm \
	--volumes-from vsftp-svc \
	-v $(shell pwd)/vsftp-svc/backup:/backup \
	ubuntu /bin/bash -c 'tar cfz /backup/backup-vsftp-svc-vol-01.tar.gz -C /home/vsftpd . && \
	tar cfz /backup/backup-vsftp-svc-vol-02.tar.gz -C /var/log/vsftpd . && \
	tar cfz /backup/backup-vsftp-svc-vol-03.tar.gz -C /etc/vsftp .'









restore-services:	
	echo '====== Stopping all services ======'
	docker-compose stop


	echo '====== Restoring: nifi-registry-svc ======'
	docker run \
	--rm \
	--volumes-from nifi-registry-svc \
	-v '$(shell pwd)/nifi-registry-svc/backup':'/backup' \
	ubuntu /bin/bash -c 'cd /opt/nifi-registry/nifi-registry-current && tar xf /backup/backup-nifi-registry-svc-vol-01.tar.gz'


	echo '====== Restoring: nifi-svc ======'
	docker run \
	--rm \
	--volumes-from nifi-svc \
	-v '$(shell pwd)/nifi-svc/backup':'/backup' \
	ubuntu /bin/bash -c 'cd /opt/nifi/nifi-current && tar xf /backup/backup-nifi-svc-vol-01.tar.gz'


	echo '====== Restoring: postgresdb-app-1-svc ======'
	docker run \
	--rm \
	--volumes-from postgresdb-app-1-svc \
	-v '$(shell pwd)/postgresdb-app-1-svc/backup':'/backup' \
	ubuntu /bin/bash -c 'cd /var/lib/postgresql/data && tar xf /backup/backup-postgresdb-app-1-svc-vol-01.tar.gz'


	echo '====== Restoring: postgresdb-app-2-svc ======'
	docker run \
	--rm \
	--volumes-from postgresdb-app-2-svc \
	-v '$(shell pwd)/postgresdb-app-2-svc/backup':'/backup' \
	ubuntu /bin/bash -c 'cd /var/lib/postgresql/data && tar xf /backup/backup-postgresdb-app-2-svc-vol-01.tar.gz'


	echo '====== Restoring: postgresdb-app-3-svc ======'
	docker run \
	--rm \
	--volumes-from postgresdb-app-3-svc \
	-v '$(shell pwd)/postgresdb-app-3-svc/backup':'/backup' \
	ubuntu /bin/bash -c 'cd /var/lib/postgresql/data && tar xf /backup/backup-postgresdb-app-3-svc-vol-01.tar.gz'


	echo '====== Restoring: postgresdb-app-4-svc ======'
	docker run \
	--rm \
	--volumes-from postgresdb-app-4-svc \
	-v '$(shell pwd)/postgresdb-app-4-svc/backup':'/backup' \
	ubuntu /bin/bash -c 'cd /var/lib/postgresql/data && tar xf /backup/backup-postgresdb-app-4-svc-vol-01.tar.gz'


	echo '====== Restoring: vsftp-svc ======'
	docker run \
	--rm \
	--volumes-from vsftp-svc \
	-v '$(shell pwd)/vsftp-svc/backup':'/backup' \
	ubuntu /bin/bash -c 'cd /home/vsftpd && tar xf /backup/backup-vsftp-svc-vol-01.tar.gz && \
	cd /var/log/vsftpd && tar xf /backup/backup-vsftp-svc-vol-02.tar.gz && \
	cd /etc/vsftp && tar xf /backup/backup-vsftp-svc-vol-03.tar.gz'


	echo '====== Restarting all services ======'
	docker-compose start
































backup-services-DONOTUSE:
	echo ''
	echo '====== Stopping running containers ======'
	docker-compose stop
	
	echo ''
	echo '====== Backing up: postgresdb-app-1-svc ======'
	docker run --rm --volumes-from integration-pipeline-001-postgresdb-app-1-svc-1 -v $(shell pwd)/postgresdb-app-1-svc/backup:/backup ubuntu \
	tar cvf /backup/backup-postgresdb-app-1-svc-vol-01.tar /var/lib/postgresql/data

	echo ''
	echo '====== Backing up: postgresdb-app-2-svc ======'
	docker run --rm --volumes-from integration-pipeline-001-postgresdb-app-2-svc-1 -v $(shell pwd)/postgresdb-app-2-svc/backup:/backup ubuntu \
	tar cvf /backup/backup-postgresdb-app-2-svc-vol-01.tar /var/lib/postgresql/data	

	echo ''
	echo '====== Backing up: postgresdb-app-3-svc ======'
	docker run --rm --volumes-from integration-pipeline-001-postgresdb-app-3-svc-1 -v $(shell pwd)/postgresdb-app-3-svc/backup:/backup ubuntu \
	tar cvf /backup/backup-postgresdb-app-3-svc-vol-01.tar /var/lib/postgresql/data	

	echo ''
	echo '====== Backing up: postgresdb-app-4-svc ======'
	docker run --rm --volumes-from integration-pipeline-001-postgresdb-app-1-svc-1 -v $(shell pwd)/postgresdb-app-4-svc/backup:/backup ubuntu \
	tar cvf /backup/backup-postgresdb-app-1-svc-vol-01.tar /var/lib/postgresql/data	
	
	echo ''
	echo '====== Backing up: nifi-registry-svc ======' 
	docker run --rm --volumes-from integration-pipeline-001-nifi-registry-svc-1 -v $(shell pwd)/nifi-registry-svc/backup:/backup ubuntu \
	tar cvf /backup/backup-nifi-registry-svc-vol-01.tar /opt/nifi-registry/nifi-registry-current/database
	docker run --rm --volumes-from integration-pipeline-001-nifi-registry-svc-1 -v $(shell pwd)/nifi-registry-svc/backup:/backup ubuntu \
	tar cvf /backup/backup-nifi-registry-svc-vol-02.tar /opt/nifi-registry/nifi-registry-current/flow_storage

	echo ''
	echo '====== Backing up: nifi-svc ======' 
	docker run --rm --volumes-from integration-pipeline-001-nifi-svc-1 -v $(shell pwd)/nifi-svc/backup:/backup ubuntu \
	tar cvf /backup/backup-nifi-svc-vol-01.tar /opt/nifi/nifi-current/database_repository
	docker run --rm --volumes-from integration-pipeline-001-nifi-svc-1 -v $(shell pwd)/nifi-svc/backup:/backup ubuntu \
	tar cvf /backup/backup-nifi-svc-vol-02.tar /opt/nifi/nifi-current/flowfile_repository
	docker run --rm --volumes-from integration-pipeline-001-nifi-svc-1 -v $(shell pwd)/nifi-svc/backup:/backup ubuntu \
	tar cvf /backup/backup-nifi-svc-vol-03.tar /opt/nifi/nifi-current/content_repository
	docker run --rm --volumes-from integration-pipeline-001-nifi-svc-1 -v $(shell pwd)/nifi-svc/backup:/backup ubuntu \
	tar cvf /backup/backup-nifi-svc-vol-04.tar /opt/nifi/nifi-current/provenance_repository
	docker run --rm --volumes-from integration-pipeline-001-nifi-svc-1 -v $(shell pwd)/nifi-svc/backup:/backup ubuntu \
	tar cvf /backup/backup-nifi-svc-vol-05.tar /opt/nifi/nifi-current/state
	docker run --rm --volumes-from integration-pipeline-001-nifi-svc-1 -v $(shell pwd)/nifi-svc/backup:/backup ubuntu \
	tar cvf /backup/backup-nifi-svc-vol-06.tar /opt/nifi/nifi-current/logs
	docker run --rm --volumes-from integration-pipeline-001-nifi-svc-1 -v $(shell pwd)/nifi-svc/backup:/backup ubuntu \
	tar cvf /backup/backup-nifi-svc-vol-07.tar /opt/nifi/nifi-current/conf
	docker run --rm --volumes-from integration-pipeline-001-nifi-svc-1 -v $(shell pwd)/nifi-svc/backup:/backup ubuntu \
	tar cvf /backup/backup-nifi-svc-vol-08.tar /opt/nifi/nifi-current/lib

	echo ''
	echo '====== Backing up: pgadmin-svc ======' 
	docker run --rm --volumes-from integration-pipeline-001-pgadmin-svc-1 -v $(shell pwd)/pgadmin-svc/backup:/backup ubuntu \
	tar cvf /backup/backup-pgadmin-svc-vol-01.tar /var/lib/pgadmin

	echo ''
	echo '====== Backing up: svftp-svc ======' 
	docker run --rm --volumes-from integration-pipeline-001-svftp-svc-1 -v $(shell pwd)/svftp-svc/backup:/backup ubuntu \
	tar cvf /backup/backup-svftp-svc-vol-01.tar /home/vsftpd
	docker run --rm --volumes-from integration-pipeline-001-svftp-svc-1 -v $(shell pwd)/svftp-svc/backup:/backup ubuntu \
	tar cvf /backup/backup-svftp-svc-vol-02.tar /var/log/vsftpd
	docker run --rm --volumes-from integration-pipeline-001-svftp-svc-1 -v $(shell pwd)/svftp-svc/backup:/backup ubuntu \
	tar cvf /backup/backup-svftp-svc-vol-03.tar /etc/vsftp

	
	echo '====== Restarting containers ======'
	docker-compose start







	





































	