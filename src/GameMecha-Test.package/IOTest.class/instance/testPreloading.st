as yet unclassified
testPreloading
	|cache|
	cache := ImageCache newOn: 'GMTest/res'.
	
	self deny: (cache isLoaded: 'img/img1.png').
	cache preload: 'img'.
	self assert: (cache isLoaded: 'img/img1.png').
	self deny: (cache isLoaded: 'img/sub/img2.png').
	cache preloadRecursive: 'img'.
	self assert: (cache isLoaded: 'img/sub/img2.png').