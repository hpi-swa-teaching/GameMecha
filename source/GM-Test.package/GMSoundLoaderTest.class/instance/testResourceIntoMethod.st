as yet unclassified
testResourceIntoMethod
	self should: [self class resourceIntoMethodTarget] raise: Error.
	self resourceManager
		loadResourceIntoMethod: #resourceIntoMethodTarget 
		ofClass: self class 
		fromFile: self testFile.
	self assert: [self class class canUnderstand: #resourceIntoMethodTarget].