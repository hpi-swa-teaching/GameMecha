"
This test includes tests for the GMAnimatedImageLoader.
"
Class {
	#name : #GMAnimatedImageLoaderTest,
	#superclass : #GMSpecificLoadingTest,
	#category : #'GameMecha-Test',
	#'squeak_changestamp' : 'NK 7/24/2018 15:15'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'NK 7/19/2018 13:50'
}
GMAnimatedImageLoaderTest class >> exampleFilepath [
	^ GMTestResourceFixtures testImagePathGIF
]

{
	#category : #constants,
	#'squeak_changestamp' : 'NK 7/19/2018 13:40'
}
GMAnimatedImageLoaderTest class >> exampleResource [
	^ (GMTestResourceFixtures squeakGIFReadWriter)
]

{
	#category : #constants,
	#'squeak_changestamp' : 'NK 7/25/2018 12:06'
}
GMAnimatedImageLoaderTest class >> secondExampleFilepath [ 
	^ GMTestResourceFixtures testImagePathGIF2
]

{
	#category : #constants,
	#'squeak_changestamp' : 'NK 7/19/2018 14:05'
}
GMAnimatedImageLoaderTest class >> supportedTypes [
	^ OrderedCollection newFrom: {'gif'}
]

{
	#category : #testing,
	#'squeak_changestamp' : 'brh 7/15/2018 09:40'
}
GMAnimatedImageLoaderTest >> assertRessourceType: aBlock [
	self assert: [aBlock value class wantsToHandleGIFs].
]

{
	#category : #running,
	#'squeak_changestamp' : 'brh 7/4/2018 11:09'
}
GMAnimatedImageLoaderTest >> setUp [
	super setUp.
	self resourceManager: GMAnimatedImageLoader new.
	GMTestResourceFixtures createAnimatedImagesOnDisk.
	
]

{
	#category : #'test cases',
	#'squeak_changestamp' : 'NK 7/25/2018 11:43'
}
GMAnimatedImageLoaderTest >> testStringFromFile [
	self assertRessourceType: [Compiler evaluate: 
		(self resourceManager stringFromFile: self class exampleFilepath)].
]
