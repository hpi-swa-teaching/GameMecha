"
This abstract test provides functionality for testing resource loading without lasting side effects.
"
Class {
	#name : #GMResourceLoadingTest,
	#superclass : #TestCase,
	#instVars : [
		'resourceManager'
	],
	#category : #'GameMecha-Test',
	#'squeak_changestamp' : 'NK 7/24/2018 15:10'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'NK 7/19/2018 13:53'
}
GMResourceLoadingTest class >> exampleFilepath [
	self subclassResponsibility.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'brh 7/15/2018 11:23'
}
GMResourceLoadingTest class >> isAbstract [
	^ super isAbstract or: [self name = #GMResourceLoadingTest]
]

{
	#category : #'resource loading',
	#'squeak_changestamp' : 'brh 7/15/2018 11:25'
}
GMResourceLoadingTest >> loadAll [
	self resourceManager loadAllResourcesFromDrive: GMTestResourceFixtures testResourceFolder.
]

{
	#category : #'resource loading',
	#'squeak_changestamp' : 'brh 7/15/2018 11:25'
}
GMResourceLoadingTest >> loadAllWithoutEndings [
	self resourceManager loadAllResourcesFromDriveWithoutEndings: GMTestResourceFixtures testResourceFolder.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'brh 7/15/2018 11:15'
}
GMResourceLoadingTest >> resourceManager [
	^ resourceManager
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'brh 7/15/2018 11:15'
}
GMResourceLoadingTest >> resourceManager: anObject [
	resourceManager := anObject
]

{
	#category : #running,
	#'squeak_changestamp' : 'brh 7/15/2018 11:18'
}
GMResourceLoadingTest >> setUp [
	GMTestResourceFixtures clearResourcesOnDisk.
]

{
	#category : #running,
	#'squeak_changestamp' : 'brh 7/15/2018 11:15'
}
GMResourceLoadingTest >> tearDown [ 
	GMTestResourceFixtures clearResourcesOnDisk.
	self class class removeSelector: #resourceIntoMethodTarget.
]
