as yet unclassified
testPlayNamedSound
	self soundManager
		flushCache; 
		loadResourceIntoCache: self soundTest withName: #patrick;
		playSound: #patrick.