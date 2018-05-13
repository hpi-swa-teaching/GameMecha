as yet unclassified
testPlaySound
	self soundManager
		flushCache;
		loadResourceIntoCache: self soundTest;
		playSound: self soundTest.