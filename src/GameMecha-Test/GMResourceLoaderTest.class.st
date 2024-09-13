"
This test includes basic tests for the GMResourceLoader.
"
Class {
	#name : #GMResourceLoaderTest,
	#superclass : #GMResourceLoadingTest,
	#category : #'GameMecha-Test',
	#'squeak_changestamp' : 'NK 7/24/2018 15:15'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'NK 7/19/2018 13:54'
}
GMResourceLoaderTest class >> exampleFilepath [
	^ GMTestResourceFixtures testTextPath
]

{
	#category : #running,
	#'squeak_changestamp' : 'brh 7/15/2018 11:18'
}
GMResourceLoaderTest >> setUp [
	super setUp.
	self resourceManager: GMResourceLoader new.
]

{
	#category : #'test cases',
	#'squeak_changestamp' : 'NK 7/23/2018 16:17'
}
GMResourceLoaderTest >> testFlushCache [
	self resourceManager cache: ((Dictionary new) at: 'test' put: 'test').
	self resourceManager flushCache.
	self assert: [self resourceManager cache isEmpty].
]

{
	#category : #'test cases',
	#'squeak_changestamp' : 'brh 7/24/2018 20:56'
}
GMResourceLoaderTest >> testLoadFileIntoMethod [
	GMTestResourceFixtures createTextOnDisk.
	self resourceManager 
		storeEncodedFileInMethod: #resourceIntoMethodTarget 
		inInstance: self class 
		fromFile: self class exampleFilepath.
	self assert: (self class resourceIntoMethodTarget base64Decoded) 
		equals: GMTestResourceFixtures testText.
]
