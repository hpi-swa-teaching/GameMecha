as yet unclassified
testLazyMorph
	self testLazyMorph: (LazyImageMorph newWithImage: 'GMTest/res/img/img1.png' placeHolder: Color red bounds: (50@100 extent: 70@40)).
	self testLazyMorph: (LazyImageMorph newWithImage: 'GMTest/res/img/sub/img2.png').