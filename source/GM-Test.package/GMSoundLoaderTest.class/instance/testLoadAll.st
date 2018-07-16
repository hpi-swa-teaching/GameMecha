test cases
testLoadAll
	self loadAll.
	self assertRessourceType: [self resourceManager at: GMTestResourceFixtures testSoundPathAIFF].
	self assertRessourceType: [self resourceManager at: GMTestResourceFixtures testSoundPathWAV].