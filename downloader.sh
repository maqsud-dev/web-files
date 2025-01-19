#/bin/bash
BASE_URL=https://raw.githubusercontent.com/maqsud-dev/web-files/refs/heads/main/
BASE_PATH_COPY_TO=
BASE_SUB_URI=
FILES_FOR_COPY=

https://github.com/maqsud-dev/web-files/tree/main/examples?noancestors=1
https://github.com/maqsud-dev/web-files/tree/main/examples/folder-02?noancestors=1

curl -H "Accept: application/json" https://github.com/maqsud-dev/web-files/tree/main/examples?noancestors=1

JSON_DATA=$(curl -H "Accept: application/json" https://github.com/maqsud-dev/web-files/tree/main/examples?noancestors=1)
echo $JSON_DATA | jq ".payload.fileTree" | jq ".[]" | jq .items
echo $JSON_DATA | jq ".payload.fileTree" | jq ".[]" | jq .totalCount
FILE_TREE=$(echo $JSON_DATA | jq ".payload.fileTree")

