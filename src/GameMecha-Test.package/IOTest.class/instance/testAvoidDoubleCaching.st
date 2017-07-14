as yet unclassified
testAvoidDoubleCaching
	|m1 m2|
	
	Imports default clear.
	m1 := LazyImageMorph newWithImage: 'GMTest/res/img/img1.png'.
	m2 := LazyImageMorph newWithImage: 'GMTest/res/img/img1.png'.
	
	self assert: Imports default isCurrentlyLoading.
	self assert: Imports default cachedElements size = 0.
	
	Imports default finishLoading. "wait for it to finish"
	
	self assert: m1 isImageMorph.
	self assert: m2 isImageMorph.
	
	self assert: Imports default cachedElements size = 1.