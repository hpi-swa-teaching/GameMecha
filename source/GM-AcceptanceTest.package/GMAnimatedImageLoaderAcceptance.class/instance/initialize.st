initialization
initialize
	| animatedImageLoader |
	animatedImageLoader := GMAnimatedImageLoader new.
	super initialize.
	
	"This line is only important to keeps this test working even without the corresponding images
	in the Resources folder (we store the file out of a Method in the file system). 
	This is not necessary when you want to use our library in the regular case and all your files 
	are already stored on disk."
	GMTestResourceFixtures createAnimatedImagesOnDisk.
	
	"GMAnimatedImageLoader can load all files out of a given folder into the cache.
	Files are cached depending on which method you call, here they are stored with their whole path.
	If you want to load singles resource files and give them specific names use:
		loadResourceFromDriveIntoCache: filename withName: nameOfKey"
	animatedImageLoader loadAllResourcesFromDrive: GMTestResourceFixtures testResourceFolder.
	
	"Finally we can access a specific cached AnimatedGIFReadWriter by its key."
	"AnimatedImageMorphs can be initialized with this reader."
	self fromReader: (animatedImageLoader at: GMTestResourceFixtures testImagePathGIF).
	
	
	"This line again is only important to keep this test free of lasting side effects.
	We clean the previously stored file from the filesystem to clean up behind us. 
	This step is not necessary when you want to use our library in the regular case and all your files 
	are already stored on disk."
	GMTestResourceFixtures clearResourcesOnDisk.
	
	self abandon.