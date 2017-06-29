as yet unclassified
testFileSize
	| cache |
	cache := ImageCache newOn: 'HOP'.
	self assert: (cache getSizeFor: 'baum01.jpg') equals: 4031826.
	