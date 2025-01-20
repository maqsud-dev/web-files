#/bin/bash

#Init larger assets
if [ ! -d "src/assets/geojson/cities" ]; then
  rm src/assets/geojson-tmp.tar.gz
  curl -o src/assets/geojson-tmp.tar.gz https://raw.githubusercontent.com/maqsud-dev/web-files/refs/heads/main/project-files/pk-ui/geojson.tar.gz
  ( cd src/assets ; tar -xzvf geojson-tmp.tar.gz )
  rm src/assets/geojson-tmp.tar.gz
fi
