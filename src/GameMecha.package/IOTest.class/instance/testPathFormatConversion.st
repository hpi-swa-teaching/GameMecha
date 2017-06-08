as yet unclassified
testPathFormatConversion
	|cache|
	cache := ImageCache newOn: 'HOP/res'.
	
	self should: [cache getTexture: 'img/breaking1NONEXISTENT.png'] raise: ImageNotFound.
	self assert: (cache getTexture: 'img/breaking1.png') isNil not.
	
	self assert: (cache getTexture: 'img/breaking2.png') identical: (cache getTexture: 'img\breaking2.png').
	
	self deny: (cache getTexture: 'img\breaking1.png') == (cache getTexture: 'img\breaking2.png').