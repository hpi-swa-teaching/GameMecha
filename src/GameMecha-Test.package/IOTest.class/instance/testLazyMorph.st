as yet unclassified
testLazyMorph
	|cache|
	cache := ImageCache newOn: 'GMTest/res'.
	self testLazyMorph: (LazyImageMorph newWithImage: 'img/img1.png' from: cache placeHolder: Color red bounds: (50@100 extent: 70@40)) withCache: cache.
	self testLazyMorph: (LazyImageMorph newWithImage: 'img/sub/img2.png' from: cache) withCache: cache.