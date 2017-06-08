as yet unclassified
testPreloading
	|cache|
	cache := ImageCache newOn: 'HOP/res'.
	
	self deny: (cache isLoaded: 'img/breaking1.png').
	cache preload: 'img'.
	self assert: (cache isLoaded: 'img/breaking1.png').
	self deny: (cache isLoaded: 'img/ice/ice01.png').
	cache preloadRecursive: 'img'.
	self assert: (cache isLoaded: 'img/ice/ice01.png').