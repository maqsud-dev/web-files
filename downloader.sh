#/bin/bash
BASE_URL=https://raw.githubusercontent.com/maqsud-dev/web-files/refs/heads/main/
BASE_PATH_COPY_TO=
BASE_SUB_URI=
FILES_FOR_COPY=

BASE_URL=https://$TOKEN@raw.githubusercontent.com/maqsud-dev/web-files/refs/heads/main/
curl -s https://$TOKEN@raw.githubusercontent.com/<user or organization>/<repo name>/<branch>/<path to file>/<file_name>

# You can use the V3 API to get a raw file like this (you'll need an OAuth token):
curl -H 'Authorization: token INSERTACCESSTOKENHERE'  -H 'Accept: application/vnd.github.v3.raw' \
  -O  -L https://api.github.com/repos/owner/repo/contents/path
# All of this has to go on one line. The -O option saves the file in the current directory. You can use -o filename to specify a different filename.



# https://github.com/maqsud-dev/web-files/tree/main/examples?noancestors=1
# https://github.com/maqsud-dev/web-files/tree/main/examples/folder-02?noancestors=1

curl -H "Accept: application/json" https://github.com/maqsud-dev/web-files/tree/main/examples?noancestors=1

JSON_DATA=$(curl -H "Accept: application/json" https://github.com/maqsud-dev/web-files/tree/main/examples?noancestors=1)

echo $JSON_DATA | jq ".payload.tree.items"
echo $JSON_DATA | jq ".payload.tree.items[1]"
echo $JSON_DATA | jq ".payload.tree.items[1].name"
echo $JSON_DATA | jq ".payload.tree.items[1].contentType"
echo $JSON_DATA | jq ".payload.tree.totalCount"

ind=0
for nm in $(echo $JSON_DATA | jq -r ".payload.tree.items[].name") ; do 
	tp=$(echo $JSON_DATA | jq -r ".payload.tree.items[$ind].contentType");
  ind=$((ind+1));
  case "$tp" in
    "directory")
      echo "papka: $nm";;
    "file")
      echo "file: $nm";;
  esac
done;



echo $JSON_DATA | jq ".payload.fileTree" | jq ".[]" | jq .items
echo $JSON_DATA | jq ".payload.fileTree" | jq ".[]" | jq .totalCount
FILE_TREE=$(echo $JSON_DATA | jq ".payload.fileTree")


