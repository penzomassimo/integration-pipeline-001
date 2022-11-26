

cleanup-assets:
	find ./assets/diagrams -type f -iname '.*' -exec rm {} \;
	find ./assets/images -type f -iname '.*' -exec rm {} \;


cleanup-nifi-registry-svc:
	echo 'clean'


cleanup-nifi-svc:
	echo 'clean'


cleanup-pgadmin-svc:
	echo 'clean'


cleanup-postgresdb-app-1-svc:
	echo 'clean'


cleanup-postgresdb-app-2-svc:
	echo 'clean'


cleanup-postgresdb-app-3-svc:
	echo 'clean'


cleanup-postgresdb-svc:
	echo 'clean'


cleanup-svftp-svc:
	echo 'clean'

massimo: cleanup-nifi-svc cleanup-pgadmin-svc