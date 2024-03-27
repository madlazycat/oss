#!/bin/bash

# Set the source and destination host, port, and cluster credentials
SOURCE_HOST="http://sd-etl01.sd.local"
SOURCE_PORT="9200"
DEST_HOST="https://sd-bdd-etl01.sd.local"
DEST_PORT="9200"
SOURCE_USER_NAME="admin"
SOURCE_CLUSTER_PASS="admin"
DEST_USER_NAME="admin"
DEST_CLUSTER_PASS="Oss#admin#1s1s"

# Loop through the indexes from the index_list.txt file
while IFS= read -r index <&3; do
    # Perform the data migration
    curl --user admin:Oss\#admin\#1s1s \
     --request POST "https://sd-bdd-etl01.sd.local:9200/_reindex?pretty" \
     --header 'Content-Type: application/json' \
     --data '{
       "source": {
         "remote": {
           "host": "http://sd-etl01.sd.local:9200",
           "username": "admin",
           "password": "admin"
         },
         "index": "'$index'"
       },
       "dest": {
         "index": "'$index'"
       }
     }' \
     --insecure
    # Log the processed index
    echo "Index $index processed" >> data_migration.log
done 3< /home/o.parshkova/oss_migration/index_list.txt 
