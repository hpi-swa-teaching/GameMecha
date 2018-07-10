as yet unclassified
initialize
	| animatedImageLoader |
	animatedImageLoader := GMAnimatedImageLoader new.
	super initialize.
	
	"GMAnimatedImageLoader can load all files out of a given folder into the cache.
	Files are cached depending on which method you call, here they are stored with their whole path.
	If you want to load singles resource files and give them specific names use:
		loadResourceFromDriveIntoCache: filename withName: nameOfKey"
	GMTestResourceFixtures createAnimatedImagesOnDisk.
	animatedImageLoader loadAllResourcesFrom: GMTestResourceFixtures testResourceFolder.
	
	"Finally we can access a specific cached AnimatedGIFReadWriter by its key."
	"AnimatedImageMorphs can be initialized with this reader."
	self fromReader: (animatedImageLoader at: GMTestResourceFixtures testImagePathGIF).
	GMTestResourceFixtures clearResourcesOnDisk.
	
	self abandon.