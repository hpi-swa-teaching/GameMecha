as yet unclassified
initialize
	super initialize.
	"GMSoundManager is a singleton, so we can access it globally."
	self image: (GMImageManager instance 
		"Our GMSoundManager can load all files out of a given folder into the cache.
		Files are cached with their full name as string as their key(ex: 'picture.png'), relative folder directories are ignored.
		If you want to load singles resource files and give them specific names use:
			loadResourceIntoCache: filename withName: nameOfKey"
		loadAllResourcesFrom: TestResourceFixtures testResourceFolder;
		"Finally we can access a specific cached Form by its key."
		getImageForm: TestResourceFixtures testImageNamePNG).
	self abandon.