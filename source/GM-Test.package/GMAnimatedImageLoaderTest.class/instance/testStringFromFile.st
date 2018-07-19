test cases
testStringFromFile
	self flag: #maybeTODO.
	self assertRessourceType: [Compiler evaluate: 
		(self resourceManager stringFromFile: self class exampleFilepath)].