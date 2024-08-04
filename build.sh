#!/bin/bash

echo '# Jadaptive Brand

This is a public repository of Jadaptive Brand assets.
' > README.md

# Banners
echo "Banners ---------------------------"
echo -e '## Banners\n' >> README.md
pushd banner
for i in *.svg ; do 

    echo "  $i"
    name=$(basename "$i" .svg)
    echo -e "### ${name}\n" >> ../README.md

    mkdir -p "${name}/png"
    mkdir -p "${name}/gif"
    mkdir -p "${name}/webp"

    echo -e "![${name}](banner/${name}/png/${name}-sm.png)\n" >> ../README.md

    for j in 1173,258,lg,Large 586,129,md,Medium 293,64,sm,Small ; do
        echo "    $j"

        w=$(echo $j|awk -F, '{ print $1 }')
        h=$(echo $j|awk -F, '{ print $2 }')
        s=$(echo $j|awk -F, '{ print $3 }')
        t=$(echo $j|awk -F, '{ print $4 }')

        rsvg-convert -w $w -h $h "$i" -o "${name}/png/${name}-${s}.png"
        rsvg-convert -w $w -h $h "$i" -o "${name}/gif/${name}-${s}.gif"  
        rsvg-convert -w $w -h $h "$i" -o "${name}/webp/${name}-${s}.webp" 

        echo -n "[${t} PNG](banner/${name}/png/${name}-${s}.png) " >> ../README.md 
        echo -n "[${t} GIF](banner/${name}/png/${name}-${s}.gif) " >> ../README.md 
        echo -n "[${t} WEBP](banner/${name}/png/${name}-${s}.webp) " >> ../README.md 
        echo -e "\n" >> ../README.md

    done
done
popd

# Graphics
echo "Graphics ---------------------------"
echo -e '## Graphics\n' >> README.md
pushd graphic
for i in *.svg ; do 

    echo "  $i"
    name=$(basename "$i" .svg)
    echo -e "### ${name}\n" >> ../README.md

    mkdir -p "${name}/png"
    mkdir -p "${name}/gif"
    mkdir -p "${name}/webp"

    echo -e "![${name}](graphic/${name}/png/${name}-128.png)\n" >> ../README.md

    for j in 512 256 128 96 64 48 32 24 16 ; do
        echo "    $j"
        rsvg-convert -w $j -h $j "$i" -o "${name}/png/${name}-${j}.png"
        rsvg-convert -w $j -h $j "$i" -o "${name}/gif/${name}-${j}.gif"  
        rsvg-convert -w $j -h $j "$i" -o "${name}/webp/${name}-${j}.webp"

        echo -n "[${j}x${j} PNG](graphic/${name}/png/${name}-${j}.png) " >> ../README.md 
        echo -n "[${j}x${j} GIF](graphic/${name}/png/${name}-${j}.gif) " >> ../README.md 
        echo -n "[${j}x${j} WEBP](graphic/${name}/png/${name}-${j}.webp) " >> ../README.md 

        echo -e "\n" >> ../README.md
    done
done
popd
