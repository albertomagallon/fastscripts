#!/bin/bash

busqueda=$(echo $1 | tr " " "+")
for capitulo in $(curl http://www.elitetorrent.net/resultados/$busqueda | grep href | egrep -o '/torrent/[0-9]{5}/[-a-zA-Z0-9-]{1,}');do
	nombre=$(echo $capitulo | awk '{split($0,a,"[0-9]{1,}/"); print a[2]}')
	echo "[+] Descargando $nombre"
	torrent=$(curl http://www.elitetorrent.net/$capitulo | egrep -o '/get-torrent/[0-9]{1,}')
	wget -O $nombre".torrent" http://www.elitetorrent.net/$torrent
done
