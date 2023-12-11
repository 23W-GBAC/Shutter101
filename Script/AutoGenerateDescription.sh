touch "$(basename "$(pwd)").md"

for file in *.{jpg,jpeg,png,gif,JPG,JPEG}; do
        if [ "$file" != "*.jpg" ] && [ "$file" != "*.jpeg" ] && [ "$file" != "*.png" ] && [ "$file" != "*.gif" ] && [ "$file" != "*.JPG" ] && [ "$file" != "*.JPEG" ]; then
                model=$(exiftool -Model $file | awk -F': ' '{print $2}')
                exposuretime=$(exiftool -ExposureTime $file | awk -F': ' '{print $2}')
                fnumber=$(exiftool -FNumber $file | awk -F': ' '{print $2}')
                iso=$(exiftool -ISO $file | awk -F': ' '{print $2}')
                lensmodel=$(exiftool -LensID $file | awk -F': ' '{print $2}')

                echo -e "![$file](/Shutter101/photos/$(basename "$(pwd)")/img/$file)\n" >> "$(basename "$(pwd)").md"
                echo -e "$model, $lensmodel, $exposuretime-sec, f/$fnumber, ISO$iso\n" >> "$(basename "$(pwd)").md"
        fi
done

