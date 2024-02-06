# Define the directory path
dir=~/Pictures/StarredImages/

# Check if the directory exists
if [ ! -d "$dir" ]; then
    # If it doesn't exist, create it
    mkdir -p "$dir"
    echo "Directory created: $dir"
else
    echo "Directory already exists: $dir"
fi


# Iterate to check the ratings of each images then transfer starred.
for file in *.CR3; do
        rating=$(exiftool -Rating "$file" | awk -F': ' '{print $2}')
        echo "File: $file, Rating: $rating"

        if [[ "$rating" == "1" ]]; then
            echo "Copying $file to ~/Pictures/StarredImages/"
            cp "$file" ~/Pictures/StarredImages/
        fi
done
