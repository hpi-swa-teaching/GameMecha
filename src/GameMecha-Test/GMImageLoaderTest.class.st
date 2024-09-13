"
This test includes tests for the GMImageLoader.
"
Class {
	#name : #GMImageLoaderTest,
	#superclass : #GMSpecificLoadingTest,
	#category : #'GameMecha-Test',
	#'squeak_changestamp' : 'NK 7/24/2018 15:15'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'NK 7/19/2018 13:49'
}
GMImageLoaderTest class >> exampleFilepath [
	^ GMTestResourceFixtures testImagePathPNG
]

{
	#category : #constants,
	#'squeak_changestamp' : 'NK 7/19/2018 13:49'
}
GMImageLoaderTest class >> exampleResource [
	^ GMTestResourceFixtures squeakPNG
]

{
	#category : #constants,
	#'squeak_changestamp' : 'NK 7/19/2018 13:56'
}
GMImageLoaderTest class >> secondExampleFilepath [
	^ GMTestResourceFixtures testImagePathJPEG
]

{
	#category : #constants,
	#'squeak_changestamp' : 'NK 7/19/2018 14:07'
}
GMImageLoaderTest class >> supportedTypes [
	^ OrderedCollection newFrom: {'jpeg' . 'png'}
]

{
	#category : #constants,
	#'squeak_changestamp' : 'NK 6/10/2018 15:39'
}
GMImageLoaderTest class >> testSize [
	^ 1000 @ 1000
]

{
	#category : #testing,
	#'squeak_changestamp' : 'brh 7/15/2018 09:41'
}
GMImageLoaderTest >> assertRessourceType: aBlock [
	self assert: [aBlock value isForm].
	
]

{
	#category : #running,
	#'squeak_changestamp' : 'brh 7/15/2018 10:35'
}
GMImageLoaderTest >> setUp [
	super setUp.
	self resourceManager: GMImageLoader new.
	GMTestResourceFixtures createImagesOnDisk.
	
]

{
	#category : #'test cases',
	#'squeak_changestamp' : 'NK 7/19/2018 13:54'
}
GMImageLoaderTest >> testGetImageWithSize [
	self resourceManager loadResourceFromDrive: self class exampleFilepath.
	self assert: (self resourceManager at: self class exampleFilepath withSize: self class testSize) extent 
		equals: self class testSize.
]

{
	#category : #'test cases',
	#'squeak_changestamp' : 'NK 7/25/2018 11:43'
}
GMImageLoaderTest >> testStringFromFile [
	self assertRessourceType: [Compiler evaluate: 
		(self resourceManager stringFromFile: self class exampleFilepath)].
]
