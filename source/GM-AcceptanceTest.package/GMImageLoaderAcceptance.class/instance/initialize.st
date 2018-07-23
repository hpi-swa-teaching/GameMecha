initialization
initialize
	super initialize.
	
	"This line is only important to keeps this test working even without the corresponding images
	in the Resources folder (we store the file out of a Method in the file system). 
	This is not necessary when you want to use our library in the regular case and all your files 
	are already stored on disk."
	GMTestResourceFixtures createImagesOnDisk.
	
	self image: (GMImageLoader new 
		"Our GMImageManager can load all files out of a given folder into the cache.
		Files are cached with their full name as string as their key(ex: 'picture.png'), relative folder directories are ignored.
		If you want to load singles resource files and give them specific names use:
			loadResourceIntoCache: filename withName: nameOfKey"
		loadAllResourcesFromDrive: GMTestResourceFixtures testResourceFolder;
		"Finally we can access a specific cached Form by its key."
		at: GMTestResourceFixtures testImagePathPNG).
	
	"This line again is only important to keep this test free of lasting side effects.
	We clean the previously stored file from the filesystem to clean up behind us. 
	This step is not necessary when you want to use our library in the regular case and all your files 
	are already stored on disk."
	GMTestResourceFixtures clearResourcesOnDisk.
	
	self abandon.