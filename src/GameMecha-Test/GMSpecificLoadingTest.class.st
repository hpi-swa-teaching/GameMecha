"
This abstract test defines template tests for the specific resource loading functionality and provides helper functions.
"
Class {
	#name : #GMSpecificLoadingTest,
	#superclass : #GMResourceLoadingTest,
	#category : #'GameMecha-Test',
	#'squeak_changestamp' : 'NK 7/24/2018 15:13'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'NK 7/19/2018 13:39'
}
GMSpecificLoadingTest class >> exampleResource [
	self subclassResponsibility.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'NK 7/19/2018 12:10'
}
GMSpecificLoadingTest class >> isAbstract [
	^ super isAbstract or: [self name = #GMSpecificLoadingTest]
]

{
	#category : #constants,
	#'squeak_changestamp' : 'NK 7/19/2018 13:52'
}
GMSpecificLoadingTest class >> secondExampleFilepath [ 
	self subclassResponsibility.
]

{
	#category : #constants,
	#'squeak_changestamp' : 'NK 7/19/2018 14:06'
}
GMSpecificLoadingTest class >> supportedTypes [
	self subclassResponsibility
]

{
	#category : #testing,
	#'squeak_changestamp' : 'NK 7/23/2018 16:25'
}
GMSpecificLoadingTest >> assertEntryIsCorrect: aString [
	self assert: [self resourceManager cache includesKey: aString].
	self assertRessourceType: [self resourceManager at: aString].
]

{
	#category : #testing,
	#'squeak_changestamp' : 'NK 7/19/2018 12:14'
}
GMSpecificLoadingTest >> assertRessourceType: aBlock [
	self subclassResponsibility.
]

{
	#category : #'test cases',
	#'squeak_changestamp' : 'NK 7/23/2018 16:25'
}
GMSpecificLoadingTest >> testLoadAll [
	self 
		loadAll;
		assertEntryIsCorrect: self class exampleFilepath;
		assertEntryIsCorrect: self class secondExampleFilepath.
]

{
	#category : #'test cases',
	#'squeak_changestamp' : 'NK 7/23/2018 16:25'
}
GMSpecificLoadingTest >> testLoadAllWithoutEndings [
	self loadAllWithoutEndings.
	self assertEntryIsCorrect: GMTestResourceFixtures testResourceFolder, GMTestResourceFixtures fileName.
]

{
	#category : #'test cases',
	#'squeak_changestamp' : 'NK 7/23/2018 16:32'
}
GMSpecificLoadingTest >> testLoadResourceIntoCache [
	self resourceManager loadResourceFromObject: self class exampleResource withName: self class exampleFilepath.
	self assertEntryIsCorrect: self class exampleFilepath.
]

{
	#category : #'test cases',
	#'squeak_changestamp' : 'NK 7/23/2018 16:36'
}
GMSpecificLoadingTest >> testLoadSingleResource [
	self deny: [self resourceManager cache includesKey: self class exampleFilepath].
	self resourceManager loadResourceFromDrive: self class exampleFilepath.
	self assertEntryIsCorrect: self class exampleFilepath.
]

{
	#category : #'test cases',
	#'squeak_changestamp' : 'NK 7/23/2018 16:36'
}
GMSpecificLoadingTest >> testLoadSingleResourceWithName [
	self deny: [self resourceManager cache includesKey: GMTestResourceFixtures fileName].
	self resourceManager loadResourceFromDrive: self class exampleFilepath withName: GMTestResourceFixtures fileName.
	self assertEntryIsCorrect: GMTestResourceFixtures fileName.
]

{
	#category : #'test cases',
	#'squeak_changestamp' : 'NK 7/19/2018 13:55'
}
GMSpecificLoadingTest >> testResourceIntoMethod [
	self should: [self class resourceIntoMethodTarget] raise: Error.
	self resourceManager
		storeResourceInMethod: #resourceIntoMethodTarget 
		inInstance: self class 
		fromFile: self class exampleFilepath.
	self assert: [self class class canUnderstand: #resourceIntoMethodTarget].
	self assertRessourceType: [self class resourceIntoMethodTarget].
]

{
	#category : #'test cases',
	#'squeak_changestamp' : 'NK 7/23/2018 16:37'
}
GMSpecificLoadingTest >> testSupportedTypes [
	self class supportedTypes do: [:type | 
		self assert: [self resourceManager isSupportedType: type] description: (type, ' should be supported')].
]
