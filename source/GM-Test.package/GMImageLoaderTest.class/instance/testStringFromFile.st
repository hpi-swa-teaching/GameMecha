testing
testStringFromFile
	self assertRessourceType: [Compiler evaluate: 
		(self resourceManager stringFromFile: self exampleFile)].