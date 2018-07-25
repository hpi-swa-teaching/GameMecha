storing
storeChecksInInstanceOf: aClass
	"meta-programming warning"
	self cleanupClass: aClass.
	aClass class compile: (String streamContents: [:str |
		str nextPutAll: 'collisionSelectors' , String cr, String tab , '^ {'.
		self collisionChecks
			do: [:check |
				str nextPutAll: '#testAcceptance'. check hash storeOn: str. str nextPut: $..
				aClass compile: 'testAcceptance', check hash, ' ', check].
		str nextPut: $}]).