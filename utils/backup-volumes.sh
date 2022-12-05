#!/bin/bash


#### V1
docker-compose pause

dirname=${PWD##*/}
for nv in `docker volume ls -q`
do
  if [[ $nv = ${dirname}* ]]; then
    f=${nv//${dirname}_/}
    echo -n "Backing up $f ..."
    docker run -it --rm \
      -v $nv:/data -v $PWD:/backup alpine \
      tar -cjf /backup/$f.tar.bz2 -C /data ./
    echo "done"
  fi
done

docker-compose unpause



#### V2
#!/bin/bash

compose_file_path=$1
project_name=$2
backup_path=$3

function backup_volume {
  volume_name=$1
  backup_destination=$2

  docker run --rm -v $volume_name:/data -v $backup_destination:/backup ubuntu tar -zcvf /backup/$volume_name.tar /data
}

echo "Stopping running containers"
docker-compose -f $compose_file_path stop

echo "Mounting volumes and performing backup..."
volumes=($(docker volume ls -f name=$project_name | awk '{if (NR > 1) print $2}'))
for v in "${volumes[@]}"
do
  backup_volume $v $backup_path
done

echo "Restarting containers"
docker-compose -f $compose_file_path start