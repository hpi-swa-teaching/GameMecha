"
This is an acceptance test for the GMImageLoader class. It is supposed to be opened like any other morph.
It demonstrates how to load images into the cache and access them through the cache.

To get an explanation how to use the GMImageLoader see initialize.
"
Class {
	#name : #GMImageLoaderAcceptance,
	#superclass : #ImageMorph,
	#category : #'GameMecha-Examples',
	#'squeak_changestamp' : 'NK 7/24/2018 16:09'
}

{
	#category : #initialization,
	#'squeak_changestamp' : 'NK 7/25/2018 19:46'
}
GMImageLoaderAcceptance >> initialize [
	super initialize.
	
	"This line is only important to keeps this test working without the corresponding images on disk.
	It is not part of the library api and not needed for regular use.
	It creates the necessary files on disk from the image".
	GMTestResourceFixtures createImagesOnDisk.
	
	self image: (GMImageLoader new 
		"The GMImageLoader can load all or single files out of a given folder into the cache.
		Files are cached with their relative pathname as string as their key(ex: 'folder\picture.wav')
		It is possible to provide a custom naming function to the loadAll mechanism as a block.
		For an example look at the defaultNameFunction of GMResourceLoader.
		If you want to load singles resource files and give them specific names use:
			loadResourceFromDrive: aFilename withName: aName"
		loadAllResourcesFromDrive: GMTestResourceFixtures testResourceFolder;
		"Finally we can access a specific cached Form by its key."
		at: GMTestResourceFixtures testImagePathPNG).
	
	"This line again is only important to keep this test free of lasting side effects.
	It is not part of the library api.
	We clean the previously stored file from the filesystem to clean up behind us."
	GMTestResourceFixtures clearResourcesOnDisk.
	
	self abandon.
]
