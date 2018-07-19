as yet unclassified
testLoadAll
	self loadAll.
	self assertRessourceType: [self resourceManager at: self class exampleFilepath].
	self assertRessourceType: [self resourceManager at: self class secondExampleFilepath].