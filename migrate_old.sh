for index in hdfs-audit-2023.11.19 hdfs-audit-2023.11.18 hdfs-audit-2023.11.17 hdfs-audit-2023.11.16 hdfs-audit-2023.11.15 hdfs-audit-2023.11.14 hdfs-audit-2023.11.12 hdfs-audit-2023.11.11 hdfs-audit-2023.11.10 hdfs-audit-2023.11.09 hdfs-audit-2023.11.08 hdfs-audit-2023.11.07 hdfs-audit-2023.11.06 hdfs-audit-2023.11.05 hdfs-audit-2023.11.04 hdfs-audit-2023.11.03 hdfs-audit-2023.11.02 hdfs-audit-2023.11.01 hdfs-audit-2023.10.31 hdfs-audit-2023.10.30 hdfs-audit-2023.10.29 hdfs-audit-2023.10.28 hdfs-audit-2023.10.27 hdfs-audit-2023.10.26 hdfs-audit-2023.10.25 hdfs-audit-2023.10.24 hdfs-audit-2023.10.23 hdfs-audit-2023.10.22 hdfs-audit-2023.10.21 hdfs-audit-2023.10.20 hdfs-audit-2023.10.19 hdfs-audit-2023.10.18 hdfs-audit-2023.10.17 hdfs-audit-2023.10.16 hdfs-audit-2023.10.15 hdfs-audit-2023.10.14 hdfs-audit-2023.10.13 hdfs-audit-2023.10.12 hdfs-audit-2023.10.11 hdfs-audit-2023.10.10 hdfs-audit-2023.10.09 hdfs-audit-2023.10.08 hdfs-audit-2023.10.07 hdfs-audit-2023.10.06 hdfs-audit-2023.10.05 hdfs-audit-2023.10.04 hdfs-audit-2023.10.03 hdfs-audit-2023.10.02 hdfs-audit-2023.10.01 hdfs-audit-2023.09.30 hdfs-audit-2023.09.29 hdfs-audit-2023.09.28 hdfs-audit-2023.09.27 hdfs-audit-2023.09.26 hdfs-audit-2023.09.25 hdfs-audit-2023.09.24 hdfs-audit-2023.09.23 hdfs-audit-2023.09.22 hdfs-audit-2023.09.21 hdfs-audit-2023.09.20 hdfs-audit-2023.09.19 hdfs-audit-2023.09.18 hdfs-audit-2023.09.17 hdfs-audit-2023.09.16 hdfs-audit-2023.09.15 hdfs-audit-2023.09.14 hdfs-audit-2023.09.13 hdfs-audit-2023.09.12 hdfs-audit-2023.09.11 hdfs-audit-2023.09.10 hdfs-audit-2023.09.09 hdfs-audit-2023.09.08 hdfs-audit-2023.09.07 hdfs-audit-2023.09.06 hdfs-audit-2023.09.05 hdfs-audit-2023.09.04 hdfs-audit-2023.09.03 hdfs-audit-2023.09.02 hdfs-audit-2023.09.01 hdfs-audit-2023.08.31 hdfs-audit-2023.08.30 hdfs-audit-2023.08.29 ; do
 date
 date >> data_migration.log
 echo "Started migration for index $index" >> data_migration.log
 echo "Started migration for index $index" 
   curl --user 'admin:Oss#admin#1s1s' \
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
 date >> data_migration.log
 echo "Index $index processed" 
 echo "Index $index processed" >> data_migration.log
done


