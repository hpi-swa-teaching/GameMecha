initialization
initialize
	| animatedImageLoader |
	animatedImageLoader := GMAnimatedImageLoader new.
	super initialize.
	
	"This line is only important to keeps this test working without the corresponding images on disk.
	It is not part of the library api and not needed for regular use.
	It creates the necessary files on disk from the image".
	GMTestResourceFixtures createAnimatedImagesOnDisk.
	
	"The GMAnimatedImageLoader can load all or single files out of a given folder into the cache.
	Files are cached with their relative pathname as string as their key(ex: 'folder\picture.wav')
	It is possible to provide a custom naming function to the loadAll mechanism as a block.
	For an example look at the defaultNameFunction of GMResourceLoader.
	If you want to load singles resource files and give them specific names use:
		loadResourceFromDrive: aFilename withName: aName"
	animatedImageLoader loadAllResourcesFromDrive: GMTestResourceFixtures testResourceFolder.
	
	"Finally we can access a specific cached AnimatedGIFReadWriter by its key."
	"AnimatedImageMorphs can be initialized with this reader."
	self fromReader: (animatedImageLoader at: GMTestResourceFixtures testImagePathGIF).
	
	"This line again is only important to keep this test free of lasting side effects.
	It is not part of the library api.
	We clean the previously stored file from the filesystem to clean up behind us."
	GMTestResourceFixtures clearResourcesOnDisk.
	
	self abandon.