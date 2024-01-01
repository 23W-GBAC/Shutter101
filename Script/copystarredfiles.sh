for file in *.CR3; do
        rating=$(exiftool -Rating "$file" | awk -F': ' '{print $2}')
        echo "File: $file, Rating: $rating"

        if [[ "$rating" != "0" ]]; then
            echo "Copying $file to ~/Pictures/StarredImages/"
            cp "$file" ~/Pictures/StarredImages/
        fi
done
