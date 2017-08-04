as yet unclassified
testLazyMorph
	| placeholderColor wantedBounds |
	self testLazyMorph: (LazyImageMorph newWithImage: 'GMTest/res/img/sub/img2.png').
	
	wantedBounds := (50@100 extent: 70@40).
	self testLazyMorph: (LazyImageMorph newWithImage: 'GMTest/res/img/img1.png' bounds: wantedBounds) withBounds: wantedBounds.
	
	wantedBounds := (50@100 extent: 200@100).
	placeholderColor := Color green.
	self testLazyMorph: (LazyImageMorph newWithImage: 'GMTest/res/img/img1.png' bounds: wantedBounds placeholder: placeholderColor) withPlaceholderColor: placeholderColor.