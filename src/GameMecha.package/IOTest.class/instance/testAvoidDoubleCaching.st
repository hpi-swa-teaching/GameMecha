as yet unclassified
testAvoidDoubleCaching
	|cache m1 m2|
	cache := ImageCache newOn: 'GMTest/res'.
	
	
	m1 := LazyImageMorph newWithImage: 'img/img1.png' from: cache.
	m2 := LazyImageMorph newWithImage: 'img/img1.png' from: cache.
	
	self assert: cache isCurrentlyLoading.
	self assert: cache cachedElements size = 0.
	
	cache finishLoading.
	
	self assert: m1 isImageMorph.
	self assert: m2 isImageMorph.
	
	self assert: cache cachedElements size = 1.