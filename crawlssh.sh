#/bin/bash

for x in {1..15}
do
	for url in $(curl http://mmoplus.info/ssh-free/page/$x/  | grep -Eo "(http|https)://[a-zA-Z0-9./?=_-]*" | sort | uniq | grep new-ssh-us)
	do
		echo $url
		curl $url | html2text | grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}"
	done
done
echo "Finish!"
