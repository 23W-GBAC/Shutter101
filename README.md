

##  :wave: Hello there, I'm **Jayson**.

:school: I'm a first year Health Informatics  student at THD European Campus Rottal-Inn. I have been learning programming languages like Python and R. I have basic understanding with HTML, CSS and Javascript. 

Embark on a visual journey with my blog, where captivating photos come to life. Immerse yourself in the art of photography as I not only showcase my stunning captures but also unveil the secrets behind mastering the camera. Join me in exploring innovative techniques while seamlessly integrating the power of Linux scripting to automate and enhance the photographic process. Elevate your skills and discover the intersection of creativity and technology.

Take a visual journey through my blog and discover the beauty of Germany and beyond. From charming villages to stunning landscapes, each photo captures the essence of these places. Join me in exploring iconic landmarks and hidden gems, and let the images inspire your wanderlust. Whether you're into historic castles or serene natural vistas, this blog is a window to the world's most beautiful destinations, inviting you to dream, explore, and appreciate the extraordinary in the ordinary. 

And I invite you to help me on how can I speed up the process from getting the images from my device into submitting it to my repository. Setting my github page to a photo gallery like website.  But before that let's ask our friend Chat GPT to give us or educate us on what are the necessary informations to be considered when taking photos in your device specially in manual mode.

_____

The **exposure triangle** is a fundamental concept in photography that explains the relationship between three key elements that determine the exposure of an image: aperture, shutter speed, and ISO. Understanding the exposure triangle is crucial for achieving well-exposed and visually appealing photographs.

<ol>
	<li>Aperture
		<ul>
			<li>Aperture refers to the size of the opening in the lens through which light enters the camera.</li>
			<li>A larger aperture (smaller f-number, e.g., f/2.8) allows more light to enter, resulting in a brighter image. A smaller aperture (larger f-number, e.g., f/16) reduces the amount of light, resulting in a darker image.</li>
			<li>Aperture also influences the depth of field. A wide aperture (e.g., f/2.8) creates a shallow depth of field, isolating the subject from the background. A narrow aperture (e.g., f/16) increases the depth of field, keeping more of the scene in focus.</li>
		</ul>
	</li>
	<li>Shutter Speed
		<ul>
			<li> Shutter speed refers to the amount of time the camera's shutter remains open, exposing the camera sensor to light.</li>
			<li>A faster shutter speed (e.g., 1/1000s) allows less light and is suitable for freezing fast-moving subjects. A slower shutter speed (e.g., 1/30s) allows more light and is ideal for capturing motion or in low-light conditions.</li>
			<li>Shutter speed also affects the perception of motion. Faster shutter speeds freeze action, while slower speeds may introduce intentional motion blur.</li>
		</ul>
	</li>
	<li>ISO(Sensitivity to Light)
 		<ul>
			<li>ISO measures the sensitivity of the camera sensor to light.</li>
			<li>Higher ISO values (e.g., ISO 800, 1600) make the sensor more sensitive to light, resulting in a brighter image. Lower ISO values (e.g., ISO 100, 200) reduce sensitivity, resulting in a darker image.</li>
			<li>Increasing ISO introduces digital noise, affecting image quality. Therefore, it's essential to find a balance between ISO and other exposure settings.</li>
		</ul>
	</li>
</ol>

#### Balancing the Exposure Triangle
<ul>
	<li>Achieving the correct exposure involves finding the right combination of aperture, shutter speed, and ISO for a given lighting situation.</li>
	<li>Adjusting one element may require compensating with the others to maintain a balanced exposure.</li>
	<li>The exposure triangle allows photographers to creatively control factors such as depth of field, motion blur, and image noise.</li>
</ul>

Example: 

<ul>
	<li>For a well-lit scene, you might use a lower ISO (e.g., ISO 100), a moderate aperture (e.g., f/8), and a shutter speed fast enough to avoid camera shake or motion blur.</li>
	<li>In low-light conditions, you may increase ISO, use a wider aperture, or employ a slower shutter speed.</li>
</ul>

>Mastering the exposure triangle empowers photographers to adapt to various shooting conditions and achieve the desired creative effects in their images.
>

______

Let me show you some of my work which are taken from my home country **Philippines** and I will provide my camera setting to each photos  on how I setup my exposure triangle. 

>All my images will be located at my repository with a folder  name **photos**.

<link rel="stylesheet" href="/Test101/css/photo-tile.css">
<div class="gallery">
	<figure>	
		<img src="/Test101/photos/photo1.jpg" alt="Photo1">
		<figcaption>Canon m3, EF-M 22mm, ISO400, 6-sec, f/4.0</figcaption>
	</figure>
	<figure>		
		<img src="/Test101/photos/photo2.jpg" alt="Photo2">
		<figcaption>Canon m3, Tamron 18-200mm, ISO100, 28mm, 1/80-sec, f/5.0</figcaption>
	</figure>
  	<figure>	
		<img src="/Test101/photos/photo3.jpg" alt="Photo3">
		<figcaption>Canon m3, Tamron 18-200mm, 18mm, ISO640,  1/800-sec, f/5.6</figcaption>
	</figure>
	<figure>	
		<img src="/Test101/photos/photo4.jpg" alt="Photo4">
		<figcaption>Canon m3, Tamron 18-200mm, ISO200, 100mm, 1/500-sec, f/11.0</figcaption>
  	</figure>
	<figure>	
		<img src="/Test101/photos/photo5.jpg" alt="Photo5">
		<figcaption>Canon m3, Tamron 18-200mm, 28mm, 1/80-sec, f/5.0</figcaption>
	</figure>
	<figure>	
		<img src="/Test101/photos/photo6.jpg" alt="Photo6">
		<figcaption>Canon m3, EF-M 22mm, ISO1600, 22mm, 20-sec, f/2.8</figcaption>
	</figure>
	<figure>	
		<img src="/Test101/photos/photo7.JPG" alt="Photo7">
		<figcaption>Canon M3, EF 50mm, ISO100, 50mm, 1/250-sec, f/4.0</figcaption>
	</figure> 
	<figure>	
		<img src="/Test101/photos/photo8.jpg" alt="Photo8">
		<figcaption>Canon M3, Tamron 18-200mm, ISO1250, 18mm, 1/500-sec, f/16.0</figcaption>
	</figure> 
	<figure>	
		<img src="/Test101/photos/photo9.jpg" alt="Photo9">
		<figcaption>Canon M3, EF-M 22mm, ISO100, 22mm, 1/250-sec, f/11</figcaption>
	</figure> 

</div>

______

During the creation of this first part of my blog, I would like to point out the repetitive tasks that I did and some problems that I encounter. And let us figure out on how can we automate this tasks. 

<ol>
	<li>First problem is Github page is not design to cater such content where large size of files are used. You can see that most of my images are quite large in size. I am thinking if I could use third party packages which use uses CLI. My goal is that every time I add images to certain folder, it will automatically compress the images to the appropriate size.
Or before pushing any images to the repositories we could run a script to compress the images.</li>
	<li>Adding description to all of the photos are time consuming, I have to look first for each properties of the images then add it to the description tag. I already have an idea on how to approach this problem. All of my images contains metadata. What does it mean?
		<ul>
			<li>**photo metadata** refers to the information embedded within a digital photograph that provides details about the image. This metadata includes various properties and settings related to the creation of the photo.</li>
		</ul>
		Knowing that, I could extract metadata of each images and list it down to a JSON file or in a Markdown file.
	</li>
	<li>Another one is automatic renaming  of every images for easy plugin in the markdown file </li>
	<li>Lastly, how could I automatically call out the description of each photos in a JSON or Markdoen file. So that I don't need of manually typing it in my README.md?

</ol>


______

- [ ] For the next update of this blog, I will add addtional places that I visited here in Germany and share any random facts about the ciy. 
- [ ] I will do further study on how to solve my problems listed above. And share it to the blog. 
- [ ] If someone wnats to share their capture, feel free to add. But the question is how?
