as yet unclassified
testResourceIntoMethod
	self should: [self resourceIntoMethodTarget] raise: Error.
	GMResourceLocator soundManager
		loadResourceIntoMethod: #resourceIntoMethodTarget 
		ofClass: self class 
		fromFile: GMTestResourceFixtures testSoundPathWAV.
	self assert: [self class class canUnderstand: #resourceIntoMethodTarget].