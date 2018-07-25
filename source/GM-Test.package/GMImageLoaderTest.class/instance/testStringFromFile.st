test cases
testStringFromFile
	self assertRessourceType: [Compiler evaluate: 
		(self resourceManager stringFromFile: self class exampleFilepath)].