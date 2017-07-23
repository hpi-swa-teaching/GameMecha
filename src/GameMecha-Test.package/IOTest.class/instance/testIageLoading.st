as yet unclassified
testIageLoading
	
	self should: [Imports default get: 'GMTest/res/nonexistent_image.png'] raise: ImageNotFound.
	self assert: (Imports default get: 'GMTest/res/img/img1.png') notNil.