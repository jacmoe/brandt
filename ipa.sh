#! /usr/bin/env bash
	curl -sS https://dictionaryapi.com/api/v3/references/collegiate/json/$1\?key=$WEBSTER_KEY\
	| jq . | awk '/mw/ { gsub("\"", ""); gsub("au̇", "[OW]"); gsub("ȯi", "[OI]"); gsub("yü", "[JU]"); gsub("a", "[AH_s]"); \
	gsub("ä", "[AW_s]"); gsub("ȯ", "[AW_l]"); gsub("ō", "[O]"); gsub("u̇", "[OO_s]"); gsub("ü", "[OO_l]"); gsub("ər", "[UR]"); gsub("ə", "[UH]"); \
	gsub("e", "[EH]"); gsub("ā", "[EY]"); gsub("i", "[EE_s]"); gsub("ē", "[EE_l]"); gsub("ī", "[AI]"); \
	gsub(",", ""); sub(/^./, "", $2); print $2; exit}'\
	| xargs -I {} echo $1 {}
