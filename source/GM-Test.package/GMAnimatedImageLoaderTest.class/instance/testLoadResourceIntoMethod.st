as yet unclassified
testLoadResourceIntoMethod
	self should: [self resourceIntoMethodTarget] raise: Error.
	self resourceManager
		storeResourceInMethod: #resourceIntoMethodTarget
		inInstance: self class
		fromFile: self exampleFile.
	self assert: [self class class canUnderstand: #resourceIntoMethodTarget].
	self assertRessourceType: [self class resourceIntoMethodTarget].