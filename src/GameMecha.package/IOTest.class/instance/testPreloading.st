as yet unclassified
testPreloading
	|cache|
	cache := ImageCache newOn: rootDirectoryPath,  '/res'.
	
	self deny: (cache isLoaded: 'img/img1.png').
	cache preloadFolder: 'img'.
	self assert: (cache isLoaded: 'img/img1.png').
	self deny: (cache isLoaded: 'img/sub/sub/img2.png').
	cache preload: 'img/sub/sub/'.
	self assert: (cache isLoaded: 'img/sub/sub/img3.png').
	self deny: (cache isLoaded: 'img/sub/img2.png').
	cache preload.
	self assert: (cache isLoaded: 'img/sub/img2.png').