#!/usr/bin/env bash

set -e

RED='\033[0;31m'
NC='\033[0m' # No Color

if ! [ -x "$(command -v jq)" ]; then
  echo -e "${RED}Error: jq is not installed${NC}: https://stedolan.github.io/jq/" >&2
  exit 1
fi

BASE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

INPUT_DIR=$1
if [ -z "$INPUT_DIR" ]; then
  INPUT_DIR="$BASE_DIR"
fi

OUTPUT_DIR=$2
if [ -z "$OUTPUT_DIR" ]; then
  OUTPUT_DIR="$BASE_DIR/_build"
fi

mkdir -p "$OUTPUT_DIR"

echo "copy schema.json"
cp "$INPUT_DIR/schema.json" "$OUTPUT_DIR/schema.json"
cp "$INPUT_DIR/schema-errors.json" "$OUTPUT_DIR/schema-errors.json"

echo "copy errors.json"
cp "$INPUT_DIR/errors.json" "$OUTPUT_DIR/errors.json"

for file in "methods" "objects" "responses"
do
  echo "build $file from $INPUT_DIR/*/$file.json"

  jq -s '
  def deepmerge(a;b):
   reduce (b[]) as $item (a;
     reduce ($item | keys_unsorted[]) as $key (.;
       $item[$key] as $val | ($val | type) as $type | .[$key] = if ($type == "object") then
         deepmerge({}; [if .[$key] == null then {} else .[$key] end, $val])
       elif ($type == "array") then
         (.[$key] + $val)
       else
         $val
       end
     )
  );
  deepmerge({}; .)
  ' $INPUT_DIR/*/$file.json |
  jq '.["$schema"] = "schema.json"' |
  sed -E "s|\"([^\"]+)\": \".*/([a-z]+\.json#/.*)\"|\"\1\": \"\2\"|g" > $OUTPUT_DIR/$file.json
done
