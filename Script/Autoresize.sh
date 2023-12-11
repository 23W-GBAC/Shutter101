if ! -d "img"; then 
        mkdir img
else 
        echo "The directory is already exists. Skipping write directory."
fi 

if ! -f "resized_images_list.md"; then 
        touch resized_images_list.md
else
        echo "The file is already exists. Skipping file creation."
fi 

for file in *.jpg *.jpeg *.png *.gif *.JPG *.JPEG; do
        filename=$(basename "$file")

        if ! grep -q "$filename" "resized_images_list.md"; then
                convert "$file" -resize "600x600>" "img/$filename"

                echo "$filename" >> resized_images_list.md
        fi
done

