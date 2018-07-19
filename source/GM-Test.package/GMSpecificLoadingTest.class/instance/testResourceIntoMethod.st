as yet unclassified
testResourceIntoMethod
	self should: [self class resourceIntoMethodTarget] raise: Error.
	self resourceManager
		storeResourceInMethod: #resourceIntoMethodTarget 
		inInstance: self class 
		fromFile: self class exampleFilepath.
	self assert: [self class class canUnderstand: #resourceIntoMethodTarget].
	self assertRessourceType: [self class resourceIntoMethodTarget].