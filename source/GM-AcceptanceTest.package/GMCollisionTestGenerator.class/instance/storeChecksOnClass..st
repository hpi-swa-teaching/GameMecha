as yet unclassified
storeChecksOnClass: aClass
	self cleanupClass: aClass.
	aClass compile: (String streamContents: [:str |
		str nextPutAll: 'collisionSelectors' , GMCollisionTestGeneratorMorphContainer newlineWithIndentation , '^ {'.
		self collisionChecks
			do: [:check |
				str nextPutAll: '#testAcceptance'. check hash storeOn: str. str nextPut: $..
				self compile: 'testAcceptance', check hash, ' ', check].
		str nextPut: $}]).