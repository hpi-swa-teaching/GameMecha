as yet unclassified
initialize
	super initialize.
	self image: (GMImageLoader new 
		"Our GMImageManager can load all files out of a given folder into the cache.
		Files are cached with their full name as string as their key(ex: 'picture.png'), relative folder directories are ignored.
		If you want to load singles resource files and give them specific names use:
			loadResourceIntoCache: filename withName: nameOfKey"
		loadAllResourcesFromDrive: GMTestResourceFixtures testResourceFolder;
		"Finally we can access a specific cached Form by its key."
		at: GMTestResourceFixtures testImagePathPNG).
	self abandon.