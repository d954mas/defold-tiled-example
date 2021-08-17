#Resave all runtime maps
#not resave tilese
#https://github.com/mapeditor/tiled/commit/72789ab0e1a42c87f196f027f2cb6169675f5e48
mkdir -p ./runtime/lua
mkdir -p ./runtime/sources
mkdir -p ./runtime/result
rm -r ./runtime/lua/*

echo resave maps;
for f in $(find ./runtime/sources -name '*.tmx'); do
	fname=`basename $f`
	newname=${fname%.*}.lua
	echo $f;
	 /C/Program\ Files/Tiled/tiled.exe --export-map lua $f ./runtime/lua/$newname
done;


read -t 3 -p "Press any key or wait 3 second"