as yet unclassified
testFileSize
	| cache |
	cache := ImageCache newOn: 'HOP'.
	self assert: (cache getSizeFor: 'baum1.jpg') equals: 3800000.