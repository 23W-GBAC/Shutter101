#Create folder container (img) for resized images, markdown file for master list of resized images and a base MD file for the photogallery. 
mkdir img
touch resized_images_list.md
touch "$(basename "$(pwd)").md"
echo "## $(basename "$(pwd)")" >> $(basename "$(pwd)").md
#Iterate to each images in the folder
for file in *.jpg *.jpeg *.png *.gif *.JPG *.JPEG; do
	if [ -f "$file" ]; then
	       	filename=$(basename "$file")
		
		#Using ImageMagick resize image to a lower resolution.
                convert "$file" -resize "600x400>" "img/$filename"
		echo "Resizing of $file done."
		
		#Append the image name to the master list. 
		echo "$filename" >> resized_images_list.md
		echo "Image added to the list."
		
		#Create variables as container of the meta data.
		model=$(exiftool -Model $file | awk -F': ' '{print $2}')
               	exposuretime=$(exiftool -ExposureTime $file | awk -F': ' '{print $2}')
                fnumber=$(exiftool -FNumber $file | awk -F': ' '{print $2}')
                iso=$(exiftool -ISO $file | awk -F': ' '{print $2}')
               	lensmodel=$(exiftool -LensID $file | awk -F': ' '{print $2}')
		
		#Writing the image description using the variables created to the base markdown file for the photogallery. 
		echo -e "![$file](/Shutter101/photos/$(basename "$(pwd)")/img/$file)\n" >> "$(basename "$(pwd)").md"
               	echo -e "$model, $lensmodel, $exposuretime-sec, f/$fnumber, ISO$iso\n" >> "$(basename "$(pwd)").md"
		echo "Image description of $file extracted." 
	else
		echo "File $file does not exist."
	fi
done 

#Write the ending part  for the photogallery. 
echo "End" >> $(basename "$(pwd)").md
echo "*[Homepage](README.md)*" >>  $(basename "$(pwd)").md
echo "*[Bact to Repository](https://github.com/23W-GBAC/Shutter101/tree/main)*"

#Create a variable to select a cover image from the list of images. This will shuffle the images and select the first image in the list. 
photocover=$(shuf -n 1 resized_images_list.md)

#Container of Figure tag and Figure Caption.
figuretag=$"	<figure>\n\t\t<img src='/Shutter101/photos/$(basename "$(pwd)")/img/$photocover' alt='$photocover'>\n\t\t<figcaption><a href="$(basename "$(pwd)").html">$(basename "$(pwd)")</a></figcaption>\n\t</figure>"

#Append before the </div> the figuretag to my markdown file that contains my portfolio(photogallery.md). 
sed  -i "/<\/div>/i $figuretag" ~/jysndabu/photogallery.md

