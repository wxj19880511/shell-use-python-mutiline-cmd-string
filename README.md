# Why this project
- i want to make a test about call mutiline python commands inside the shell script file
- after that i will post this json data to Django REST API (generated by DRF)
- then logstash will sync the data to elastic search
- kibana visulize the data
- the reason why i do so instead of posting data to ELK directly is that my ELK stack composed of about 10 containers among serval hosts and at present it seems this not good way to do data backup and restore for docker volume data.

## What does the script do ?
- delete the section "metrics, definition" field in test1.json, for example
```json
{
  "project_name":"MSS17",
  "revision":"1576",
  "metrics":{
   }
   "definitions":{
   }
}
```
to 
```json
{
  "project_name":"MSS17",
  "revision":"1576",
}
```
- conver test2.json data format, tempararily name the new json file as tset2_new.json, for example
```json
{
  "key1" : {
    "f1":"a",
    "f2":"b"
  },
  
  "key2" : {
    "f1":"c",
    "f2":"d"
  }
}
```
to ( "key1" equal "value_of_key1" )
``` json
[
  { "self_define_key" : "key1",
    "f1":"a",
    "f2":"b"
  },
  {
    "self_define_key" : "key2",
    "f1":"c",
    "f2":"d"
  }
]
```
- merge test1.json and test2_new.json, then i get the below data
``` json
[
  {  
    "project_name":"MSS17",
    "revision":"1576",
    "self_define_key" : "key1",
    "f1":"a",
    "f2":"b"
  },
  {
    "project_name":"MSS17",
    "revision":"1576",
    "self_define_key" : "key2",
    "f1":"c",
    "f2":"d"
  }
]

