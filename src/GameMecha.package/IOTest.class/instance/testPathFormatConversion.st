as yet unclassified
testPathFormatConversion
	|cache|
	cache := ImageCache newOn: 'GMTest/res'.
	
	self should: [cache getTexture: 'nonexistent_image.ending'] raise: ImageNotFound.
	self assert: (cache getTexture: 'img/img1.png') isNil not.
	
	self assert: (cache getTexture: 'img/img1.png') identical: (cache getTexture: 'img\img1.png').
	
	self deny: (cache getTexture: 'img\img1.png') == (cache getTexture: 'img\sub/img2.png').