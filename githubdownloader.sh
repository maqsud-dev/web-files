#/bin/bash
FILE_BASE_URL=https://raw.githubusercontent.com/maqsud-dev/web-files/refs/heads/main
DIR_BASE_URL=https://github.com/maqsud-dev/web-files/tree/main
DIR_SUFFIX="?noancestors=1"

#BASE_PATH_COPY_TO=
#BASE_SUB_URI=examples
#FILES_FOR_COPY=

SCRIPT=$0
BASE_SUB_URI=$1
BASE_PATH_COPY_TO=$2

mkdir -p $BASE_PATH_COPY_TO

JSON_DATA=$(curl -H "Accept: application/json" "$DIR_BASE_URL/$BASE_SUB_URI$DIR_SUFFIX")

ind=0
for nm in $(echo $JSON_DATA | jq -r ".payload.tree.items[].name") ; do 
	tp=$(echo $JSON_DATA | jq -r ".payload.tree.items[$ind].contentType");
  ind=$((ind+1));
  case "$tp" in
    "directory")
      echo "papka: $nm";
      $SCRIPT "$BASE_SUB_URI/$nm" "$BASE_PATH_COPY_TO/$nm"
      ;;
    "file")
      echo "file: $nm";
      curl -o $BASE_PATH_COPY_TO/$nm $FILE_BASE_URL/$BASE_SUB_URI/$nm
      ;;
  esac
done;
