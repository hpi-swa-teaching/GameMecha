as yet unclassified
testLoadAll
	super testLoadAll.
	self resourceManager
		playSound: GMTestResourceFixtures testSoundPathAIFF;
		playSound: GMTestResourceFixtures testSoundPathWAV.