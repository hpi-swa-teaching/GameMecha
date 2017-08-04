as yet unclassified
testRepeatedForm
	|bgForm biggerForm offsetBiggerForm|

	bgForm := Form makeStar.

	biggerForm := (bgForm repeatedToExtent: 100@100).
	offsetBiggerForm := (bgForm repeatedToExtent: 100@100 withOrigin: 30@(-30)).
	
	self assert: (biggerForm extent = (100@100)).
	self assert: (offsetBiggerForm extent = (100@100)).
	
	self deny: (biggerForm = offsetBiggerForm).
	self assert: ((biggerForm contentsOfArea: (0 asPoint extent: 50 asPoint)) bits) equals: bgForm bits.
	self deny: (((offsetBiggerForm contentsOfArea: (0 asPoint extent: 50 asPoint)) bits) = bgForm bits).