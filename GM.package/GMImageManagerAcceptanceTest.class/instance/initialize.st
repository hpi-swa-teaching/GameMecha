as yet unclassified
initialize
	super initialize.
	"GMSoundManager is a singleton, so we can access it globally. 
	If you are a Swa student and don't know what a singleton is you maybe should start visiting the lectures."
	self image: (GMImageManager instance 
		"Our GMSoundManager can load all files out of a given folder into the cache.
		 After that they are cached and can be accessed via their names.
		If you want to load singles resource files and give them specific names usw: loadResourceIntoCache: filename withName: nameInCache"
		loadAllResourcesFrom: TestResourceFixtures testResourceFolder;
		"Finally we can access a specific cached ImageForm by its name."
		getImageForm: TestResourceFixtures testImageNamePNG).
	self abandon.