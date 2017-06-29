as yet unclassified
testFileSize
	| cache |
	cache := ImageCache newOn: 'GMTest'.
	self assert: (cache getSizeFor: 'smile.png') equals: 10382.