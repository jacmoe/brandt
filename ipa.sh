#! /usr/bin/env bash
	curl -sS https://dictionaryapi.com/api/v3/references/collegiate/json/$1\?key=$WEBSTER_KEY\
	| jq . | awk '/mw/ { gsub("\"", ""); gsub("au̇", "[15]"); gsub("ȯi", "[16]"); gsub("yü", "[17]"); gsub("a", "[1]"); \
	gsub("ä", "[3]"); gsub("ȯ", "[4]"); gsub("ō", "[5]"); gsub("u̇", "[6]"); gsub("ü", "[7]"); gsub("ər", "[9]"); gsub("ə", "[8]"); \
	gsub("e", "[10]"); gsub("ā", "[11]"); gsub("i", "[12]"); gsub("ē", "[13]"); gsub("ī", "[14]"); \
	gsub(",", ""); sub(/^./, "", $2); print $2; exit}'\
	| xargs -I {} echo $1 {}
