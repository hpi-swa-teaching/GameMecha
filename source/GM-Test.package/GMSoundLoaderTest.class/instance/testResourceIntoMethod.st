as yet unclassified
testResourceIntoMethod
	self should: [self resourceIntoMethodTarget] raise: Error.
	self resourceManager
		loadResourceIntoMethod: #resourceIntoMethodTarget 
		ofClass: self class 
		fromFile: GMTestResourceFixtures testSoundPathWAV.
	self assert: [self class class canUnderstand: #resourceIntoMethodTarget].