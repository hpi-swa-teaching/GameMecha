as yet unclassified
testLazyMorphWithWrongAspectRatio
	|cache|
	cache := ImageCache newOn: 'GMTest/res'.
	cache preloadRecursive: ''.
	self should: [LazyImageMorph newWithImage: 'img/img1.png' from: cache placeHolder: (Color green) bounds: ((50@100) extent: (60@40))]  raise: WrongAspectRatio.