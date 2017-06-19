as yet unclassified
testLazyMorph
	|cache lazyMorph prevBounds postBounds|
	cache := ImageCache newOn: 'GMTest/res'.
	lazyMorph := LazyImageMorph newWithImage: 'img/img1.png' from: cache placeHolder: (Color green) bounds: ((50@100) extent: (80@40)).
	self assert: cache isCurrentlyLoading.
	prevBounds := lazyMorph bounds.
	
	cache finishLoading.
	
	self deny: cache isCurrentlyLoading.
	postBounds := lazyMorph bounds.
	
	self assert: postBounds equals: prevBounds. 