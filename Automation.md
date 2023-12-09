## Issues encountered and the solutions

### Week 1 

During the creation of this first part of my blog, I would like to point out the repetitive tasks that I did and some problems that I encounter. And let us figure out on how can we automate this tasks. 

1. ~~First problem is Github page is not design to cater such content where large size of files are used. You can see that most of my images are quite large in size so it takes a while to render this images in Github pages. I need to compress each images.  I am thinking if I could use third party packages which uses CLI. My goal is that every time I add images to certain folder, it will automatically compress the images to the appropriate size or before pushing any images to the repositories we could run a script to compress the images.~~

2. Adding description to all of the photos are time consuming, I have to look first for each properties of the images then add it to the description tag. I already have an idea on how to approach this problem. All of my images contains metadata. What does it mean? **Photo metadata** refers to the information embedded within a digital photograph that provides details about the image. This metadata includes various properties and settings related to the creation of the photo. Knowing this, I could extract the metadata of each images and list it down to a JSON file or in a Markdown file. But how could I automatically call out the description of each photos in a JSON or Markdown file. So that I don't need of manually typing it in my README.md?
	

##### Tasks for Week 2

- [x]  For the next update of this blog, I will add addtional places that I visited here in Germany and share any random facts about the ciy. 
- [ ]  I will do further study on how to solve my problems listed above. And share it to the blog. 
- [ ]  If someone wants to showcase their home country and their beautiful images, feel free to add in this repo. How? Maybe create a div tag similar from my Gallery 1. 

______

### Week 2 | Dec.4, 2023

##### Issue 1: RESIZE IMAGE. 

One of the problem that I encounter while rendering my Github page  is the slow loading of my pictures. Given all my pictures are large in size, which I should already expect to happen. I keep all my pictures as high quality as much as possible but in preserving these attributes each images are to be in large file size. I do post-processing in Adobe Lightroom one RAW image is ca 40mb in size after conversion to JPG it will size down to ca. 10-15mb which is stillhigh. I do not want to do again a compression in my Lightroom as I will locate each images  again in my Lightroom library. So I opted to do it in CLI instead, which makes it way more faster. In my photo gallery, my images does not need to be in 100% of their actual resolution  which is 6000x4000. I will resize each images to exactly 600x600 that will result to significantly lower in file size. 

My approach is to use the **direnv**. Why? My photo gallery contains  folder of the places I visited, each folder will only contains 10 photos maximum. It means that once I fulfill the 10 photos to each folder I will not add any more to it. Because of that I will only possibly open the folder once that is why I will use **direnv**.

1. I check if direnv is already pre-installed to my system. Which is not so I will intsall it first. I'm using Manjaro as my distro, I will provide a [link](https://direnv.net/docs/installation.html) for the other distro like Ubuntu. 

`sudo pamac install direnv`

2. When I tried the direnv in one of my folders nothings happen. After installing you have to hook it to your shell so that it will work. I will only provide the code corresponding to **ZS**H other shell will be different. Add the following line at the end of the `~/.zshrc` file:

`eval "$(direnv hook bash)"`

3. After that I will run `direnv allow` to each of my folder ensuring that I already  have **.envrc** withouth this you will receive an error message in the terminal. 

>direnv: error .envrc file not found

4. I will create **.envrc** file which I will copy to each of my folder. So every time I will create additional directory for my photo gallery I will copy this .envrc. Something like this:

```
mkdir Gallery1
cp ~/jysndabu/.envrc ~/jysndabu/photos/Gallery1
```

My .envrc contains shell scripting that resize every images in the folder while keeping a record to the images that will be processed so that the script  will not repeat the resizing of all images if I added new photos or if I enter the directory again. It will only resize untrack photos. This will  not replace my original photos  but to create a resized copy of each which will be loacted to the specific folder called "img". To this we have to create a loop which check all imgaes in the folder if certain condition are met then it will perform certain tasks. 

In this script I use [imagemagick](https://imagemagick.org/index.php) to resize images  and grep for searching the images in the list. 

>*First we  have to create a directory called "img" for all  the resized images.*

`mkdir img`

>*After that  we have also need to create a container to append every images name that will be processed.*

`touch resized_images_list.md`

>*Then  we use "for" loop to access each images in the directory where the .envrc is located. I include all possible formats for images.*

`for file in *.jpg *.jpeg *.png *.gif *.JPG *.JPEG; do` 

>*We have to store the name of the image in a variable. Basename is used to provide only the file name and extension, if we removed this we will get the full path of the image.*

`filename=$(basename "$file")`

>*To check if the image is in the list of resized images, we use grep. -q to to silence it. *

`if ! grep -q "$filename" "resized_images_list.md"; then`

>*If it return TRUE then we resize the image by using imagemagick.* 

`convert "$file" -resize "600x600>" "img/$filename"`

>*convert is the command for imagemagick then followed by the image to be resized + the process to be done to the image which is resize indicating also the the dimensions + where to save and the filename.* 
>*After that we append the name of the image to our container.*

`echo "$filename" >> "$resized_images_li"`

>*We end the condition by:*

`fi`

`done`

But after several tries, I realized that every time I enter in the directory it will try to create again  the directory "img" and the resized_images_list.md, which should not be because it was already created at the first time it run the script. So I think it is better to check first if the directory "img" and resized_images_list.md file is laready there. We use "if statement"  again for this.

```
if ! -d "img"; then
	mkdir img
else
	echo "The directory is already exists. Skipping write directory."
fi

if ! -f "resized_images_list.md";then
	touch resized_images_list_.md"
else
	echo "The file is already exists. Skipping file creation."
fi
```

It did work but I still received an error message in the terminal like this every time I try to enter in the directory;

>./.envrc:4: -d: command not found
>
>mkdir: cannot create directory ‘img’: File exists
>
>./.envrc:10: -f: command not found
 
My full script will look like this:

```
#!/bin/bash

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
```

### TASKS FOR WEEK 3
- [ ] Tasks from Week 1
- [ ] To automate the creation of my gallery container each location like in Phil.md, Simbach.md, Heidelburg.md so everytime I add new collection it will self generate this markdown file. 

______
