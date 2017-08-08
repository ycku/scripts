# Elasticsearch 5.3 + Ingest Attachment Plugin on Ubuntu 17.04 server
## Installation
### Download
```
~$ wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.3.2.zip
~$ wget https://artifacts.elastic.co/downloads/elasticsearch-plugins/ingest-attachment/ingest-attachment-5.3.2.zip
~$ sudo apt install openjdk-8-jre-headless
~$ unzip elasticsearch-5.3.2.zip
~$ elasticsearch-5.3.2/bin/elasticsearch-plugin install file:///home/ubuntu/ingest-attachment-5.3.2.zip
```
* 版本要一致
* jre要8以上

### 設定檔 (部份修改)
#### config/elasticsearch.yml
```
cluster.name: iServDB
node.name: ${HOSTNAME}
http.host: 0.0.0.0
http.cors.enabled : true
http.cors.allow-origin : "*"
http.cors.allow-methods : OPTIONS, HEAD, GET, POST, PUT, DELETE
http.cors.allow-headers : X-Requested-With,X-Auth-Token,Content-Type,Content-Length,Authorization
http.max_content_length : 500mb
plugin.mandatory: ingest-attachment
path.repo: ["/tmp"]
```
* http.host, 若依設定檔使用network.host會不能啓動

#### config/jvm.options
```
-Xms512m
-Xmx512m
```
* 512m測試可以執行, 只是啓動可能要數分鐘

### 啓動
```
~$ elasticsearch-5.3.2/bin/elasticsearch &
```
* 不可以用root或sudo

### ingest設定
* 參考: https://github.com/rahulsinghai/elasticsearch-ingest-attachment-plugin-example
* 上面專案提供簡單操作流程, 可將檔案放進Elasticsearch索引
* 檔案不用解析, 全由Ingest plugin完成所有流程
* 專案提供的IndexFile.sh有一些小問題, 修改如下:
* 最後一行IP要手動調整成自己的環境.
* 檔案匯入script: [indexFile.sh](indexFile.sh)
